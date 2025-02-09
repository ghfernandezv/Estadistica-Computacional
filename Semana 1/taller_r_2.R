# Ejercicio 1 ----
# Codifique la construccion de flujo de control
li <- 15 
fb <- 9
if (li>=15 & fb >=15) {
  sms = 2*(li + fb)
} else if (li<10&fb<10) {
  sms = 0.5*(li + fb)
} else {
  sms = li+fb
}
# imprime el resultado sms
print(sms)



# codigo del ciclo while
ctr=1
while (ctr<=7){
  
  print(paste('ctr se ajusta a',ctr))
  ctr=ctr+1
}

#ejemplo 5----
resultados=c('Cara', 'Sello')
num.lanza=0
num.caras=0
historial=NULL
while (num.caras<7){
  res=sample(x=resultados,size=1)
  num.lanza=num.lanza+1
  historial[num.lanza] = res
  if(res=='Cara'){
    num.caras=num.caras+1
  }
}
historial
#ejemplo 6----
ctr=1
while(ctr<=7){
  if(ctr%%5==0){
    break
  }
  print(paste('ctr se ajusta a',ctr))
  ctr=ctr+1
}


# Ejercicio 2 ----
# inicio de la variable speed
speed <- 64
while(speed>30){
  print('despacio!!')
  speed=speed-7
}
# Imprime la variable speed
speed

# Ejercicio 3 ----
# inicio de la variable speed
speed <- 64
# Ampliar/adaptar el ciclo while
while (speed >30) {

  if (speed>48) {
    print (paste('Reduzca su velocidad a lo grande!! vas a:',speed))
    speed=speed-11
  } else {
    print (paste('Reduzca su velocidad, vas a:',speed))
    speed=speed-6
  }
}
speed

# Ejercicio 4 ----
# inicio i en 1
i <- 1
# Codigo del ciclo while
while ( i <= 10) {
  ---
  if ( ---) {
    ---
  }
  i <- i + 1
}


# Ejemplo 7 ----
cities <- c("New York","Paris","London", "Tokyo", "Rio de Janeiro","Cape Town")
cities
for (city in cities){
  print(city)
}
# Ejemplo 8 ----
cities <- c("New York","Paris","London", "Tokyo", "Rio de Janeiro","Cape Town")
cities
for (city in cities){
  if(nchar(city)==6){
    break
  }
  print(city)
}
# Ejemplo 9 ----
cities <- c("New York","Paris","London", "Tokyo", "Rio de Janeiro","Cape Town")
cities
for (city in cities){
  if(nchar(city)==6){
    next
  }
  print(city)
}
# Ejemplo 10 ----
cities <- c("New York","Paris","London", "Tokyo", "Rio de Janeiro","Cape Town")
cities
for (city in cities){
  if(nchar(city)==6){
    next
  }
  print(city)
}

#ejercicio heavy ----

car=matrix(nrow=20,ncol=1000)
n.muestras=0
cont=0
muest=numeric(20)
while(n.muestras<20){
  n.muestras=n.muestras+1
  car[n.muestras, ]=runif(1000, min=1, max=3 )
  for (i in 1:1000)
    if(car[n.muestras, i]>=2.5){
      cont <- cont+1
    }
  muest[n.muestras] <- cont
  cont=0
}
print(muest)

# Ejercicio 6 ----
nyc <- list(pop = 8405837,
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten
                         Island"),
            capital = FALSE)
# ciclo version 1
---
# ciclo version 2
---

# Ejercicio 7 ----
ttt <-matrix(c("O",NA,"X",NA,"O","O", 
               "X",NA,"X"),nrow=3)
for (--- in ---) {
  for (--- in ---) {
    print(---)
  }
}

# Ejercicio 8 ----
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
# Si el valor del elemento del vector es superior a 10, imprime ”¡Eres popular!”

# Si el valor del elemento del vector no excede de 10, imprime ”¡S´e m´as visible!”

# Ejercicio 9 ----
---

# Ejercicio 10 ----
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit (rquote , split = "") [[1]]
# inicio rcount
---
# Finaliza el ciclo for
for (char in chars) {
  ---
}

# imprime rcount
---

# funciones ----

#Ejemplo 11 ----
suma = function (x,y){
  
  res = x+y
  return(res)
}

suma(2,3)

#Ejemplo 12 ----
fun = function (n){
  x=0
  yos=numeric(n)
  yos=runif(n, min=0, max=1)
  for (i in yos){
    if(sum(yos)>=3){
      return (yos)
    } else {
    next
    }
  }
  
}
fun(3)

# funcion lapply ----
nyc=list(pop =84, boro = c('x','y','z'), capital = FALSE)
lapply(nyc,class)
unlist(lapply(nyc,class))
sapply(nyc,class)

# ejercicio 13
pioneros <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
# Dividir los nombres a partir del a\˜no de nacimiento. Use la funcion
# strsplit () . Llamalo split
---
# Convertir el texto en minusculas. Use la funcion tolower () . Llamelo split low
---
# Echa un vistazo a la estructura de split low
---


# ejercicio 14
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- ---
split_low <- ---
select_primero <- function(x) {
  x[1]
}

# Aplicar select primero() sobre los elementos de split low con lapply () y
# asignar el resultado a una nueva variable llamada names.
---
# Realizar el codigo para los a\˜nos
---

# expresiones regulares ----
# ejemplo 15
animales = c('gato','raton','hormiga','oso','tigre')
grepl(pattern ='a',x = animales)#analiza si contiene la letra a
grep(pattern ='a',x = animales) #posiciones de los textos que tiene a
grepl(pattern ='^o',x = animales)#analiza los que inician con "o"
grepl(pattern ='o$',x = animales)#analiza los que terminan con "o"

sub(patter = 'a', replacement = 'o', x=animales)#sustituye una letra

# ejercicio 16
# Correos electronicos
emails <- c("john.doe@ivyleague.edu","education@world.gov",
            "dalai .lama@peace.org","invalid .edu","quant@bigdatacollege.edu",
            "cookie.monster@sesame.tv")
# Use grepl() para generar un vector logico que indique los correos que contienen
# ".edu".
---

# Haz lo mismo con grep(). Guardar en hits .
---

# Selecciona los correos que contengan ".edu"
---

# Con esta expresion regular "@.∗\\.edu$", utilice sub() y reemplazce por
# "@uninorte.edu.co"
---

today <- Sys.Date()
class (today)
now <- Sys.time()
class (now)
my_date <- as.Date("1985-01-07")
class (my_date)
my_date <- as.Date("1985-14-07",format="%Y %d %m")
my_time <- as.POSIXct("1985−01−07 11:25:15")
as.Date("1982−01−13”)