
library("tidyverse")

propina=read.csv("../propina.csv")
head(propina)

#mínimo indispensable para hacer un plot: datos, aes layer


ggplot(data=propina, aes(x=total, y=propina)) + 
  geom_point() + 
  theme(aspect.ratio = 1) #esto es para que en el diagrama de dispersión tenga la misma escala la y y la x (si tienen distinta escala, o sea, si no es algo cuadrado entonces puede ser engañosa la visualización del diagrama)

ggplot()

#si el gráfico es muy complejo, en cada capa se le puede definir un conjunto de datos diferente #recomendación si un conjunto de datos entonces lo pongo dentro de lso () de ggplot, pero si tengo capas diferentes con datos diferentes se pueden poner los datos en las layers, osea los geom


ggplot() + 
  geom_point(data=propina, aes(x=total, y=propina)) + 
  theme(aspect.ratio = 1)


ggplot(data=propina, aes(x=total, y=propina, colour = sexo)) + 
  geom_point() + 
  theme(aspect.ratio = 1)

ggplot(data=propina, aes(x=total, y=propina)) + 
  geom_point(colour = "blue") + 
  theme(aspect.ratio = 1)

ggplot(data=propina, aes(x=total, y=propina, colour = I('blue'))) + 
  geom_point() + 
  theme(aspect.ratio = 1)


ggplot(data=propina, aes(x=total, y=propina, shape = sexo)) + 
  geom_point() + 
  theme(aspect.ratio = 1)


ggplot(data=propina, aes(x=total, y=propina, size = cantidad)) + 
  geom_point(alpha=1/3) + 
  theme(aspect.ratio = 1)


ggplot(data=propina, aes(x=cantidad, y=propina, colour=sexo)) + 
  geom_jitter(height = 0, width = .1) + 
  theme(aspect.ratio = 1)
#esto modifica un poco "abre" para variables qu tienen valores enteros como cantidad, para solucionar el tema de sobreposición

ggplot(propina, aes(total, propina, colour = fuma)) +
  geom_point()



#CApas
ggplot() +
  layer(
    data = propinas, mapping = aes(x = total, y = propina), 
    geom = "point", stat = "identity", position = "identity") +
  scale_x_continuous() +
  scale_y_continuous() +
  coord_cartesian()

ggplot(data = propina, aes(x=total, y=propina)) +
  geom_point()



ggplot() +
  geom_point(data = propina, aes(x = total, y = propina)) +
  geom_point(data = data.frame(x = 30, y = 6), aes(x, y), 
  color = "red", size=10)


#facet

ggplot(data = propina, aes(x = total, y = propina)) +
  geom_point() + theme(aspect.ratio = 1) +
  facet_wrap(~sexo)


ggplot(data = propina, aes(x = total, y = propina)) +
  geom_point() + theme(aspect.ratio = 1) +
  facet_grid(sexo~fuma)


ggplot(data = propina, aes(x = total, y = propina)) +
  geom_point() + theme(aspect.ratio = 1) +
  facet_wrap(sexo~fuma)
#parece que facet wrap es más flexible que grid... el grid le doy la variable de fila y la de columna. Además el wrap puede ser un poco más flexible que el grid que siempre acomoda la primera como fila y la segunda variable como columna







## Deberes

ggplot(data = propina, aes(x = total, y = propina, color=fuma)) +
  geom_point() + theme(aspect.ratio = 1) +
  labs(x="Total gastado en dólares", y="Propina en dólares", color="Fumador") +
  theme(legend.position  = "bottom") + 
  scale_color_brewer(palette = "Dark2")


ggplot(data = propina, aes(x = total, y = propina, color=fuma)) +
  geom_point() + theme(aspect.ratio = 1) +
  labs(x="Total gastado en dólares", y="Propina en dólares", color="Fumador") +
  theme(legend.position  = "bottom") + 
  scale_color_brewer(palette = "Dark2") +
  geom_smooth(color="black", method = "lm")

ggplot(data = propina, aes(x = total, y = propina)) +
  geom_point(aes(color=fuma)) + 
  theme(aspect.ratio = 1) +
  labs(x="Total gastado en dólares", y="Propina en dólares", color="Fumador") +
  theme(legend.position  = "bottom") + 
  scale_color_brewer(palette = "Dark2") +
  geom_smooth(color="black", method = "lm")


#grafico de barras
ggplot(data = propina, aes(x = fct_infreq(dia), fill = dia)) + coord_flip() +
  geom_bar( )


ggplot(data = propina, aes(x = fct_infreq(dia), fill = dia)) + coord_flip() +
  geom_bar(aes(fill=sexo)) + labs(x="Dia",fill="Sexo") 


# llevar las barras al 100%
ggplot(data = propina, aes(x = fct_infreq(dia), fill = sexo)) + coord_flip() +
  geom_bar(position = "fill") + labs(x="Dia",fill="Sexo") 


 











