#3.1
#I loaded in the matlab package so the images can 
#flipud, fliplr, and/or  rot90
#Also, I loaded the package Cairo for printing libraries
library(matlab)
library(Cairo)

#3.2
#N and Ndiv are going to rep. the dimensions of the matrix
#The matrix is going to be 16 rows by 8 cols.
N <- 16
N
Ndiv <- N/2
Ndiv

#3.2.1
#I created an array called rnd1 that stores the value
#of a matrix with random numbers. The matrix has random nums 
#because of the runif function. 
#This matrix has N rows & Ndiv cols.
rnd1 <- matrix(runif(N*Ndiv), nrow=N, ncol=Ndiv)
rnd1

#3.2.2
#I created another array called symV1 which is bilaterally (vertically)
#symmetric across the y-axis from rnd1. 
#I did this by combining the original matrix with a function called
#flip left/right which flips the original matrix  across the y-axis
#and stored this value into symV1.

symV1 <- cbind(rnd1, fliplr(rnd1))
symV1

#3.2.3
#I created another array called symH1 which takes the value of the 
#vertically symmetric matrix and rotates it so that it is horizontally symmetric.
#I did this by using the rotate 90 function which takes symV1 
#and rotates it 90 degrees to create a horizontally symmetric matrix
symH1 <- rot90(symV1)
symH1

#3.2.4
#I created two new variables called symV2 & symH2 
#to remove the duplicated pixels of the vertically (symV1) and 
#horizontally (symH1) symmetric matrices
#symV2 elims 1 col. while symH2 elims. 1 row

symV2 <- symV1[,-Ndiv]
symV2
symH2 <-symH1[-Ndiv,]
symH2

#3.2.5
#Array rnd2 was created
#This array holds the value of a matrix with random values in a 8X8 data set
rnd2 <- matrix(runif(Ndiv*Ndiv), ncol=Ndiv)
rnd2

#I create a two fold symmetric matrix
#twoFold1 takes the values of rnd2 and adds a col. to it using cbind(), 
#then it flips the values using fliplr so that it is symmetric across the y-axis.
#twoFold2 takes the vertically sym. values of twoFold1 and adds a row to it using
#rbind(), then uses the function flipud to make the matrix symmetric across the 
#x-axis
twoFold1 <- cbind(rnd2, fliplr(rnd2))
twoFold1
twoFold2 <- rbind(flipud(twoFold1), twoFold1)
twoFold2

#The matrix twoFoldSymmetry removes the duplicated pixels along the X and Y axes
twoFoldSymmetry <- twoFold2[-Ndiv, -Ndiv]
twoFoldSymmetry

#3.2.6
#I created a matrix of random numbers called noise
#that is the same size as twoFoldSymmetry
#I then divided the values of noise by two and added the values of
#twoFoldSymmetry(because pemdas ofc) and assigned it to signalPlusNoise
noise <- matrix(runif((N-1)*(N-1)), ncol=N-1)
noise
signalPlusNoise <- twoFoldSymmetry + noise/2
signalPlusNoise

#3.3, 3.4, & 3.5
#I created a pdf file named "Assignment1_Question3_KLM.pdf" 
#and put my 6 panels on it
pdf_file<-"Assignment1_Question3_KLM.pdf"

#using the cairo_pdf function I sized the panels to be 8.5wX5h
cairo_pdf(pdf_file,width=8.5,height=5)

#I set the plotting area into a 2*3 array, and set a square plotting region.
#I set the width of margins by .2 inches, and set the figure margins in number 
#of 0.2 inches. Since the cex default is 1 the magnification of the axis is default, 
#and for the plotting device I set it to NA because it allows the panels to
#be plotted outside of the plotting region
par(mfcol=c(2,3),pty="s", omi=c(.2,.2,.2,.2),mai=c(0.2,0.2,0.2,0.2),cex.axis=1,xpd=NA)

#created vector for the function gray.colors()
#I used the max amount of gray shades since the rgb color model can show 256 shades
#starts at 0(black) and ends at 1(white) so anything between is gray
grayColors <- gray.colors(256, start = 0, end=1);

#I rotated all the panels by 90 degrees(because of what happened in last class)
#I used xaxt/yaxt="n" to suppress the x and y axis respectively
#Assigned the color gray to all of the panels
#I then made the titles blue and moved them 1.2 spaces away from the axis
#Lastly, I made the titles twice the size of the default size and the font is Arial

#Top Left
image(rot90(symV1), xaxt="n", yaxt="n", col=grayColors)
title("Vertical Symmetry", col.main=rgb(0,0,1), line=1.2, cex.lab=2, family="Arial")
#Bottom Left
image(rot90(symH1), xaxt="n", yaxt="n", col=grayColors)
title("Horizontal Symmetry", col.main=rgb(0,0,1), line=1.2, cex.lab=2, family="Arial")
#Top Center
image(rot90(symV2), xaxt="n", yaxt="n", col=grayColors)
title("Vertical Symmetry", col.main=rgb(0,0,1), line=1.2, cex.lab=2, family="Arial")
#Bottom Center
image(rot90(symH2), xaxt="n", yaxt="n", col=grayColors)
title("Horizontal Symmetry", col.main=rgb(0,0,1), line=1.2, cex.lab=2, family="Arial")
#Top Right
image(rot90(twoFoldSymmetry), xaxt="n", yaxt="n", col=grayColors)
title("Two Fold Symmetry", col.main=rgb(0,0,1), line=1.2, cex.lab=2, family="Arial")
#Bottom Right
image(rot90(signalPlusNoise), xaxt="n", yaxt="n", col=grayColors)
title("Signal Plus Noise", col.main=rgb(0,0,1), line=1.2, cex.lab=2, family="Arial")

#closes file and provides URL for plot(concates. to single image)
dev.off()

