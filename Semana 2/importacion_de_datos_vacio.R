# importar con libreria read.csv ----
setwd("C:/Users/USUARIO/Documents/GitHub/Estadistica-Computacional/Semana 2/dataset")
df <- read.csv("states.csv")
df <- read.csv("states.csv",
               stringsAsFactors = TRUE)

str(df)
summary(df)

# importar con la libreria read.delim ----
df_2 <- read.delim('states.txt',
                    sep = "",stringsAsFactors = TRUE)
str(df_2)
summary(df_2)

# importar con la libreria read.table ----
df_3 <- read.table("states3.txt", header = TRUE,
                   sep = "/",
                   stringsAsFactors = TRUE)

str(df_3)
summary(df_3)

# otra forma de importar los datos states.csv ----
df_4 <- read.table("states.csv", 
                   header = TRUE, sep = ",",
                   stringsAsFactors = TRUE)
str(df_4)
summary(df_4)

# importar con libreria read.csv2 ----
df_5 <- read.csv2("states.csv",
                  sep = ",",stringsAsFactors = TRUE)
str(df_5)
summary(df_5)


# Ejercicio 1 ----
# Importar swimming_pools.csv: pools
df_6 <- read.csv("swimming_pools.csv")
df_6 <- read.csv("swimming_pools.csv",
               stringsAsFactors = TRUE)

# imprimir la estructura de pools
str(df_6)
summary(df_6)
# Ejercicio 2 ----
# Importar hotdogs.txt: hotdogs
df_7 <- read.table("hotdogs.txt", header = FALSE,
                   sep = "",
                   stringsAsFactors = TRUE, col.names=c('Carnes','Unidades','Gramos'))
str(df_7)
summary(df_7)

# Muestre 7 filas de hotdogs
head(df_7,7)

# Selecciona el perro caliente con menos calorías (which.min): lily
which.min(df_7$Unidades)
df_7[50,]
# Selecciona el perro caliente con más calorías (which.max): tom
which.max(df_7$Unidades)
df_7[34,]
# otro paquete para importar datos ----
install.packages("readr")
library(readr)

df_6 <- read_csv("states.csv")
head(df_6, n=7)

df_7 <- read_delim("states2.txt",delim="/")
tail(df_7,n=7)

# argumento col_names ----
df_8 <- read_delim("states3.txt",
                   delim="/", col_names = FALSE)
tail(df_8,n=7)

df_8 <- read_delim("states3.txt",
                   delim="/",
                   col_names = c("state", "city", "pop", "area"))
head(df_8,n=2)

# argumento col_types ----
df_8 <-read_delim("states3.txt",
           delim="/",
           col_names = c("state", "city", "pop", "area"),
           col_types = "ffdi")
head(df_8,n=2)
summary(df_8)

# argumento skip y n_max ----
df_8 <-read_delim("states3.txt",
                  delim="/",
                  col_names = c("state", "city", "pop", "area"),
                  col_types = "ff",
                  skip=2,n_max=2) # omite las dos primeras filas y muestrame máximo 2 filas
df_8

# Estudiar el paquete data.table usando la funcion fread ---

# libreria para datos en excel ----
install.packages("readxl")
library(readxl)

# nombre de las hojas
excel_sheets("cities.xlsx")

# cargar los datos por defecto toma la primera hoja
read_excel("cities.xlsx")

df_1990 = read_excel("cities.xlsx",
           sheet = "year_1990")
df_1990$year= 1990
df_2000 = read_excel("cities.xlsx",
                     sheet = "year_2000")
df_2000$year= 2000
read_excel("cities.xlsx",
           sheet = "year_2000",skip=1)

df=rbind(df_1990,df_2000)


# Ejercicio 4 ----
# imprime los nombres de todos los sheets de los datos urbanpop.xlsx

# carga todos los sheet, 1 por 1 y ponlos en una lista: pop_list

# realiza los anterior con la funcion lapply

# muestra la estructura de pop_list

# Importe la segunda hoja de "urbanpop.xlsx", 
# pero omita las primeras 21 filas.

# Tarea leer sobre el paquete gdata ----

# Plus
install.packages("XLConnect")
library(XLConnect)

# Contruir conexion a urbanpop.xlsx: my_book
my_book <-  loadWorkbook("urbanpop.xlsx")

# clase que es
class(my_book)

# Lista de sheets en my_book
getSheets(my_book)

# Importa el segundo sheet en my_book
readWorksheet(my_book, sheet = "1967-1974")

# Importar columnas 3, 4, and 5 del segundo sheet en my_book: urbanpop_sel
urbanpop_sel <- readWorksheet(my_book, sheet = 2,startCol = 3,endCol=5)

# Adicionar un sheet a my_book, llamado "data_summary"
createSheet(my_book, name = "data_summary")

# Crear data frame: summ
sheets <- getSheets(my_book)[1:3]
dims <- sapply(sheets, function(x) dim(readWorksheet(my_book, sheet = x)), USE.NAMES = FALSE)
summ <- data.frame(sheets = sheets,
                   nrows = dims[1, ],
                   ncols = dims[2, ])

# Adicionar los datos en summ al sheet "data_summary"
writeWorksheet(my_book,summ,sheet="data_summary")

# Guardar workbook as summary.xlsx
saveWorkbook(my_book, file = "summary.xlsx")

# Renombrar el sheet "data_summary" por "summary"
renameSheet(my_book, "data_summary", "summary")

# Remover "summary"
removeSheet(my_book,sheet="summary")

