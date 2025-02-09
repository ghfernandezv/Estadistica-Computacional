# 03 de febrero de 2023

#libreria----
library(tidyverse)

# datos ----

url_dat <-"https://docs.google.com/spreadsheets/d/e/2PACX-1vTxMFXeL7DtF7ie6hEjdQqdNV3-KYtdEyVkZfCtpV0l65X-nLp1dEqEbSkUcG0HJGGuDKyFhslbzfIz/pub?gid=0&single=true&output=tsv"
datos <- read.delim(url_dat)
datos$Grupo <- factor(datos$Grupo,levels=c("DCLA","DCLNA","Control"))

# estructura de los datos ----
str(datos)

# Edad ----
resumen_total = datos %>% 
  summarise( n = length(Edad), prom = mean(Edad), 
             ds = sd(Edad), 
             mediana = median(Edad), 
             minimo = min(Edad), maximo = max(Edad), ri = IQR(Edad)) %>% 
mutate (Grupo = 'total') %>% select(Grupo, n, prom, ds, mediana, minimo, maximo, ri)

# Edad seg?n los niveles de deterioro----
resumen_grup= datos %>% 
  group_by(Grupo) %>% 
  summarise( n = length(Edad), prom = mean(Edad), 
             ds = sd(Edad), 
             mediana = median(Edad), 
             minimo = min(Edad), maximo = max(Edad), ri = IQR(Edad))
resumen <- rbind(resumen_grup, resumen_total)
# diagrama de cajas de la edad ----


# sexo ----


# diagrama de barras seg?n los niveles ----

