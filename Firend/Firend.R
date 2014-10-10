library("EBImage")

imagen = "sample.png"
desdeLaColumna = 33
hastaLaFila = 360

# desdeLaColumna, hastaLaFila dejan por fuera ciertas columnas y filas respectivamente

imagen_cruda = readImage(system.file("images", imagen, package="EBImage"))
imagen_cortada=matrix(0, nrow=dim(imagen_cruda)[1]-desdeLaColumna, ncol=hastaLaFila)

k = 1 #contador que recorrerá las casillas de la imagen_cortada

for (j in 1 : (dim(imagen_cruda)[1] * dim(imagen_cruda)[2])){
  col = ((j-1) %% dim(imagen_cruda)[1])+1
  row = ((j-1) %/% dim(imagen_cruda)[1])+1
  if((row < hastaLaFila+1) && (col > desdeLaColumna)){
    imagen_cortada[k] = imagen_cruda[j]
    k = k+1
  }
}
