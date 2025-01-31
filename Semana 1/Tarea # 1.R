#punto 1 ----
new_hope = c(460.998,314.4)
empire_strikes = c(290.475,247.900)
return_jedi = c(309.306,165.8)
#Punto 2 ----
star_wars_matrix = matrix(c(new_hope,empire_strikes,return_jedi),nrow=3,byrow=TRUE)
rownames(star_wars_matrix) = c('A New Hope','The Empire Strikes Back','Return of the Jedi')
colnames(star_wars_matrix)= c('US','non-US')
#punto 3 ----
worlwide_vector = c(sum(new_hope),sum(empire_strikes),sum(star_wars_matrix))
#punto 4----
star_wars_matrix = cbind(star_wars_matrix, all_wars_matrix = worlwide_vector)
#punto 5 ----
non_us_all =star_wars_matrix[,"non-US"]
mean(non_us_all)
             