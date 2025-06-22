Descrevo abaixo o conteúdo da pasta

1. *bancoIDHMemExcel1* - banco de dados para o ES capturado pelo pacote geobr.
Nesse arquivo disponibilizado na pasta, não consegue ver a coluna de geometria espacial para as análises, mas no arquivo do R consegue ver essa informação.

2. *baixando e salvando dados de idhm*
Script do R ensinando como juntar o banco de dados criado com um banco de dados que possui uma coluna com os dados de geometria espacial

4. *bancocompletoDADOS ES* - banco criado após merge por Bruna Venturin, as seguintes informações estão presentes:
Nome dos municípios do ES;
código do estado do ES pelo IBGE;
Código do município do ES pelo IBGE com 6 digítos;
Código do município do ES pelo IBGE com 7 digítos;
Código criado para Região de Saúde que o município pertence, sendo 1 - Central Norte; 2 - Metropolitana; 3 - Sul;
Nome da Região de Saúde - Central Norte; Metropolitana; Sul;
Classificação Índice de Vulnerabilidade Social (IVS) do município;
HAB_2022: Número de habitantes do Município segundo o Censo de 2022, dados retirados da planilha de cofinanciamento federal da APS;
Porte populacional do município , dados retirados da planilha de cofinanciamento federal da APS;
Classificação IED, dados retirados da planilha de cofinanciamento federal da APS;
Rank_IBP_região - posição do município no IBP – Índice Brasileiro de Privação da região (Sudeste), criado pelo CIDACS;
Rank_IBP_UF - posição do município no IBP – Índice Brasileiro de Privação dentro da UF (ES), criado pelo CIDACS;
Rank_IBP_br - posição do município no IBP – Índice Brasileiro de Privação do país, criado pelo CIDACS;

5. *Merge do banco dos municípios do ES para extrair geom espacial* - o arquivo é um script no Rmarkedown que informa como capturar a geometria espacial dos municípios do ES através do pacote geobr. Utilidade: fazer análises espaciais
