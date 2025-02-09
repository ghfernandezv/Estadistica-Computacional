setwd("C:/Users/USUARIO/Documents/GitHub/Estadistica-Computacional/Semana 2/dataset3")
# libreria
library(tidyverse)

# datos ----
sets <- readRDS(file = "sets.rds")
themes <- readRDS(file = "themes.rds")
inventories <- readRDS(file = "inventories.rds")
part_categories <- readRDS(file = "part_categories.rds")
parts <- readRDS(file = "parts.rds")
colors <- readRDS(file = "colors.rds")
inventory_parts <-readRDS(file = "inventory_parts.rds")

# data frame
clientes <- data.frame(ClienteId = c(1:4), 
                       RazonSocial = c("Cliente 1", "Cliente 2", "Cliente 3", "Cliente 4"))

ventas <-  data.frame(ClienteId = c(1, 2, 3, 5), 
                      Monto = c(110, 50, 60, 90))

# Inner join ----
# Esta cl?usula busca coincidencias entre 2 tablas, en funci?n a una 
# columna que tienen en com?n. De tal modo que s?lo la intersecci?n 
# se mostrar? en los resultados.

clientes %>%
  inner_join(ventas,by="ClienteId") #esto es la intersección, el left es unión.

# Ejemplo 1 ----
sets %>%  
  inner_join(themes, by = c("theme_id" = "id"))

# Ejemplo 2 ----
sets %>%   inner_join(themes,
                      by = c("theme_id" = "id"), 
                      suffix = c("_set", "_theme")) %>%
  head(n=2)

# Ejemplo 3 ----
# numero de temas comunes
sets %>%  
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme")) %>%
  count(name_theme, sort = TRUE) %>%
  head(20)

# Ejercicio 1 ----
parts %>% 
  # una las columnas adecuadas con el dataset part_categories y cambien .x y .y por c("_part","_category")
  inner_join(part_categories, by = c("part_cat_id" = "id"), suffix = c("_part", "_category"))


# Ejemplo 4 ----
sets %>%
  inner_join(inventories, by="set_num") %>%
  inner_join(themes, by =c("theme_id"="id"),suffix=c("_set","_theme"))

# Ejericicio 2 ----
# ?Cu?l es el color m?s com?n de una pieza de LEGO?"
sets %>%
  # Adiciona inventories usando inner join 
  inner_join(inventories, by="set_num") %>%
  # Adiciona inventory_parts usando an inner join 
  inner_join(inventory_parts, by=c("id"="inventory_id")) %>%
  # Adiciona colors usando an inner join y usA suffix = C("_set","_color")
  inner_join(colors, by=c("color_id"="id"), suffix = c("_set", "_color")) %>%
  # Cuente la columna nombre_color y ordene los resultados para que los colores m?s destacados aparezcan primero.
  count(name_color, sort=TRUE)


# Left join ----
# A diferencia de un INNER JOIN, donde se busca una intersecci?n 
# respetada por ambas tablas, con LEFT JOIN damos prioridad a la tabla 
# de la izquierda, y buscamos en la tabla derecha.

# Si no existe ninguna coincidencia para alguna de las filas de la tabla
# de la izquierda, de igual forma todos los resultados de la primera 
# tabla se muestran.

clientes %>%
  left_join(ventas,by="ClienteId") #Aquí me va a colocar la tabla iqzuiera completa, pero donde me coincida colocame la variable de la tabla derecha, si no hay coincidencia me coloca vacío.

# Ejemplo 1 ----
inventory_parts_joined <- inventories %>% 
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>% 
  select(-id, -version) %>% 
  arrange(desc(quantity))

inventory_parts_joined

batmobile <- inventory_parts_joined %>%   
  filter(set_num == "7784-1") %>%
  select(-set_num)

batwing <- inventory_parts_joined %>% 
  filter(set_num == "70916-1") %>%
  select(-set_num)

