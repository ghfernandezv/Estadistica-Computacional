# libreria ----

library(tidyverse)

# La gram�tica de los gr�ficos ----

# Los tres elementos esenciales para la gr�fica

## data 
## Aesthetics = es la escala en las que mapearemos nuestros datos
## Geometries = forma real que tomar�n los datos

# Adem�s, hay capas adicionales
## themes = controla toda la tinta que no es de datos
## statistics 
## coordinates
## facets

# estetica aes ----
## x = es la posicion en el eje x
## y = es la posicion en el eje y
## fill = relleno
## color = colores 
## size = �rea o radio de los puntos, grosor de las l�neas
## alpha = transparencia
## linetype = patr�n de rayas
## labels = Texto en un gr�fico o en los ejes
## shape = forma

# Ejemplo 1
view(iris)
iris %>% 
  ggplot(aes(x=Sepal.Length,Sepal.Width))+
  geom_point()

# Ejemplo 2
iris %>% 
  ggplot(aes(x=Sepal.Length,Sepal.Width,color=Species))+
  geom_point()

# Ejemplo 3
iris %>% 
  ggplot(data = .)+
  geom_point(aes(x=Sepal.Length,Sepal.Width,color=Species))

# Ejemplo 4 
iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point(color ="red")

# Ejemplo 5
iris %>%
  ggplot(data=., aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point(size = 2)

# Ejemplo 6
iris %>%
  ggplot(data=., aes(x = Sepal.Length, y = Sepal.Width,
                     shape = Species,color=Species)) + 
  geom_point() +
  theme_bw()

# Ejercicio 1 ----
view(mtcars)
mtcars %>% 

  

## a) Mapea mpg en el x y fcyl en el y.
  ggplot(aes(x=mpg, y = factor(cyl)))+
  geom_point()

## b) Mapea mpg en el y y fcyl en el x.
mtcars %>% 
  ggplot(aes(x=factor(cyl), y = mpg))+
  geom_point()
## c) Mapea en el eje x wt, a mpg en el eje, y el color to fcyl
mtcars %>% 
  ggplot(aes(x=wt, y = mpg,color=factor(cyl)))+
  geom_point()

## d) 
... %>%
  ggplot(..., aes(..., ..., ...)) +
  # Modifica la capa de puntos del gr�fico anterior cambiando el argumento
  #de la shape a 1 y aumentando el size a 4.
  mtcars %>% 
  ggplot(aes(x=wt, y = mpg ,color=factor(cyl)))+ 
  geom_point(shape=1, size = 4)
  

## e) 
... %>%
  # Cambiar la est�tica para que fcyl sea mapeado por fill en lugar de color.
  ggplot(..., aes(..., ..., ...)) +
  # En geom_point() cambie el argumento de shape a 21 y a�ada un argumento alpha ajustado a 0,6.
  mtcars %>% 
  ggplot(aes(x=wt, y = mpg ,fill=factor(cyl)))+ 
  geom_point(shape=21, alpha= 0.6, size = 4)
## f) Cambie el mapeo anterior. Y use geom_text con el argumento label para fcyl
mtcars %>% 
  ggplot(aes(x=wt, y = mpg ,fill=factor(cyl), label=factor(cyl)))+geom_point()+ 
  geom_text(alpha = 0.6, size = 4)
## g) Usando lo del inicio c
... %>%
  ... +
  # A�adir capa de texto con label = rownames(mtcars) y color rojo
  mtcars %>% 
  ggplot(aes(x = wt, y = mpg, color = factor(cyl))) +  geom_point()+
  geom_text(aes(label = rownames(mtcars)), color = "red", vjust = -0.5)

## h) Usando lo del inicio c, 
## A�ade dos argumento a la est�tica: el shape =fam y el mapa de hp dividido por el wt en el size
... %>%
  mtcars %>% 
  ggplot(aes(x = wt, y = mpg, color = factor(cyl), shape = factor(am), size = hp / wt)) + 
  geom_point() 


# Modificacion de la estetica ----
# Modificacion de posici�n 
## identity      ## jitterdodge
## dodge         ## nudge
## stack
## fill
## jitter

# Ejemplo 1
iris %>%
  ggplot(data=., aes(x = Sepal.Length,
                     y = Sepal.Width,
                     color = Species)) +
  geom_point(position = "identity")

# Ejemplo 2
iris %>%
  ggplot(data=., aes(x = Sepal.Length,
                     y = Sepal.Width,
                     color = Species)) +
  geom_point(position = "jitter")

# Ejemplo 3
posn_j <- position_jitter(0.1,seed = 136)

iris %>%
  ggplot(data=., aes(x = Sepal.Length,
                     y = Sepal.Width,
                     color = Species)) +
  geom_point(position = position_jitter(0.1,seed = 123))

# funciones de scale ----
# scale_x_*(): * discrete o continuous
# scale_y_*()
# scale_color_*()
# Also scale_colour_*()
# scale_fill_*()
# scale_shape_*()
# scale_linetype_*()
# scale_size_*()
# ylim()
# xlim()

# Ejemplo 1
iris %>%
  ggplot(data=., aes(x = Sepal.Length,
                     y = Sepal.Width,
                     color = Species)) +
  geom_point(position = "jitter") +
  scale_x_continuous("Sepal Length") +
  scale_y_continuous("Sepal Width")+
  scale_color_discrete("Species b")

# Ejemplo 2
iris %>%
  ggplot(data=., aes(x = Sepal.Length,
                     y = Sepal.Width,
                     color = Species))  +
  geom_point(position = "jitter") +
  scale_x_continuous("Sepal Length",
                     limits = c(2,8)) +
  scale_color_discrete("Species")

# Ejemplo 3
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width, 
                 color = Species)) +
  geom_point(position = "jitter") +
  scale_x_continuous("Sepal Length", 
                     limits = c(2,8),
                     breaks = seq(2,8,3)) + 
  scale_color_discrete("Species")

