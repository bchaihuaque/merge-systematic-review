#*****************************************************************************
##### Proyecto  : Revisión Sistemática                      ##################
#**** Autor     : Bruno Chaihuaque Dueñas                   ******************
#**** Email     : bchaihuaque@pucp.pe                       ******************
#**** Fecha     : 04/05/2022                                ******************
#*****************************************************************************


# ***************************************************************************
# Configuración inicial ====
# ***************************************************************************
# ├  Limpiando y seteando espacio de trabajo ====
rm(list = ls())
setwd("D:/Doctorado/Dissertation/Systematic-Review")
system("java -version")
# ├ Instalando paquetes y activando librerias ====
library(bibliometrix)
if(!require(openxlsx)){
  install.packages("openxlsx")
  library(xlsx)
}
# ├ Convirtiendo data en excel ====
biblioshiny()
# ***************************************************************************
# Carga de datos ====
# ***************************************************************************
Bibliometrix_wos <- read_excel("Bibliometrix-wos.xlsx")
Bibliometrix_scopus <- read_excel("Bibliometrix-scopus.xlsx")

# ├ Combinando la data ====
combined <- mergeDbSources(Bibliometrix_wos, Bibliometrix_scopus, remove.duplicated = T)
# ├ Análisis ====
results<-biblioAnalysis(combined)
summary(results)
summary.bibliometrix_netstat
plot(results, k=10, pause=FALSE)
# ***************************************************************************
# Exportación de datos ====
# ***************************************************************************
write.xlsx(combined, file = "merged.xlsx", asTable = FALSE, overwrite = T)