batmobile %>%  
  left_join(batwing, by = c("part_num", "color_id"), 
            suffix = c("_batmobile", "_batwing"))%>%
  replace_na(list(quantity_batwing=0))

# Ejercicio 5 ----

# Filtra de inventory_parts_joined la pieza "7965-1": millennium_falcon 
... <- ... %>%
       ...

# Filtra de inventory_parts_joined la pieza "75190-1": star_destroyer 
... <- ... %>%
       ...
  
# Combine las tablas star_destroyer y millennium_falcon, tomando solo star_destroyer, 
# en las columnas part_num y color_id con los sufijos _falcon y _star_destroyer.
...%>%
  ...

# Ejercicio 6 ----
# a) Agregue Millennium Falcon para la cantidad total de cada color
millennium_falcon_colors <- millennium_falcon %>%
  group_by(...) %>%
  summarize(total_quantity = ...)

# b) Agregue Star Destroyer for the total quantity in each color
star_destroyer_colors <- star_destroyer %>%
  group_by(...) %>%
  summarize(total_quantity = ...)

# c) Unir a la izquierda los dos conjuntos de datos, millennium_falcon_colors y star_destroyer_colors,
# utilizando la columna color_id y los sufijos _falcon y _star_destroyer

millennium_falcon_colors %>%
  ...

# right join ----
# En el caso de RIGHT JOIN la situaci?n es muy similar a lo anterior,
# pero aqu? se da prioridad a la tabla de la derecha.

clientes %>%
  right_join(ventas,by="ClienteId")

# Ejemplo 1 ----
sets %>%  
  count(theme_id, sort = TRUE) %>%
  right_join(themes, by = c("theme_id" = "id")) %>%
  replace_na(list(n = 0))

# Ejercicio 7 ----
parts %>%
  #Use count para contar cada part_cat_id de la data parts
  ... %>%
  # Use un right_join para unir part_categories. Tendr? que utilizar el 
  # part_cat_id de la cuenta y la columna id de part_categories.
  ... %>%
  # filtra donde la columna n es NA.
  ...

# full join ----
# El full join, o uni?n completa, combina todas las 
# columnas de ambos conjuntos de datos en uno para 
# todos los elementos

clientes %>%
  full_join(ventas,by="ClienteId")


# Ejemplo 1 ----
batmobile %>% 
  full_join(batwing, by = c("part_num", "color_id"), 
            suffix = c("_batmobile", "_batwing")) %>% 
  replace_na(list(quantity_batmobile = 0,
                  quantity_batwing = 0))

# Ejercicio 8 ----
inventory_sets_themes <- inventory_parts_joined %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

# a. filtra inventory_sets_themes por el nombre del tema Batman: batman
... %>%
  ...

# b. filtra inventory_sets_themes por el nombre del tema Star Wars: star_wars
... %>%
  ...

# c. contar el numero de partes y color id, pesado por quantity: batman_parts y star_wars_parts
... %>%
  ...

... %>%
  ...

# d.
batman_parts %>%
  # Combine la tabla star_wars_parts , use el argumento suffix 
  # para incluir los nombres "_batman" y "_star_wars"
  ...%>%
  # Reemplaza los NAs con 0s en las columnas n_batman y n_star_wars  
  ...

# semi_join ----
# Los SEMI JOINs nos permiten filtrar observaciones
# en lugar de variables. 

clientes %>%
  semi_join(ventas,by="ClienteId") #es una intersección de A y B pero sacando los elementos de B. Le da prioridad a A.


clientes %>%
  filter(ClienteId %in% ventas$ClienteId)

# anti_join ----
# El ANTI JOIN es el mecanismo inverso al SEMI JOIN. Su finalidad 
# consiste en identificar aquellas observaciones que no se 
# encuentran en el segundo dataset.

clientes %>%
  anti_join(ventas,by="ClienteId") #lo que me coincide, no me lo coloca. Siempre se trabaja con los elementos de A.

library(Hmisc)
clientes %>%
  filter(ClienteId %nin% ventas$ClienteId)
