actors = c('DiCaprio','Ariana Grande', 'Zendaya', 'Tom Holland', 'Carlos Torres')
moviename = 'Spiderman'
reviews = data.frame(
  scores = c(4, 2.6, 4.8),
  sources = c("Netflix", "A", "B"),
  comments = c('buena película', 'pésima Película', 'Una obra de arte')
)
sp_man_no_way_home_list= list(actors = actors ,moviename = moviename ,reviews = reviews)
print(sp_man_no_way_home_list$actors)
print(sp_man_no_way_home_list$actors[2])
