# Additonal MATLAB Functions

## usage
 1. pull to your pc, put it into FOLDER of your choice
 2. start MATLAB
 3. put in command window 'addpath(genpath((FOLDER/Additonal MATLAB Functions))'
 4. put in command window 'savepath'

## File structure
 1. General Functions - Containing several nice functions:
	- coolbode.m - makes bode using semilogx, therefore it is easier to make Latex fonts etc.
	- MagInset(Ex).m - can be used to create 'zoomed in' sections of a plot
	- make4.m & profile4.m - can be used for fourth order motion profiles
	- MatlabDefaultPlotColors.m - returns the 7 default plot colors matlab uses
	- PlotTrialData(MIMO).m - used for plotting trial data (for ILC)
	- SetPlotLatexStyle.m - automatically makes fonts/fontsize/renderer of all upcoming plots Latex style
 2. GPML - GPML toolbox from Rasumussen