---
layout: page
title: "Codes"
tags: Savitzky-Golay, Vicon MetaPackage (ROS)
permalink: /codes/
---

###<center>[Black-box System Identification for Control](https://github.com/SeRViCE-Lab/Matlab-Files/blob/master/ident_data/Filtered%20GWN/carimaFWGN.m)</center>

Based on a finite-dimensional data that was acquired during an identification for a SISO control system experiment, this code demonstrates how to go about the determination of structure in chaotic data and reconstructs generative linear system identification models typically used in control systems design. Feedbacks are welcome.

###<center>[Vicon Listener (ROScpp)](https://github.com/lakehanne/Vicon)</center>

Based on [Markus Achtelik's](https://github.com/markusachtelik) [ROS bridge](https://github.com/ethz-asl/vicon_bridge) to the Vicon [Data Stream SDK](http://www.vicon.com/products/software/datastream-sdk), I have provided a ROS Metapackage system that computes the rotation and translation coordinates of Vicon **mocap** segment markers (using the numerically stable Gram-Schmidt orthonormalization procedure). I have provided an example for markers on a manikin head after subscribing to the published topic "vicon/markers" from the ros bridge to vicon sdk. It's been tested and verified on ROS_Indigo running Ubuntu Trusty. If you can verify that it works on Jade or Hydro, kindly leave a feedback on the [project's issues page](https://github.com/lakehanne/vicon/issues). 


###<center>[Faults Detection/PCA/Machine Learning Classification for Control (Matlab)](https://github.com/lakehanne/Sheaf-M-Files/blob/master/Lab_bI_whole.m)</center>

Based on acquired data from a gas turbine bearing, and gearmesh rigs in Sheffield, England, we perform the frequency-domain analysis of the time-domain data using pwelch's method; we perform piece-wise smoothing of data from each rig and eliminate the curse of dimensionality using greedy layerwise features extraction after respective filters are applied to smooth out the data. We visualize the data by further using principal components analysis to extract correlated features. Classification is done using classical neural network backpropagation mechanism.

###<center>[Savitzky-Golay Filter (C++)](https://github.com/lakehanne/Savitzky-Golay)</center>

Nicely computes the [Vandermonde matrix](http://www.math.umn.edu/~garrett/m/algebra/notes/17.pdf), Savitzky-Golay [differentiation filters](http://www.wire.tu-bs.de/OLDWEB/mameyer/cmr/savgol.pdf) and smoothing coefficients for any noisy, and sequential signal. It is a textbook implementation of the Savitzky-Golay filter algorithm following Sophocles and Orfanidis treatment in their book. 

It can be run offline with collected data but needs slight tweaking if it must be run with on-line data in real time. Initial testing of this code was done using a Ubuntu 14.04.02 Trusty OS running Linux 4.4 but will work on any other Linux/Windows/Mac OS machine with little effort. Please submit all feedbacks via my [github repo issues page](https://github.com/lakehanne/Savitzky-Golay/issues).

Reference: Sophocles J. Orfanidis, INTRODUCTION TO SIGNAL PROCESSING, Prentice-Hall, 1995, Chapter 8.





