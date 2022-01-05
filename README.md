# Description
Stegsolve but cooler! That's all you need to know...











But in all seriousness it is just Stegsolve, but with the ability to alter the bit plane yourself!

# Directions
Simply download the repository, and either put an image into the repository and then running the makefile as such: makefile run $(ARG)="[INSERT_FILE_NAME_HERE]", or to put the image file into the Stegjar folder and running the processing file normally. Don't draw on the original page, and you will be fine!

# Log
12/15/21
Jason & Ryan : Researched methods to access various bit planes in order to change colors

12/16
Fixed sizing issues with images, created preliminary methods to access RGB bit planes. 

12/17 
Finished RGB bit plane methods

12/20
Completed with backend for stegsolve; planning to work on gui
Changed up makefile to do the desired behavior

12/21
Bug fixes

12/23
Ryan: Created buttons

12/27
Jason: Added functionality to button

01/01
Ryan: Implement very foundations of pen, gave full functionality to buttons for cycling between planes

01/02
Jason: Allowed pen to draw on only half of the sketch, very rudimentary

01/03
Jason: Started to implement ability to affect bit plane through pen; did not get far

01/04 (technically)
Jason: Ironed out the basic features of pen, some bugs passed through, created save button to port out image to check with outside tool
