
# MODELO LEE CARTER -------------------------------------------------------

#librerias
library(corrplot)
library(pacman)
library(demography)
library(ggplot2)
library(reshape2)
library(tidyverse)
library(dplyr)
library(skimr)
# LIMPIEZA DE LA BASE DE DATOS
# Leemos los de intervalos de 5
datos_lc5 <- read.table("Mex_mltpiv_5x1.txt", header = T, sep = "")
str(datos_lc5)
setwd("C:/Users/Santiago/Downloads")
# Nos quedamos con las variables de nuestro interes
datos_lc2005 <- select(datos_lc5, year, age, mx, qx, lx, Lx, Tx, ex)

# NOTA:
# Hasta aqui podemos ver que tenemos los datos desde 1895-2005
# Vamos a pegar mas datos, concretamente desde 2005-2013


# Leemos los archivos .csv que contienen nuestros datos de interes
# Los organizamos en periodos quinquenales.

# 2006 --------------------------------------------------------------------

tablas2006general <- read.csv("2006.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df3 <- tablas2006general[-1, ]


# 2007 --------------------------------------------------------------------

tablas2007general <- read.csv("2007_1.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df4 <- tablas2007general[-1, ]


# 2008 --------------------------------------------------------------------
tablas2008general <- read.csv("2008.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df5 <- tablas2008general[-1, ]


# 2009 --------------------------------------------------------------------

tablas2009general <- read.csv("2009.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df6 <- tablas2009general[-1, ]


# 2010 --------------------------------------------------------------------
tablas2010general <- read.csv("2010.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df7 <- tablas2010general[-1, ]


# 2011 --------------------------------------------------------------------

tablas2011general <- read.csv("2011.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df8 <- tablas2011general[-1, ]


# 2012 --------------------------------------------------------------------

tablas2012general <- read.csv("2012.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df9 <- tablas2012general[-1, ]


# 2013 --------------------------------------------------------------------

tablas2013general <- read.csv("2013.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df10 <- tablas2013general[-1, ]


# 2014 --------------------------------------------------------------------

tablas2014general <- read.csv("2014.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df11 <- tablas2014general[-1, ]


# 2015 --------------------------------------------------------------------

tablas2015general <- read.csv("2015.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df12 <- tablas2015general[-1, ]


# 2016 --------------------------------------------------------------------

tablas2016general <- read.csv("2016.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df13 <- tablas2016general[-1, ]


# 2017 --------------------------------------------------------------------

tablas2017general <- read.csv("2017.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df14 <- tablas2017general[-1, ]


# 2018 --------------------------------------------------------------------

tablas2018general <- read.csv("2018.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df15 <- tablas2018general[-1, ]


# 2019 --------------------------------------------------------------------

tablas2019general <- read.csv("2019.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df16 <- tablas2019general[-1, ]


# 2020 --------------------------------------------------------------------

tablas2020general <- read.csv("2020.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df17 <- tablas2020general[-1, ]


# 2021 --------------------------------------------------------------------

tablas2021general <- read.csv("2021.csv", sep="\t", header=TRUE, fileEncoding="UTF-16LE")
df18 <- tablas2021general[-1, ]



# HOMBRES -----------------------------------------------------------------

# Continuamos con las demas tablas
datos_lc2006 <- select(df3,  year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2007 <- select(df4,  year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2008 <- select(df5,  year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2009 <- select(df6, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2010 <- select(df7, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2011 <- select(df8, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2012 <- select(df9, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2013 <- select(df10, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2014 <- select(df11, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2015 <- select(df12, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2016 <- select(df13, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2017 <- select(df14, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2018 <- select(df15, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2019 <- select(df16, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2020 <- select(df17, year, age, mx, qx, lx, Lx, Tx, ex )
datos_lc2021 <- select(df18, year, age, mx, qx, lx, Lx, Tx, ex )


# Realizamos el merge
# Esto es con la finalidad de ir juntando las bases de datos de periodos posteriores
# Debemos de ir haciendolo por pares
merge1 <- merge(datos_lc2005, datos_lc2006, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge2 <- merge(merge1, datos_lc2007, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge3 <- merge(merge2, datos_lc2008, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge4 <- merge(merge3, datos_lc2009, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge5 <- merge(merge4, datos_lc2010, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge6 <- merge(merge5, datos_lc2011, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge7 <- merge(merge6, datos_lc2012, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge8 <- merge(merge7, datos_lc2013, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge9 <- merge(merge8, datos_lc2014, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge10 <- merge(merge9, datos_lc2015, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge11 <- merge(merge10, datos_lc2016, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge12 <- merge(merge11, datos_lc2017, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge13 <- merge(merge12, datos_lc2018, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge14 <- merge(merge13, datos_lc2019, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge15 <- merge(merge14, datos_lc2020, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)

merge16 <- merge(merge15, datos_lc2021, by=c("year","age", "mx", "qx", "lx", "Lx", "Tx", "ex"), all.x = TRUE, all.y = TRUE)


##Nombramos base final hombres
base_final_hombres <- merge16

# Verificacion de los datos 
columnas_con_coma <- sapply(base_final_hombres, function(x) any(grepl(",",x)))
print(columnas_con_coma)

# Identificamos los valores con coma 
base_final_hombres %>% 
  filter(grepl(",", lx)) %>% 
  select(lx)

# Eliminamos las comas
base_final_hombres$lx <- gsub(",","",base_final_hombres$lx)

# Detectamos la presencia de mas comas en columnas Tx y ex
# Columna Tx
base_final_hombres$Tx <- gsub(",","",base_final_hombres$Tx)

# Columna ex
base_final_hombres$Lx <- gsub(",","",base_final_hombres$Lx)

library(corrplot)
str(base_final_hombres)

base_final_hombres$year <- as.numeric(base_final_hombres$year)
base_final_hombres$age <- as.numeric(base_final_hombres$age)
base_final_hombres$mx <- as.numeric(base_final_hombres$mx)
base_final_hombres$qx <- as.numeric(base_final_hombres$qx)
base_final_hombres$lx <- as.numeric(base_final_hombres$lx)
base_final_hombres$Lx <- as.numeric(base_final_hombres$Lx)
base_final_hombres$Tx <- as.numeric(base_final_hombres$Tx)
base_final_hombres$ex <- as.numeric(base_final_hombres$ex)

cor(base_final_hombres[, c("year","age","mx","qx","lx","Lx","Tx","ex")])


##----------------------VAMOS A PASAR CON EL MODELO LEE CARTER-----------------------------------------

library(demography)

mx_matrix <- acast(base_final_hombres, age ~ year, value.var = "mx")

# Conviértela a matriz numérica si no lo es:
mx_matrix <- as.matrix(mx_matrix)  # Asegúrate de que sea 'matrix' y no 'table'
mx_matrix <- apply(mx_matrix, 2, as.numeric)
base_final_hombres$mx <- as.numeric(base_final_hombres$mx)

# 'apply' recorre cada columna y la convierte a numeric, devolviendo una matriz

str(mx_matrix)

Lx_matrix <- acast(base_final_hombres, age ~ year, value.var = "Lx")
Lx_matrix <- as.matrix(Lx_matrix)
Lx_matrix <- apply(Lx_matrix, 2, as.numeric)
str(Lx_matrix)

lx_matrix <- acast(base_final_hombres, age ~ year, value.var = "lx")
lx_matrix <- as.matrix(lx_matrix)
lx_matrix <- apply(lx_matrix, 2, as.numeric)
str(lx_matrix)



my_data <- demogdata(
  data = mx_matrix,           # Matriz de tasas (o defunciones)
  pop = Lx_matrix,
  ages = c(0, 1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85),       # Vector de edades (ej. 0:100)
  years = c(1895,1897,1900,1905,1910,1915,1921,1925,1930,1935,1940,1945,1955,1965,1975,1985,1995,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021),        # Vector de años (ej. 1950:2020)
  type = "mortality",  # Tipo de dato
  label = "Mis datos",
  name = "Hombres"
)
##################################################################################
# Con matriz lx
my_data2 <- demogdata(
  data = mx_matrix,           # Matriz de tasas (o defunciones)
  pop = lx_matrix,
  ages = c(0, 1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85),       # Vector de edades (ej. 0:100)
  years = c(1895,1897,1900,1905,1910,1915,1921,1925,1930,1935,1940,1945,1955,1965,1975,1985,1995,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021),        # Vector de años (ej. 1950:2020)
  type = "mortality",  # Tipo de dato
  label = "Mis datos",
  name = "Hombres"
)

################################################################################


# Realizamos el ajuste
fit_lc <- lca(my_data, series = "Hombres", adjust = "e0")
summary(fit_lc)
plot(fit_lc)

# Ajuste con my_data2
fit_lc2 <- lca(my_data2, series = "Hombres", adjust = "e0")
summary(fit_lc2)
plot(fit_lc2)



# MUJERES -----------------------------------------------------------------
# LIMPIEZA DE LA BASE DE DATOS
# Leemos los de intervalos de 5
datos_lc5_m <- read.table("Mex_fltpiv_5x1_mujeres.txt", header = T, sep = "")
datos_lc5_m

# Nos quedamos con las variables de nuestro interes
datos_lc2005_m <- select(datos_lc5_m, year, age, mxm, qxm, lxm, Lxm, Txm, exm)

# NOTA:
# Hasta aqui podemos ver que tenemos los datos desde 1895-2005
# Continuamos con las demas tablas
datos_lc2006_m <- select(df3,  year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2007_m <- select(df4,  year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2008_m <- select(df5,  year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2009_m <- select(df6, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2010_m <- select(df7, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2011_m <- select(df8, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2012_m <- select(df9, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2013_m <- select(df10, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2014_m <- select(df11, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2015_m <- select(df12, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2016_m <- select(df13, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2017_m <- select(df14, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2018_m <- select(df15, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2019_m <- select(df16, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2020_m <- select(df17, year, age, mxm, qxm, lxm, Lxm, Txm, exm )
datos_lc2021_m <- select(df18, year, age, mxm, qxm, lxm, Lxm, Txm, exm )


# Realizamos el merge
# Esto es con la finalidad de ir juntando las bases de datos de periodos posteriores
# Debemos de ir haciendolo por pares
merge1m <- merge(datos_lc2005_m, datos_lc2006_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge2m <- merge(merge1m, datos_lc2007_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge3m <- merge(merge2m, datos_lc2008_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge4m <- merge(merge3m, datos_lc2009_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge5m <- merge(merge4m, datos_lc2010_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge6m <- merge(merge5m, datos_lc2011_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge7m <- merge(merge6m, datos_lc2012_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge8m <- merge(merge7m, datos_lc2013_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge9m <- merge(merge8m, datos_lc2014_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge10m <- merge(merge9m, datos_lc2015_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge11m <- merge(merge10m, datos_lc2016_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge12m <- merge(merge11m, datos_lc2017_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge13m <- merge(merge12m, datos_lc2018_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge14m <- merge(merge13m, datos_lc2019_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge15m <- merge(merge14m, datos_lc2020_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)

merge16m <- merge(merge15m, datos_lc2021_m, by=c("year","age", "mxm", "qxm", "lxm", "Lxm", "Txm", "exm"), all.x = TRUE, all.y = TRUE)


##Nombramos base final hombres
base_final_mujeres <- merge16m

# Verificacion de los datos 
columnas_con_coma <- sapply(base_final_mujeres, function(x) any(grepl(",",x)))
print(columnas_con_coma)

# Identificamos los valores con coma 
base_final_mujeres %>% 
  filter(grepl(",", lxm)) %>% 
  select(lxm)

# Eliminamos las comas
base_final_mujeres$lxm <- gsub(",","",base_final_mujeres$lxm)

# Detectamos la presencia de mas comas en columnas Tx y ex
# Columna Tx
base_final_mujeres$Txm <- gsub(",","",base_final_mujeres$Txm)

# Columna ex
base_final_mujeres$Lxm <- gsub(",","",base_final_mujeres$Lxm)

#Vamos a pasar las variables a numericas
base_final_mujeres$year <- as.numeric(base_final_mujeres$year)
base_final_mujeres$age <- as.numeric(base_final_mujeres$age)
base_final_mujeres$mxm <- as.numeric(base_final_mujeres$mxm)
base_final_mujeres$qxm <- as.numeric(base_final_mujeres$qxm)
base_final_mujeres$lxm <- as.numeric(base_final_mujeres$lxm)
base_final_mujeres$Lxm <- as.numeric(base_final_mujeres$Lxm)
base_final_mujeres$Txm <- as.numeric(base_final_mujeres$Txm)
base_final_mujeres$exm <- as.numeric(base_final_mujeres$exm)


# TASAS DE MORTALIDAD MUJERES -----------------------------------------------------

library(ggplot2)
ggplot(base_final_mujeres, aes(x = age, y = mxm, group = factor(year), color = factor(year))) +
  geom_line() +
  labs(
    title = "Tasas de mortalidad por edad y año",
    x = "Edad",
    y = "Tasa de mortalidad (mxM)",
    color = "Año"
  ) +
  theme_minimal()


# Segunda grafica

ggplot(base_final_mujeres, aes(x = age, y = mxm, group = year, color = factor(year))) +
  geom_line() +
  scale_y_log10() +
  labs(
    title = "Tasas de mortalidad (escala logarítmica)",
    x = "Edad",
    y = "mxm (escala log)"
  ) +
  theme_minimal()



# Tercera gráfica
ggplot(base_final_mujeres, aes(x = year, 
                               y = log(mxm),       # o bien scale_y_log10()
                               group = age, 
                               color = age)) +
  geom_line() +
  # Escala continua de color (puedes usar otras paletas)
  scale_color_viridis_c(option = "plasma") +  # o "magma", "inferno", etc.
  labs(
    title = "Tasas de mortalidad (log) por año y edad",
    x = "Año",
    y = "Log de la tasa de mortalidad",
    color = "Edad"
  ) +
  theme_minimal()

# 


# Corremos el modelo
# Generamos las matrices

library(reshape2)

mxm_matrix <- acast(base_final_mujeres, age ~ year, value.var = "mxm")

# Conviértela a matriz numérica si no lo es:
mxm_matrix <- as.matrix(mxm_matrix)  # Asegúrate de que sea 'matrix' y no 'table'
mxm_matrix <- apply(mxm_matrix, 2, as.numeric)
base_final_mujeres$mxm <- as.numeric(base_final_mujeres$mxm)

# 'apply' recorre cada columna y la convierte a numeric, devolviendo una matriz

str(mxm_matrix)

# Corremos la otra matriz
Lxm_matrix <- acast(base_final_mujeres, age ~ year, value.var = "Lxm")
Lxm_matrix <- as.matrix(Lxm_matrix)
Lxm_matrix <- apply(Lxm_matrix, 2, as.numeric)
str(Lxm_matrix)

# Ajustamos el modelo 

library(demography)

my_data_mujeres <- demogdata(
  data = mxm_matrix,           # Matriz de tasas (o defunciones)
  pop = Lxm_matrix,
  ages = c(0, 1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85),       # Vector de edades (ej. 0:100)
  years = c(1895,1897,1900,1905,1910,1915,1921,1925,1930,1935,1940,1945,1955,1965,1975,1985,1995,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021),        # Vector de años (ej. 1950:2020)
  type = "mortality",  # Tipo de dato
  label = "Mis datos",
  name = "Mujeres"
)

# Realizamos el ajuste
fit_lc_mujeres <- lca(my_data_mujeres, series = "Mujeres", adjust = "e0")
summary(fit_lc_mujeres)
plot(fit_lc_mujeres)





