library("tidyverse")

#selecciona filas
filter()

#ordena
a=arrange(mtcars,desc(mpg))

#aplicarlo con la pipe
mtcars %>% filter(mpg >= 24.4) %>% arrange(desc(mpg))

#selecciona variables
select(mtcars, ends_with("t"))
select(mtcars, wt:gear)
select(mtcars, -(wt:gear))

#aplicarlo con la pipe
mtcars %>% filter(mpg >= 24.4) %>% arrange(desc(mpg)) %>% select(-(wt:gear))

#transformar vbles existentes
mutate(mtcars, wtkg=wt*0.45359*1000)
mutate(mtcars, wt=wt*0.45359*1000)

transmute(mtcars, wtkg=wt*0.45359*1000)


#group_by summarise
mtcars %>% group_by(cyl) %>% summarise(cyl_n=n(), cyl_mn =mean(mpg)) 



#Practicar
mpg=mpg

# 1 - 
mpg %>% 
  filter(manufacturer == "toyota" & model == "camry") %>%
  select(manufacturer, model, year, cyl, cty)

# 2 - 
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(count=n())

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(cty_mean=mean(cty))

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(cty_mean=mean(cty)) %>% 
  arrange(cty_mean) %>%
  filter(cty_mean == min(cty_mean) | cty_mean ==max(cty_mean)) %>%
  select(manufacturer)

# 3 -
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(cty_mean=mean(cty), cty_sd=sd(cty)/sqrt(n()) , cty_rank=max(cty)-min(cty))  

# 4 - 
mpg %>% 
  mutate(desp_2004=year>2004) %>%
  group_by(manufacturer, desp_2004) %>% 
  summarise(cty_mean=mean(cty, na.rm=T))  

mpg %>% 
  group_by(manufacturer, year>2004) %>% 
  summarise(cty_mean=mean(cty, na.rm=T))  

# 5 - 
mpg %>% 
  group_by(manufacturer) %>%
  summarise(mn=mean(cty)) %>%
  sample_n(3)



mpg %>% 
  filter(manufacturer %in% sample(unique(manufacturer),3)) %>%
  group_by(manufacturer) %>%
  group_by(manufacturer) %>%
  summarise(mn=mean(cty)) 

















