library(tidyverse)

# clase performance: tiempo de computadora y cómo reducir el tiempo de ejecución del código

# usa C++

# Flexibilidad vs Velocidad


# Por ejemplo en la definición de una función los argumentos no requieren uqe se definan que son, esto nos da flexibilidad porque permite que vaya cambiando el tipo de objeto por ejemplo, clase atributos etc. Sin embargo esto nos da lentitud o mejor otros tipos de códigos como c++ pueden ser más raápidos porque le tengo que setear esas cosas antes y cuando ejecutan no tienten que ir a fijarse cada vez, entonces más rápidos que r


# ESto luego se va a vincular con la rapized vs flexibilidad de r
# muchos entornos, las funcione generan sus propios ambientes
f <- function(x) {
  a<-3
  x^a
}
f(2)

a <- 1
f <- function(){
  g<- function(){
    print(a)
    assign("a",2,envir=parent.frame())
    a <- 3
    print(a)
  }
  g()
  print(a)
}

# esto es que R va buscando el objeto a enlos distintos ambientes hasta que lo encuentra y lo printea, si no lo encuentra en ningún ambiente da error
# el tema es que en la última f tenemos 3 ambientes, el gral, el ambiente de f y el ambiente de g


# en definitiva: el uso de R, flexible que va a buscar a los distintos ambientes,puede traernos problemas en cuanto al tiempo de ejecución

# para solucionar esto: benchmark y profile


# ejemplo
library(microbenchmark)
x=rnorm(100)
microbenchmark(
  mean(x),
  sum(x)/100,
  sum(x)/length(x)
)


df=data.frame(v=1:6,name=letters[1:6])

microbenchmark( "d1" = df[3, 2],  "d2" = df[3, "name"], 
                "d3" = df$name[3], "d4" = df[[2]][3], 
                "d5" =.subset2(df, 2)[3],
                "d6"= df %>% filter(v == 3) %>% select(name), 
                unit = 'relative', times = 50)


library(profvis)
profvis({            
  data(diamons, package = "ggplot2")
  plot(price ~ carat, data = diamonds)            
  m <- lm(price ~ carat, data = diamonds)            
  abline(m, col = "red")    
  p1 <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point()+
    geom_smooth(method = "lm")
  print(p1)
  summary(diamonds)
})



# Introducción a Rcpp
# Es una forma de conectar R a C++, que el núcleo de código de R está escrito en c++
# Pero no todo amerita ser escrito en C++, ver desventajas pag 20

library(Rcpp)
sourceCpp('primer_funcion.cpp')

timesTwo(42)



# Ejemplo para hacer Rcpp

sourceCpp('media_ale.cpp')

x=rnorm(100)

mm <-microbenchmark(
  mn1=mean(x),
  mn2=sum(x)/length(x),
  mn3=media_ale(x),
  unit = 'ms', times=47
)


# Dibujo

mm %>% data.frame() %>%
  ggplot() + geom_boxplot(aes(x=expr, y=time)) +
  labs(y='Tiempo', x='') +
  scale_y_log10()






