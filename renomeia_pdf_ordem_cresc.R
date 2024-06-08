###'-------------------- script de automatizacao -----------------------------
###'
###'
###'  automatiza o processo de renomeiacao de pdfs
###'
###'
###' AUTOR: ADRIANO NETO, EM 11/04/2023
###' 
###' OBJETIVO: automatiza o processo de renomeiacao de pdfs
###' 
###'-----------------------------------------------------------------------------------------------------------

# ---- Limpar o ambiente --------------------------------------------------

# Limpa o ambiente
rm(list = ls())


# ---- Carregar/instalar os pacotes necessarios ---------------------------

# Cria vetor com o nome dos pacotes necessarios 
pacotes = c("tidyverse",
            "pdftools",
            "readxl",
            "dplyr",
            "stringr",
            "gtools")



# Carrega ou instala os pacotes
## Se o pacote ja estiver instalado, ele sera carregado
## Caso contr?rio, ele sera instalado e carregado
for (x in pacotes) {
  if(!x %in% installed.packages()) {
    install.packages(x, repos = "http://cran.us.r-project.org")
  }
}

lapply(pacotes, require, character.only = T)

rm(pacotes, x)




# Lista os arquivos PDF na pasta e ordena-os numericamente
# Para utilizar outra pasta, basta apenas alterar o caminho abaixo
# Sem esquecer de alterar sempre as barras de \ para o formato /
arquivos_pdf <- mixedsort(list.files("C:/Users/usuario/Downloads/", pattern = "\\.pdf$", full.names = TRUE))

# Inverter a ordem dos nomes dos arquivos
arquivos_pdf <- rev(arquivos_pdf)

print(arquivos_pdf)

# Carregue a planilha com os nomes em formato .xlsx
# Para alterar a planilha a ser utilizada como base
# apenas altere o caminho se atentando as barras \ / e acrescentando no final
# o nome do arquivo .xlsx
nomes <- read_excel("C:/Users/usuario/Downloads/lista_nomes.xlsx")

# Verifique se o número de arquivos PDF corresponde ao número de nomes na lista
if (length(arquivos_pdf) != nrow(nomes)) {
  stop("O número de nomes na lista não corresponde ao número de arquivos PDF.")
}

# Renomeia os arquivos PDF mantendo a ordem
for (i in seq_along(arquivos_pdf)) {
  novo_nome <- paste0("C:/Users/Pichau/Downloads/ilovepdf_split/", nomes[i, "nomes"], ".pdf")
  file.rename(arquivos_pdf[i], novo_nome)
}








