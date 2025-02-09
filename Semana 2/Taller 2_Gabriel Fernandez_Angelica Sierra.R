#TALLER 2--------------------------------------------------------------------------
#http://rpubs.com/aecerpa/1269677
##Ejercicio 1. Swimming Pools----
# Importar Swimming_pools.csv: pools
setwd("C:/Users/USUARIO/Documents/GitHub/Estadistica-Computacional/Semana 2/dataset")
df_Angie=read.csv("swimming_pools.csv",stringsAsFactors = TRUE)
# imprimir la estructura de pools
str(df_Angie)
summary(df_Angie)
print(df_Angie)


##Ejercicio 2. Hotdogs -------------------------------------------------------------
# Importar hotdogs.txt
df_hotdogs_txt=read.delim("hotdogs.txt",sep="",stringsAsFactors = FALSE)
str(df_hotdogs_txt)
summary(df_hotdogs_txt)
# Resumen hotdogs
summary(df_hotdogs_txt)
print(df_hotdogs_txt)

##Ejercicio 3. hotdogs con enunciados-------------------------------------------------
#Importe hotdogs.txt file con read.table 
df_Hotdogs_TABLE=read.table("hotdogs.txt",header=TRUE,sep="",stringsAsFactors = TRUE)
str(df_Hotdogs_TABLE)
#coloque los titulos a las columnas (type,calories,sodium)usaremosla funcion setNames:
df_Hotdogs_TABLE= setNames(df_Hotdogs_TABLE,c("type", "calories", "sodium"))
summary(df_Hotdogs_TABLE)
#Muestre 7 filas de hotdogs
df_Hotdogs_TABLE[1:7, c("type", "calories","sodium")]
#Selecciona el perro caliente con más calorías (which.min): Tom
max_calories= -Inf  
max_index=1  
for (i in 1:nrow(df_Hotdogs_TABLE)) {
  if (df_Hotdogs_TABLE[i, "calories"] > max_calories) {
    max_calories=df_Hotdogs_TABLE[i, "calories"]
    max_index =i  
  }
}
Tom=df_Hotdogs_TABLE[max_index, c("type", "calories","sodium")]# Extrae el tipo y calorías
print(Tom)
print(paste("Levels:", paste(levels(df_Hotdogs_TABLE$type), collapse = " ")))
# Selecciona el perro caliente con menos calorías (which.max): Lily
min_calories= Inf  
min_index=1  
for (i in 1:nrow(df_Hotdogs_TABLE)) {
  if (df_Hotdogs_TABLE[i, "calories"] < min_calories) {
    min_calories=df_Hotdogs_TABLE[i, "calories"]
    min_index =i  
  }
}
Lili=df_Hotdogs_TABLE[min_index, c("type", "calories","sodium" )]# Extrae el tipo y calorías
print(Lili)
print(paste("Levels:", paste(levels(df_Hotdogs_TABLE$type), collapse = " ")))

##Ejercicio 4. Urban Pop --------------------------------------------------------------
# imprime los nombres de todos los sheets de los datos urbanpop.xlsx
library(readxl)
sheets=excel_sheets("urbanpop.xlsx")
# carga todos los sheet, 1 por 1 y ponlos en una lista: pop_list
df_1960_1996= read_excel("urbanpop.xlsx",sheet = "1960-1966")
df_1967_1974= read_excel("urbanpop.xlsx",sheet = "1967-1974")
df_1975_2011= read_excel("urbanpop.xlsx",sheet = "1975-2011")
pop_list = list(
  "1960-1966" = df_1960_1996,
  "1967-1974" = df_1967_1974,
  "1975-2011" = df_1975_2011
)
# realiza los anterior con la funcion lapply
pop_list=lapply(sheets, read_excel, path = "urbanpop.xlsx")
# muestra la estructura de pop_list
str(pop_list)
# Importe la segunda hoja de "urbanpop.xlsx", pero omita las primeras 21 filas.
read_excel("urbanpop.xlsx", sheet = "1967-1974", skip = 21)

##Ejercicio 5. Densidad --------------------------------------------------------------
install.packages("tidyverse")
library(tidyverse)
counties=readRDS(file="C:/Users/Angelica Elena/Desktop/Estadistica Computacional/2. Manipulación/dataset/counties.rds")
counties#imprimir
counties$state=factor(counties$state)
counties %>%  
  # selecciona las columnas (state, county, population, land_area)
  select(state, county, population, land_area) %>% 
  # realiza grupos por estados
  group_by(state) %>%
  # calcula el total del area y el total de la poblacion
  summarize(totalpol = sum(population),
            totalar = sum(land_area))%>%
  # Adiciona la columna density: es el numero de personas por metro cuadrado
  mutate(density= totalpol / totalar)%>%
  # Ordena de manera descendiente density
  count(state, wt = density, sort = TRUE)

##Ejercicio 6. Trabajadores que Caminan--------------------------------------------
counties %>%
  # selecciona las columnas (region, state, county, metro, population, walk)
  select(region, state, county, metro, population, walk) %>% 
  # realiza grupos por region
  group_by(region) %>%
  # Encuentra el numero mas grande ciudadanos que caminan para trabajar
  top_n(1,walk)

##Ejercicio 7. Ingreso mas Alto---------------------------------------------------
counties %>%
  # selecciona las columnas (region, state, county, metro, population, walk)
  select(region, state, county, metro, population, walk, income) %>% 
  # realiza grupos por region y estado
  group_by(region,state) %>%
  # Calcula el promedio income
  summarize(prom_income = mean(income))%>%
  # Encuentre el ingreso mas alto por estado en cada region
  top_n(1,prom_income)

##Ejercicio 8. Personas en areas Metrop y No Metrop--------------------------------------
counties %>%
  # selecciona las columnas (state, county, population, land_area) 
  select(state, county, population, metro, land_area) %>%
  # Encuentre la poblacion total por la cada estado y metro
  group_by(state, metro) %>%
  mutate(total_population = sum(population)) %>%
  # Extrae la fila con mas poblaci?n por estado 
  top_n(1,total_population)%>%
  # # Cuenta los estados con mas personas en areas metropolitanas o no metropolitanas
  count(metro, wt = total_population, sort = TRUE)

##Ejercicio 9. Personaldel trabajo Publico--------------------------------------------
counties %>%
  # Selecciona el estado, el condado, la población y los que terminan en "trabajo
  select(state, county, population, ends_with("work")) %>%
  # Filtrar los condados que tienen al menos el 50% de la población dedicada al trabajo público
  filter(public_work>=50)


##Ejercicio 10. Renombre de Columna n-------------------------------------------------
counties %>%
  # Cuente el número de condados de cada estado
  select(state, county) %>% group_by(state) %>%   count(state) %>% 
  # renombrar la columna n por num_counties
  rename(num_counties = n)

##Ejercicio 11. Densidad Ordenada------------------------------------------------------
counties %>%
  # Mantenga las columnas de state, state, county, y population, 
  # y agregue la columna density (poblacion por metro cuadrado (land_area))
  transmute(state, county, population, density  = population/land_area) %>% 
  # Filtrar por county con una población superior a un millón 
  filter(population>1000000) %>% 
  # Ordena la densidad en orden ascendente 
  arrange(density)



