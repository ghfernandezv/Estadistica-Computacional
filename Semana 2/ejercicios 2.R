library(tidyverse)
counties <- readRDS(file = "C:/Users/USUARIO/Documents/GitHub/Estadistica-Computacional/Semana 2/dataset2/counties.rds")
counties$state = factor(counties$state)
# imprimir
counties
# Ejercicio 4 ----
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

# Ejercicio 5 ----
counties %>%
  # selecciona las columnas (region, state, county, metro, population, walk)
  select(region, state, county, metro, population, walk) %>% 
  # realiza grupos por region
  group_by(region) %>%
  # Encuentra el numero m?s grande ciudadanos que caminan para trabajar
  top_n(1,walk)

# Ejercicio 6 ----
counties %>%
  # selecciona las columnas (region, state, county, metro, population, walk)
  select(region, state, county, metro, population, walk, income) %>% 
  # realiza grupos por region y estado
  group_by(region,state) %>%
  # Calcula el promedio income
  summarize(prom_income = mean(income))%>%
  # Encuentre el ingreso m?s alto por estado en cada region
  top_n(1,prom_income)

# Ejercicio 7 ----
counties %>%
  # selecciona las columnas (state, county, population, land_area) 
  select(state, county, population, metro, land_area) %>%
  # Encuentre la poblacion total por la cada estado y metro
  group_by(state, metro) %>%
  mutate(total_population = sum(population)) %>%
  # Extrae la fila con mas poblaci?n por estado 
  top_n(1,total_population)%>%
  # # Cuenta los estados con m?s personas en ?reas metropolitanas o no metropolitanas
  count(metro, wt = total_population, sort = TRUE)

# Ejercicio 8 ----
counties %>%
  # Selecciona el estado, el condado, la población y los que terminan en "trabajo
  select(state, county, population, ends_with("work")) %>%
  # Filtrar los condados que tienen al menos el 50% de la población dedicada al trabajo público
  filter(public_work>=50)


# Ejercicio 9 ----
counties %>%
  # Cuente el número de condados de cada estado
  select(state, county) %>% group_by(state) %>%   count(state) %>% 
# renombrar la columna n por num_counties
rename(num_counties = n)

# Ejercicio 10 ----
counties %>%
  # Mantenga las columnas de state, state, county, y population, y agregue la columna density (poblacion por metro cuadrado (land_area))
  transmute(state, county, population, density  = population/land_area) %>% 
  # Filtrar por county con una población superior a un millón 
filter(population>1000000) %>% 
  # Ordena la densidad en orden ascendente 
 arrange(density)
  