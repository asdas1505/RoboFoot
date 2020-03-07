Project - DFU Detection and Visualization

## This file contains documentation for Visualization.m file.

First step is to import csv file of the data you want to visualize.

	X_Vis = csvread('FileAddress');	

Second step is to divide the whole dataset into 3 components i.e. x,y and z.
Data files from magboard:

X component = (1,64)
Y component = (64,128)
Z component = (128,192)

For Z components, to reduce noise in the data we have removed the negative values. 

Normalized the each pressure component by dividing each of them by its maximum value.

Reshaping each time step into a 8x8 matrix for each pressure component.

To Visualize each component of pressure measured by 64 nodes of magboard, a 8x8 grid is creted using following code:
	
	[A,B] = meshgrid(a,b);

Using following function, a 3D plot is created showing pressure variation on z axis across an 8x8 matrix on xy plane.    

	surf(A,B,'PressureComponent')  
    
Using for loop, iterated each time frame to visualize each time step in the form of a video.
 
For better visualization of X and Y Pressure Components, different views can be used adding following code after surf function:
	
	view(az,el)        az: azimuth angles
			   el: elevation angles	


## To save the video file VisualizeToVideo.m can be used.
	







 	
