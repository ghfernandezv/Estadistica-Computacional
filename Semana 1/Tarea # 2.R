name = c('Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus',
            'Neptune')
type = c('Terrestrial planet', 'Terrestrial planet', 'Terrestrial planet', 'Terrestrial
            planet', 'Gas giant', 'Gas giant', 'Gas giant', 'Gas giant')
diameter = c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation = c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings = c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
# creando el dataframe
planets_df = data.frame(name, type, diameter, rotation, rings)
str(planets_df)
#selecciono el diametro del planeta mercurio
planets_df[1, 'diameter']
#selecciono todos los datos del planeta marte
planets_df[planets_df$name == 'Mars', ]
#selecciono e imprimo los primeros 5 valores de diametro
planets_df[1:5, 'diameter']
#tres formas de seleccionar la variable rings
rings_vector = c(planets_df[, 'rings'],planets_df[, 5],planets_df$rings)
rings_vector=planets_df$rings
#seleccionando los planetas que tienen anillos
anillos = planets_df$name[rings_vector==TRUE]
#utilizando subset()
subset(planets_df, diameter < 1, select = name)
#ordenando los planetas
por_diametro = subset(planets_df, select = c(diameter,name))
por_diametro = por_diametro[order(por_diametro$diameter), ]

