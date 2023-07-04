# Aposteriori_elliptic
# Desciption
This folder contains codes for the paper "Guaranteed, locally efficient, and robust a posteriori estimates for nonlinear elliptic problems in iteration-dependent norms. An orthogonal decomposition result based on iterative linearization"
# Details
* The main coding platform is FreeFem.
* The edp files can run directly if FreeFem is installed and a folder names 'Output' is present in the directory.
* "Post_processing.m" is a matlab program that can be used to open the files, interpret the results, and make plots directly.
# File list
 * main.edp: Contains the code for L/M/Picard schemes for time-discrete Richards equation. It is the most commented code.
 * Kacanov.edp: Contains the code for the Kacanov scheme for the mean curvature flow problem.
 * Zarantonello.edp: Contains the code for the Zarantonello scheme for the mean curvature flow problem.
 * Newton.edp: Contains code for the Newton scheme for time-discretized Richards equation. It is a older version of the code and hence the estimators are defined slightly differently although the overall effectivity indices remain roughly the same (see main.edp for the most current version).



