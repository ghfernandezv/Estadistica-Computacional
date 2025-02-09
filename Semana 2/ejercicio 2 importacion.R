setwd("C:/Users/USUARIO/Documents/GitHub/Estadistica-Computacional/Semana 2/dataset")
df <- read.csv("states.csv")
df <- read.csv("states.csv",
               stringsAsFactors = TRUE)
# Ejercicio 4 ----
library(readxl)
# imprime los nombres de todos los sheets de los datos urbanpop.xlsx
sheets= excel_sheets("urbanpop.xlsx")

# carga todos los sheet, 1 por 1 y ponlos en una lista: pop_list
df_1960_1996= read_excel("urbanpop.xlsx",
                     sheet = "1960-1966")

df_1967_1974 = read_excel("urbanpop.xlsx",
                     sheet = "1967-1974")

df_1975_2011= read_excel("urbanpop.xlsx",
           sheet = "1975-2011")

pop_list = list(
  "1960-1966" = df_1960_1996,
  "1967-1974" = df_1967_1974,
  "1975-2011" = df_1975_2011
)

# realiza los anterior con la funcion lapply
pop_list <- lapply(sheets, read_excel, path = "urbanpop.xlsx")


# muestra la estructura de pop_list
str(pop_list)

# Importe la segunda hoja de "urbanpop.xlsx", 
# pero omita las primeras 21 filas.
read_excel("urbanpop.xlsx", sheet = "1967-1974", skip = 21)