# Ejemplo 4
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width, 
                 color = Species)) +
  geom_point(position = "jitter") +
  scale_x_continuous("Sepal Length", 
                     limits = c(2,8),
                     breaks = seq(2,8,3),
                     expand = c(0,0)) + 
  scale_color_discrete("Species")

# Ejemplo 5
ggplot(iris, aes(x = Sepal.Length,
                 y = Sepal.Width, 
                 color = Species)) +
  geom_point(position = "jitter") +
  scale_x_continuous("Sepal Length", 
                     limits = c(2,8),
                     breaks = seq(2,8,3),
                     expand = c(0,0)) + 
  scale_color_discrete("Species",
                       labels = c("Setosa",
                                  "Versicolor",
                                  "Virginica"))

# Ejemplo 6
iris %>%
  ggplot(data=., aes(x = Sepal.Length,
                     y = Sepal.Width,
                     color = Species)) +
  geom_point(position = "jitter",alpha=0.5) +
  labs(x = "Sepal Length",
       y = "Sepal Width",
       color = "Species")

# Ejercicio 2 ----
## a) 
mtcars %>%
  ggplot(data=., aes(factor(cyl), fill = factor(am))) +
  geom_bar() +
  # Establezca la etiqueta del eje x como "Número de cilindros", 
  # y en el eje y como "Recuento", use labs().
  labs(x = "Número de cilindros", y = "Recuento")

## b) Usando lo anterior, implementa una escala de color de relleno
## personalizada utilizando scale_fill_manual(). 
## Establezca el primer argumento como "Transmisi�n", 
## y los valores como palette.

palette <- c("0" = "#377EB8", "1" = "#E41A1C")
# codigo anterior
 mtcars %>%
  ggplot(data=., aes(factor(cyl), fill = factor(am))) +
  geom_bar()+
  # Establecer la escala de color de relleno
  scale_fill_manual(name = 'Transmisión', values = palette)

## c) Usando el codigo anterior solo cambie la posicion por dodge
 palette <- c("0" = "#377EB8", "1" = "#E41A1C")
 # codigo anterior
 mtcars %>%
   ggplot(data=., aes(factor(cyl), fill = factor(am))) +
   geom_bar(position = 'dodge')+
   # Establecer la escala de color de relleno
   scale_fill_manual(name = 'Transmisión', values = palette)+
   #coord_cartesian(xlim = c(0, 7), ylim = c(0, 6))+
   scale_y_continuous('cyl', limits = c(0,15))
