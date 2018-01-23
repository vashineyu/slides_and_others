'
Quiz about Data type and vector operation
'
# 1-1
movies = read.csv('http://www.stat.berkeley.edu/classes/s133/data/movies.txt', 
                    sep='|',
                    stringsAsFactors=FALSE)

sapply(movies, typeof)

# 1-2
# method1: with strsplit
movies$box.usd <- as.numeric(sapply(movies$box, 
                                    function(x) strsplit(x, split = "\\$")[[1]][2]))

# method2: with gsub (string substitute)
movies$box.usd.2 <- as.numeric(gsub(movies$box, pattern = "\\$", replacement = ""))

# method3: with substr (we found that the format of box is the same)
movies$box.usd.3 <- as.numeric(substr(movies$box, start = 2, stop = 8))

movies <- movies[order(movies$box.usd, decreasing = T),]
sum(head(movies$box.usd, 10))
sum(tail(movies$box.usd, 10))

# 1-3
movies$on.year <- as.numeric(sapply(movies$date, 
                         function(x) strsplit(x, split = ",")[[1]][2]))
movies$this.year <- 2018
movies$year.pass <- movies$this.year - movies$on.year
movies$avg.year.box <- movies$box.usd / movies$year.pass

movies <- movies[order(movies$avg.year.box, decreasing = T),]
head(movies, 5)
