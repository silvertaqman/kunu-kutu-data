#!/usr/bin/env Rscript
# archivo <- "ABRIL 2024.xlsx"
# quimica <- extraer_quimica(archivo)
# load packages
pacman::p_load(readxl, tidyr)

# techs have a bad habit over data input. If the number ends with zero and excel ignore it,
# they add a space between decimal number and measurement. This function remove space and transform to double
# Only for numbers loaded as characters
c2d <- function(x){
  ifelse(suppressWarnings(is.na(as.double(x))),
         y <- as.double(sub(". ",".",x)), 
         y <- as.double(x))
  return(y)
}

# Se generan funciones para cada hoja del formato
extraer_quimica <- function(archivo){
  # load data from file
  datos <- read_excel(archivo, sheet = "QUIMICA", col_names = FALSE)
  
  # Look for all rows with NOMBRE
  nombre_rows <- which(datos[,1] == "NOMBRE:")
  
  # Create table structure for every entry
  entry <- data.frame(
    nombre = character(),
    fecha = as.Date(character()),
    tipo = character(),
    glucosa_basal = character(),
    urea = character(),
    creatinina = character(),
    acido_urico = character(),
    colesterol = character(),
    trigliceridos = character(),
    hdl = character(),
    ldl = character(),
    tgo = character(),
    tgp = character(),
    fosfatasa = character(),
    bilirrubina_t = character(),
    bilirrubina_d = character(),
    bilirrubina_i = character(),
    amilasa = character(),
    lipasa = character(),
    glucosa_posprandial = character())
  
  # Extract data for QUIMICA format
  # i: position of the first name of the day (x)
  # j: position of all other names that day (y)
  for(i in 1:length(nombre_rows)){
  x <- nombre_rows[i]
  nombre_cols <- which(datos[x,] == "NOMBRE:") # the same for columns
    for (j in 1:length(nombre_cols)){
      y <- nombre_cols[j]
      entry <- data.frame(
        nombre = as.character(datos[x, y+1]),
        fecha = format(as.Date(as.numeric(datos[x, y+4]), origin = "1899-12-30"), "%d/%m/%Y"),
        tipo = as.character(datos[x+1, y+4]),
        glucosa_basal = c2d(datos[x+3, y+2]),
        urea = c2d(datos[x+4, y+2]),
        creatinina = c2d(datos[x+5, y+2]),
        acido_urico = c2d(datos[x+6, y+2]),
        colesterol = c2d(datos[x+7, y+2]),
        trigliceridos = c2d(datos[x+8, y+2]),
        hdl = c2d(datos[x+9, y+2]),
        ldl = c2d(datos[x+10, y+2]),
        tgo = c2d(datos[x+11, y+2]),
        tgp = c2d(datos[x+12, y+2]),
        fosfatasa = c2d(datos[x+13, y+2]),
        bilirrubina_t = c2d(datos[x+14, y+2]),
        bilirrubina_d = c2d(datos[x+15, y+2]),
        bilirrubina_i = c2d(datos[x+16, y+2]),
        amilasa = c2d(datos[x+17, y+2]),
        lipasa = c2d(datos[x+18, y+2]),
        glucosa_posprandial = c2d(datos[x+19, y+2])) |> rbind(entry)}}
  # last modification for large format and remove empty cells
  entry <- entry |>
    pivot_longer(cols = !c(nombre, fecha, tipo),
                 names_to = "prueba", 
                 values_to="resultado")|>
    drop_na(resultado)
  
  # Return data
  return(entry)
}