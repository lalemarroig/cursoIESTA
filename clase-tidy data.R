library(tidyverse)

#DATOS ORDENADOS

#readr paquete de tidyverse para levantar datos, tiene funciones tipo 
# read_delim read_csv que son equivalentes pero son mejores

# read_delim() levanta del delimitador, están los casos particulares de funciones cuando el separador es algo especial. Por ejemplo, read_csv es para cuando el delimitador es coma , csv2 delimitador ;, tsv un tabulador, table un espacio

# copiaron el link del curso de jenny b para profundizar lectura

# Biblioteca haven para otros archivos externos, read_sas() read_sav, read_dta

# readxl para .xls .xlsx

library(readxl)
tmi_dd= read_xlsx(path=, 
                  sheet = , 
                  range = ,
                  col_names = F) %>%
  set_names(nm=c('Depto', paste(rep(c('Nacim','Defun','Tasa'),19),
                                rep(1997:2015,each=3),sep='_')))
# miramos los datos
tmi_dd %>% select(ends_with('2015')) %>% print(n=4) 


# Exportar datos

# saveRDS()  equivale a save()
# readRDS()  equivale a load()

tmi <- readRDS("../tmi.rds")



# Limpiar datos - queremos ordenar datos
# estructurar datos package tidyr

# gather: pasa de wide a long
# spread: pasa de long a wide
#   
# separate: una columna y la separas en varias
# unite: hace el camino al revés de separate

# gather: pide key: el nombre de la variable cuyo valor lo forman lo que estaba en el nombre de la variable, luego value lo que estaba en la variable

###############################################################

# Ejemplo:

tmi_dd = readRDS("../tmi.rds")

head(tmi_dd)

ale=tmi_dd %>% gather(var1,valor,-Depto) %>% separate(var1,c('var','anio'))

ale %>% filter(Depto %in% c('MONTEVIDEO','INTERIOR'), var=="Tasa") %>% 
  spread(Depto, valor) %>% mutate(rtt=MONTEVIDEO/INTERIOR,
                                  rtt.f=)
  
  
  
  