# geometrias ----
# geom_*
# abline,contour,dotplot,jitter,pointrange,ribbon,spoke
# area,count,errorbar,label,polygon,rug,step
# bar,crossbar,errorbath,line,qq,segment,text
# bin2d,curve,freqpoly,linernge,qq_line,sf,tile
# blank, density,hex,map,quantile,sf_text,violin
# boxplot, density2d,histogram,path,raster,sf_text,vline
# col,density_2d,hline,point,rect,smooth

# scatter plot ----

# esencial
## eje x es numerica
## eje y es numerica

# Ejemplo 1
iris %>%
  ggplot(., aes(x = Sepal.Length,
                y = Sepal.Width)) +
  geom_point()

# opcional
## alpha, color,fill,shape,size,stroke

# Ejemplo 2
iris %>%
  ggplot(., aes(x = Sepal.Length,
                y = Sepal.Width,
                col = Species)) +
  geom_point()

# Ejemplo 3
iris %>%
  ggplot(., aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(col = Species)) 

# Ejemplo 4
iris %>%
  group_by(Species) %>%
  summarise_all(mean) -> iris.summary

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point() +
  # diferentes datos
  geom_point(data = iris.summary, shape = 15, size = 5)

# Ejemplo 5
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point() +
  # diferentes datos
  geom_point(data = iris.summary, shape = 21, size = 5,
             fill = "black",stroke =2)

