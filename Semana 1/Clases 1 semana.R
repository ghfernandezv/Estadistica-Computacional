library(tidyverse)
4+4
#Ejemplo a----
a=3
4->b
d<-5
b<-6
A<-5
#ejemplo 1 ----
errores<-c(1.9,-2.6,4.0,-9.5,-3.4,7.3)
sum(abs(round(errores)))
vec1<-c(1.5,2.5,8.4,3.7,6.3)
vec2<-rev(vec1)
mean(x=c(abs(vec1),abs(vec2)),trim=0.2)
#ejemplo 2 ----
poker_vecto<-c(140,-50,20,-120,240)
roulette_vector<-c(-24,-50,100,-350,10)
days_vector<-c('Monday','Tuesday','Wednesday','Thursday','Friday')
#ejemplo 3----
poker_wednesday<-poker_vecto[3]
poker_midweek<-poker_vecto[c(2,3,4)]
roulette_select_vector<-roulette_vector[2:5]

#ejemplo 4----
x<-c(2.1,4.2,3.3,5.4)#estoy creando una variable que es un vector 
x[c(3,1)]
x[c(3,1,1)]#concatenar, une o extrae los valores de esas posiciciones
order(x)#Ordeno de mayor a menor las posiciones 
rev(x[order(x)])
x[c(2.1,3.4)]



#ejemplo 5----
x[-1]
x[-c(1,3)] # aqui me está quitando la posición 3 y la 4.


#ejemplo 6 ----
x[c(T,F)]
x[c(T,F,NA,F)]
x[c(T,NA)]

#ejemplo 7 ----
y = setNames(x,letters[1:4])
y[c('a','c','a')]
x[y[c('a','a','a')]]


#ejemplo 8 ----
sort(x = poker_vecto, decreasing = TRUE)
sort(poker_vecto)
names(poker_vecto) = c('Monday','Tuesday','Wednesday','Thursday','Friday')
names(poker_vecto) = days_vector
names(roulette_vector) = days_vector
total_diario = poker_vecto+roulette_vector
total_week = sum(poker_vecto)+sum(roulette_vector)
mean(poker_vecto[c(2:4)])

#ejercicio 2 ----

x=c(3,4,6,9,3,9,10,7,7,2)
n=length(x)
y=(1/(n-1))*sum(x)

#ejemplo 9 ----
2==2

poker_vecto
poker_vecto > 0    
poker_vecto [poker_vecto>0]
roulette_vector[roulette_vector<0]


#ejemplo 10 ----
seq(1,10)
seq(1,10,by=2)
rep(1:4,2)
rep(c('c','e'), 2)
rep('c','e', 2)
seq(-2,3)



mu=10
sigma = 2

set.seed(12)
rnorm(n = 10, mean = 10 , sd = 2)

#ejemplo 11 ----

A = matrix(1:9, nrow=3, byrow=TRUE)

B = matrix(c(1,2,3,-1,2,-5,8,3,2), nrow=3, ncol=3, byrow=FALSE)

A%*%B   #para multiplicar matrices

det(A) #determinante
det(B)

solve(B) # calculo de la inversa

# x+y = 1; 3x-2y = 3

D=matrix(c(1,1,3,-2), nrow=2, byrow=TRUE)
R = matrix(c(1,3), nrow=2, byrow=TRUE) #matriz de respuesta 
solve(D,R)  #Aquí estamos resolviendo la ecuación


 # Ejemplo 12 ----

sex_vector = c('Male', 'Female', 'Female', 'Male', 'Male')
factor_sex_vector = factor(sex_vector) #Aquí lo que se hace es convertir en categorías. Permite hacer el resumen.
