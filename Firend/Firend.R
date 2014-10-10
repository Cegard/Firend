library("EBImage")

imagen = "sample.png"
areaPorPixel = 1 # cantidad de metros cuadrados contenidos en un pixel
desdeLaColumna = 33 # columna inicial a añadir
hastaLaFila = 360 # fila final a añadir

imagen_cruda = readImage(system.file("images", imagen, package="EBImage"))
imagen_cortada=matrix(0, nrow=dim(imagen_cruda)[1]-desdeLaColumna, ncol=hastaLaFila)

k = 1 #contador que recorrerá las casillas de la imagen_cortada

# se recorta la imagen
for(j in 1 : (dim(imagen_cruda)[1] * dim(imagen_cruda)[2])){
  col = ((j-1) %% dim(imagen_cruda)[1])+1
  row = ((j-1) %/% dim(imagen_cruda)[1])+1
  if((row < hastaLaFila+1) && (col > desdeLaColumna)){
    imagen_cortada[k] = imagen_cruda[j]
    k = k+1
  }
}

focos = matrix(0, ncol=2, nrow=length(imagen_cortada[imagen_cortada==1]))
''' matriz que contendrá las coordenadas en la imagen de los puntos de mayor temperatura
  cada fila será un punto distinto, la primer columna dirá en qué columna de la imagen se'''

row = 1

# se llena focos
for(i in 1 : dim(imagen_cortada)[1]){
  for (j in 1 : dim(imagen_cortada)[2]){
    
    if(imagen_cortada[i,j] == 1){
       focos[row,1] = i
       focos[row,2] = j
       row=row+1
    }
  }
}