# Ejemplo 6
iris %>%
  ggplot(., aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point(position = "jitter")+
  geom_point(data = iris.summary, shape = 21, size = 5,
             fill = "black",stroke =2)

# Ejemplo 7
iris %>%
  ggplot(., aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_jitter()+
  geom_point(data = iris.summary, shape = 21, size = 5,
             fill = "black",stroke =2)

# Ejemplo 8
iris %>%
  ggplot(., aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_jitter(alpha = 0.6)

# Ejemplo 9
iris %>%
  ggplot(., aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_jitter(size = 3)

# Ejercicio 3 ----
# a) 
view(diamonds)
diamonds %>%
  ggplot(., aes(carat, price, color = clarity))+
  # adiciona transparencia de 0.5 y shape ="."
  geom_point(alpha=0.5, shape = '.')

# b) El codigo anterior pero con shape=16

view(diamonds)
diamonds %>%
  ggplot(., aes(carat, price, color = clarity))+
  # adiciona transparencia de 0.5 y shape ="."
  geom_point(alpha=0.5, shape = 16)

# Ejercicio 4 ----
# a) Crea una plot base de cyl por mpg, coloreado por fam:  plt_mpg_vs_fcyl_by_fam.
... %>%
  ...

# b) Adiciona capas de puntos a la plot base 
plt_mpg_vs_fcyl_by_fam +
  ...

# c) Adiciona algun ruido usando position_jitter(), establecer width a 0.3.
plt_mpg_vs_fcyl_by_fam +
  geom_point(position = position_jitter(width=0.3))

# d) Alternativemente, use position_jitterdodge() donde jitter.width y dodge.width son 0.3
plt_mpg_vs_fcyl_by_fam +
  geom_point(... = ...(...,...))

# Ejercicio 5 ----
library(carData)
Vocab = carData::Vocab

# a) Usando Vocab, dibuje education vs vocabulary,adiciona la capa de puntos.
Vocab %>%
  ggplot(aes(x = education, y = vocabulary))+
  geom_point()

# b) Usando el codigo anterior
Vocab %>%
  ggplot(aes(x = education, y = vocabulary))+

  # Cambia la capa de puntos a capas jitter 
  geom_jitter()

# c) Usando el codigo anterior
Vocab %>%
  ggplot(aes(x = education, y = vocabulary, color= year))+
  # ponle transparencia de 0.2 y shape = 1
  geom_jitter(alpha=0.2)


# plot de histogramas ----

# Ejemplo 1 ----
iris %>%
  ggplot(., aes(x = Sepal.Width)) +
  geom_histogram()

# Ejemplo 2 ----
minimo=min(iris$Sepal.Width)
maximo = max(iris$Sepal.Width)
rango = maximo - minimo
count(iris$Sepal.Width)
n = nrow(iris)
k = round(3.3*log10(n)+1,0)
amp = rango/k
print(k)
print(rango)
print(amp)
final = rango+amp
  
iris %>%
  ggplot(., aes(x = Sepal.Width)) +
  geom_histogram(binwidth = 0.1,center = 0.05)
  

# Ejemplo 3 ----
iris %>%
  ggplot(., aes(x = Sepal.Width,fill=Species)) +
  geom_histogram(binwidth = 0.1,center = 0.05)

# Ejemplo 3 ----

iris %>%
  ggplot(., aes(x = Sepal.Width,fill=Species)) +
  geom_histogram(binwidth = 0.1,center = 0.05)

# Ejemplo 4 ----

iris %>%
  ggplot(., aes(x = Sepal.Width,fill=Species)) +
  geom_histogram(binwidth = 0.1,
                 center = 0.05,
                 position="dodge")

# Ejercicio 6 ----

## Realiza un histograma de la frecuencia relativa (..density..)
## de la variable mpg de los datos mtcars
blue1 <- "#51A8C9"

mtcars%>%
  ggplot(aes( x = mpg, y = ..density..)) + #los dos puntos indican que no es una varibale que incluye el dataset, sino que lo estoy calculando
  # Set the fill color to datacamp_light_blue
  geom_histogram(binwidth = 2, fill=blue1 )

# Ejercicio 7 ----
## Realiza un histograma de la frecuencia absoluta 
## de la variable mpg de los datos mtcars categorizado 
## por fam
mtcars%>%
  ggplot(aes(x = mpg, fill = factor(am))) +
  # Use la position identity, con transparencia 0.4
  geom_histogram(binwidth = 2, position = 'identity', alpha = 0.4)

# plot de Barras ---

# Ejemplo 1
str(diabetic)
?diabetic
library(survival)
view(diabetic)
diabetic %>%
  ggplot(data = ., aes(laser))+ 
  geom_bar()

# Ejemplo 2
iris %>%
  dplyr::select(Species, Sepal.Width) %>%
  gather(key="Sepalo", value = "valor", -Species) %>%
  dplyr::group_by(Species) %>%
  summarise(avg = mean(valor),
            stdev = sd(valor)) -> iris_summ

ggplot(iris_summ, aes(x = Species,y = avg)) +
  geom_col(fill = 'blue') +
  geom_errorbar(aes(ymin = avg - stdev,
                    ymax = avg + stdev),
                width = 0.1)


# Ejercicio 8 ----
## Realiza un diagrama de barras de la variable fcyl de mtcars
## segun fam y use position = "dodge"
...%>%
  ggplot(..., aes(..., ... = ...)) +
  # Change the position to "dodge"
  geom_bar(... = ...)

# Ejercicio 9 ----
## Realiza un diagrama de barras de la educaci�n seg�n
## el vocabulario de los datos Vocab 
... %>%
  ggplot(..., ...(..., ... = ...)) +
  # Adiciona la capa bar con posicion "fill"
  ... +
  # Adiciona la escala fill brewer 
  ...

# plot de lineas ----
btcusd <- read_csv("C:/Users/USUARIO/Documents/GitHub/Estadistica-Computacional/Semana 3/Visualización/BTC-USD.csv", 
                   col_types = cols(Date = col_date(format = "%Y-%m-%d")))

str(btcusd)

# Ejemplo 1
btcusd %>%
  ggplot(.,aes(x=Date,y= Close)) +
  geom_line()

# Ejemplo 2
btcusd %>%
  mutate(year = format(Date,"%Y"))%>%
  ggplot(.,aes(x=Date,y= Close, color=year)) +
  geom_line()

# Ejemplo 3
btcusd %>%
  mutate(year = format(Date,"%Y"))%>%
  ggplot(.,aes(x=Date,y= Close, linetype=year)) +
  geom_line()

# Ejemplo 3
btcusd %>%
  mutate(year = format(Date,"%Y"))%>%
  ggplot(.,aes(x=Date,y= Close, color=year, fill=year)) +
  geom_line()+
  geom_area(alpha = 0.3)

# plot de cajas y bigotes ----
meses <- c("enero","febrero","marzo","abril","mayo","junio",
           "julio","agosto","septiembre","octubre","noviembre","diciembre")

btcusd %>%
  mutate(month = format(Date,"%B"),
         year = format(Date,"%Y"))%>%
  ggplot(.,aes(x=factor(month,levels = meses),y= Close, fill=year)) +
  geom_boxplot()


# capas estadisticas ----

# ejemplo 1
p <- mtcars %>%
  ggplot(., aes(x = factor(cyl), fill = factor(am)))
p + geom_bar()
p + stat_count()

# ejemplo 2
p_2 <- iris %>%
  ggplot(., aes(x = Sepal.Length,
                y = Sepal.Width,
                color = Species)) +
  geom_point() 
# method ="lm"
p_2+geom_smooth(method = "lm")
p_2+stat_smooth(method = "lm")

# sin se
p_2+geom_smooth(method = 'lm',se = FALSE)
p_2+stat_smooth(method = 'lm',se = FALSE)


# con rango full
p_2+geom_smooth(method = 'lm',fullrange = TRUE)
p_2+stat_smooth(method = 'lm',fullrange = TRUE)

# method = 'loess'
p_2+geom_smooth(method = 'loess')
p_2+stat_smooth(method = 'loess')

# sin se
p_2+geom_smooth(method = 'loess',se = FALSE)
p_2+stat_smooth(method = 'loess', se = FALSE)

# con rango full
p_2+geom_smooth(method = 'loess',fullrange = TRUE)
p_2+stat_smooth(method = 'loess',fullrange = TRUE)

# otras funciones
## stat_boxplot() = geom_boxplot()
## stat_bindot() = geom_dotplot()
## stat_bin2d() = geom_bin2d()
## stat_binhex() = geom_hex()
## stat_contour() = geom_contour()
## stat_quantile() = geom_quantile()
## stat_sum() = geom_count()

# Mas capas estadisticas  ----

# Ejemplo 1
p_3 <- ggplot(iris, aes(Sepal.Length,
                        Sepal.Width))
p_3 + geom_point()
p_3 + geom_jitter(alpha = 0.5,width = 0.1,height = 0.1)
p_3+ geom_count()
p_3 + stat_sum()

# Ejemplo 2
iris %>%
  ggplot(., aes(Sepal.Length,
                Sepal.Width,
                color = Species)) +
  geom_count(alpha = 0.4)


# Ejemplo 3
iris %>%
  ggplot(., aes(x = Sepal.Length)) +
  geom_histogram(aes( y = ..density..)) +
  geom_rug() +
  stat_function(fun = dnorm, color = "red",
                args = list(mean = mean(iris$Sepal.Length),
                            sd = sd(iris$Sepal.Length)))

# Ejemplo 4
iris %>%
  ggplot(data=., aes(sample = Sepal.Length)) +
  stat_qq() +
  geom_qq_line(col = "red")

# facetas ----
# Ejemplo 1
p_4 <- iris %>%
       ggplot(data=., aes(x = Sepal.Length,
                          y = Sepal.Width)) +
      geom_jitter(alpha = 0.7) +
      scale_color_brewer(palette = "Set1") +
      coord_fixed()
p_4

p_4+facet_grid(.~ Species)

# Ejemplo 2
p_5 <- msleep%>%
  ggplot(., aes(x = bodywt,
                y = brainwt)) +
  geom_point()

p_5 + facet_grid(conservation~vore)


# Ejemplo 3
p_6 <- msleep%>%
  ggplot(., aes(x = bodywt,
                y = name)) +
  geom_point()

p_6 + facet_grid(vore ~ . ,
                 scales = "free_y",
                 space = "free_y")
