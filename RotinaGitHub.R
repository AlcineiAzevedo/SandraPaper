remove(list=ls())
# install.packages("BiocManager")
# BiocManager::install("EBImage")
# install.packages(ExpImage)
library(ExpImage)
im=read_image("https://raw.githubusercontent.com/AlcineiAzevedo/SandraPaper/main/original.jpg",plot=TRUE)
im2=resize_image(im,w=480,h=480)
im3=gray_scale(im2,method = "b",plot=TRUE)
im4=segmentation(im3,threshold = 0.3,fillHull = TRUE,
                 selectHigher = FALSE,plot=TRUE)
im5=dilate_image(erode_image(im4,n=6),n = 6,plot = TRUE)

med=measure_image(im5)
PixelArea=med$measures[,3]
gramas=PixelArea*0.0473-24.874
gramas


plot_meansures(img=im2,coordx =med$measures[,1],
               coordy = med$measures[,2],text = paste(round(gramas,2),"g"),
               col = "white")
