## baixando os dados de geometria espacial dos municípios do ES - 2010

install.packages(c("geobr", "tidyverse", "haven", "writexl"))
library(sf)
library(geobr)
library(tidyverse)

# puxando os dados de todos os municípios (5567) do Brasil - para extrair as coordenadas (geometria do estado)
# vamos imaginar que gostaríamos dos dados do IDHM dos municípios, mas com o objetivo principal de extrair os dados espaciais
idhm_2010 <- read_municipality(code_muni = "all", year=2010)

# criando um banco com os dados (geometria) espaciais dos 78 municípios do ES / para fazer análise espacial
dados_IDHM_ES <- idhm_2010 %>% filter(abbrev_state == "ES")

# importar banco mãe
dados_ES_para_merge <- read_excel("Documents/dados_ES_para_merge.xlsx")
# renomeando variável v.1.6, pois no stata não funciona o nome com ponto
library(dplyr)
dados_ES_para_merge <- dados_ES_para_merge %>%
  rename(NOME_MUNICIPIO = V.1.6)

# nomear a variável COD_MUNICIPIO_7dig code_muni (igual ao banco que quer juntar - codigo do IBGE do municipio com 7 digitos)
# no banco dados_IDHM_ES é code_muni, então vamos criar uma nova variável chamada code_muni
dados_ES_para_merge <- dados_ES_para_merge %>%
  rename(code_muni = COD_MUNICIPIO_7dig)

# juntar dados_ES_para_merge com dados_IDHM_ES
# Realizando o merge (junção à esquerda) dos dados do banco criado e da geometria espacial do ES
library(readxl)
# realizando o merge
banco_merge_completo <- left_join(dados_ES_para_merge, dados_IDHM_ES, by = "code_muni")
# Repare que o banco ficará com duas colunas com o nome do município

#salvar como um banco a ser disponibilizado 
# salvando o banco de dado
library(haven)
library("writexl")
# salvando o banco após merge para o formato xlsx
write_xlsx(banco_merge_completo, "bancocompletoDADOSES.xlsx")

# Para salvar o banco de dados no Stata, precisamos renomear as variáveis: 
# pois o stata não aceita a nomenclatura com ponto
#code_state
# renomeando a variável code_state.x
banco_merge_completo <- banco_merge_completo %>%
  rename(code_state_x = code_state.x)
# renomeando a variável code_state.y
banco_merge_completo <- banco_merge_completo %>%
  rename(code_state_y = code_state.y)
# outras colunas possuem tipos que o stata não suporta, por exemplo os dados de geometria espacial.
# precisa excluir aquelas últimas colunas

# salvando o banco após merge para o Stata
write_dta(banco_merge_completo, path = "dadosES_stata.dta", version = 13)
