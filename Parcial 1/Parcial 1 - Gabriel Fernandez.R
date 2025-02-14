# Ejercicio 1 ----
set.seed(2025)
vector_chi= rchisq(30, df = 50)
## Inciso i ----
mediana_vector_chi = median(vector_chi)
promedio_vector_chi = mean(vector_chi)
rango = max(vector_chi)-min(vector_chi)

## Inciso ii ----
vector_chi_reduce = vector_chi[vector_chi>promedio_vector_chi]

## Inciso iii ----
vector_chi_reduce_ordered= vector_chi_reduce[order(vector_chi_reduce, decreasing = FALSE)]

## Inciso iv ----
vector_chi_reduce_ordered[vector_chi_reduce_ordered >= 10 & vector_chi_reduce_ordered <=20]
# dado que el anterior vector no tiene números entre 10 y 20
# se extraen los valores que se encuentran en la posición 10:20 del vector original
vector_chi[10:20]

# Ejercicio 2 ----

## Inciso i ----
help("faithful")
help('OrchardSprays') # ambos se encuentran dentro del paquete datasets de R.

## Inciso ii ----
str(faithful)
summary(faithful)
# faithful : habla sobre el tiempo de espera entre erupciones y la duración de la erupción
#            para el Old Faithful geyser en Yellowstone. Contiene 272 observaciones y dos variables,
#            las erupciones tardan en promedio 3.48 minutos, mientras que el tiempo entre erupciones
#            dura, en promedio, 70.9 minutos.

str(OrchardSprays)
summary(OrchardSprays)
# OrchardSprays : habla sobre eficacia de diferentes tratamientos químicos para repeler abejas.
#                Contiene 64 observaciones y 4 variables, las cuales son: rowpos y colpos, 
#                (entiendase como posición de la muestra en la colmena), decrease
#               (entiendase son número de insectos eliminados) y treatment (el tipo de tratamiento).

## Inciso iii ----
library(tidyverse)
str(faithful)
view(faithful)
summary(faithful$eruptions) # aquí sabemos cuales son los valores que dividen cada cuartil
faithful %>% 
  mutate (categoria = case_when(
    eruptions < 2.163 ~ "tiempo bajo",
    eruptions >= 2.163 & eruptions < 4 ~ "tiempo medio",
    eruptions >= 4 & eruptions < 4.454 ~ "tiempo medio - alto",
    eruptions >= 4.454 ~ "tiempo alto"
  )) %>%
  group_by(categoria) %>% 
  summarise( prom = mean(waiting, na.rm = TRUE), 
             ds = sd(waiting, na.rm = TRUE), 
             minimo = min(waiting, na.rm = TRUE), maximo = max(waiting, na.rm = TRUE))

# Ejercicio 3 ----
sentence <- "coding is a skill that requires practice"
chars = unlist(strsplit(sentence,''))
cont=0
for (letra in chars){
  if (letra == 'c'){
    cont=cont+1
  } else if(letra == 'p'){
    break
  } else {
    next
  }
}
print(cont)

# Ejercicio 4 ----
moneda = c('cara','sello')
i = 0
cont = 1
historial = c()
final = FALSE
while(cont <= 3){
  historial= c(historial, sample(moneda, 1))
  cont = cont+1
  i = i+1
} 
while (final == FALSE){
  if (historial[i-2]=='cara' & historial[i-1]=='sello'& historial[i]=='cara'){
    final = TRUE
    print(historial)
  } else {
    cont = cont+1
    i = i+1
    historial=c(historial, sample(moneda, 1))
}
}

# Ejercicio 5 ----
r_i_c = function (){
datos = sort(runif(60, min = 0, max = 1))
n = length(datos)
cua_1 = 1+0.25*(n-1)
cua_2 = 1+0.5*(n-1)  
cua_3 = 1+0.75*(n-1)
q1 = datos[floor(cua_1)]+((cua_1-floor(cua_1))*(datos[floor(cua_1)+1]-datos[floor(cua_1)]))
q2 = datos[floor(cua_2)]+((cua_2-floor(cua_2))*(datos[floor(cua_2)+1]-datos[floor(cua_2)]))
q3 = datos[floor(cua_3)]+((cua_3-floor(cua_3))*(datos[floor(cua_3)+1]-datos[floor(cua_3)]))
IQR = q3 - q1

respuesta = paste("El rango intercuartílico del conjunto de datos generados es:", round(IQR, 4))
return(respuesta)
}

r_i_c()

# Ejercicio 6 ----
## Inciso i
setwd("C:/Users/USUARIO/Documents/GitHub/Estadistica-Computacional/Parcial 1/Datos")
df <- read.delim('fish_capture.txt',
                   sep = "",stringsAsFactors = TRUE)
str(df)
summary(df)
df %>% 
  slice(1:4)

## Inciso ii
df %>% 
  mutate(especie = case_when(
    especie == "f01" ~ "trucha",
    especie == "f02" ~ "tilapia"
  ))

## Inciso iii
df %>%   
  filter(cantidad != 6)%>%
  top_n(5,cantidad)

## Inciso iv
lago = c("lago1", "lago2", "lago1", "lago2")
metodo = c("Red de arrastre", "L´ınea de mano", "Ca~na", "Red fija")
fishing_methods = data.frame(lago, metodo)
#lo que haré a continuación será crear una columna adicional dado que para 
#los distintos lagos, existe más de un método de pesca
fishing_methods_unificado = fishing_methods %>%
  group_by(lago) %>%
  summarise(
  metodo_de_pesca_1 = first(metodo),
metodo_de_pesca_2 = nth(metodo, 2, default = NA)
)
  
fishing_analysis= df %>%
  left_join(fishing_methods_unificado,by="lago")
print(fishing_analysis)

## Inciso v
final_fishing1 = fishing_analysis %>% 
  group_by(metodo_de_pesca_1) %>% 
  summarise(total_cantidad = sum(cantidad))

final_fishing2 = fishing_analysis %>% 
  group_by(metodo_de_pesca_2) %>% 
  summarise(total_cantidad = sum(cantidad))

# En este caso, da lo mismo sumar final_fishing 1 o 2 dado que ambos contabilizan lo mismo
final_fishing2  %>% summarise(totalfinal = sum(total_cantidad))

#En total se capturaron : 243 peces.
