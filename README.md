### Data
1. Basic information of functional MRI scans, including participant ID, age, sex, and head motion parameter
  - Info_adults.mat
  - Info_children.mat

Note: Resting-state functional MRI (rsfMRI) data of all participants were obtained from the Children School Functions and Brain Development project (CBD, Beijing Cohort). Basic information is presented in tabular form. In the third column, ‘0’ and ‘1’ denote female and male, respectively. As some of the children underwent repeated rsfMRI scans, their ID labels are repeated in the tables according to the scan order. meanFD, mean framewise displacement.

2. Regional time series of children and adults
  -  MTC_adults.mat (https://drive.google.com/file/d/1fVfdNrXT1UXTvgDq0xRMnpWx-5MoOdtY/view?usp=drive_link)
  -  MTC_children.mat (https://drive.google.com/file/d/1maUlY_Xnw_UJXW0oWpLS018ovPnNMg0p/view?usp=drive_link)

Note: Cortical nodes were defined based on functional parcellation comprising 200 cortical regions (i.e. Schaefer-200) (1), and subcortical nodes were defined according to a subcortical functional parcellation comprising 32 regions (2). For each group, the scans are ordered in the same way as the basic information.

3. Regional entropy of children and adults
  - Entropy_adults.mat
  - Entropy_children.mat

Note: Both data are presented in a matrix of N_scans × N_node elements. For each group, the scans are ordered in the same way as the basic information.

4.	Overlapping functional modules in group-level functional networks in children and adults
   - Fig 2.xls

Note: This file contains the spatial distribution of each functional module in the group-level functional networks of the adult cohort, the spatial similarity of each module between each child subgroup and the adult cohort, and the system-dependent distribution of each functional module in different child subgroups and the adult cohort.

5.	Global and nodal properties of the overlapping functional modules for each scan in children
  - Fig 3.xls

Note: For each scan, the adjusted global and nodal properties are provided, corrected for the influence of sex and head motion. Global properties include module number and modularity in the edge graph. Nodal properties include nodal entropy for seven brain nodes that showed significant age-related changes. Age effects on nodal nodal entropy are reported as t-values.

6.	System-level nodal entropy for each scan in children
  - Fig 4.xls

Note: For each scan, the mean adjusted entropy within each of the eight functional systems is provided, corrected for the influence of sex and head motion.

7.	Cognitive function decoding of brain regions
  - Fig 5.xls

Note: Each element denotes the spatial similarity between each cognitive term and each bin, and the bins are ordered with decreasing age-related t-values.

8.	Individual age prediction based on spatial patterns of nodal overlap
  - Fig 6.xls

Note: To avoid the possibility of data leakage by including longitudinal scans from the same children in both the training and test sets, the ten-fold cross-validation prediction was performed 1000 times with random scan selection. Thus, 1000 prediction accuracy values are reported. The prediction weights of the brain nodes were obtained by averaging the contribution weights over the 1000 times of weight estimation.

9.	Prediction of individual spatial patterns of nodal module overlap from structural brain features
  - Fig 7.xls

Note: For each scan, the prediction accuracy is provided along with the contribution weights of six structural features. In addition, the empirically observed and predicted entropy values are provided for a representative child with the highest prediction accuracy.


### Codes
1.	Preprocessing of multi-modal MRI data
The functional images of all children were preprocessed using SPM12 (https://www.fil.ion.ucl.ac.uk/spm) and DPABI 3.0 (https://rfmri.org/DPABI) (4).
The T1-weighted images were preprocessed using FreeSurfer v6.0 (https://github.com/freesurfer/freesurfer) (5).
The diffusion images were preprocessed using MRtrix 3.0 (https://www.mrtrix.org/) (6), FSL 6.0.1 (https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL) (7), and ANTs (https://github.com/ANTsX/ANTs) (8).
2.	Overlapping modular architecture detection 
We first constructed a traditional functional network comprising nodal regions and interregional connectivities (i.e., edges) using the GRETNA package (http://www.nitrc.org/projects/gretna) (9). Then, we constructed the corresponding weighted edge graph representing the similarity between edges using Edge_graph_construction.m. Finally, we identified the module affiliations of edges using the Louvain algorithm (https://sites.google.com/site/findcommunities/) (10).
3.	Modular overlap entropy 
Modular overlap entropy was calculated using the method developed by Faskowitz and colleagues, as described in their study (11). The implementation of this method can be found at https://github.com/brain-networks.
fcn_node_entropy.m
4.	Mixed effect model
To explore the developmental changes in the overlapping modular architecture, the age effects were estimated using a mixed effect model (12, 13).
   Mixed_model.m
5.	Support vector regression (SVR) analysis 
The SVR model was implemented using the LIBSVM toolbox in MATLAB with the default parameters (https://www.csie.ntu.edu.tw/~cjlin/libsvm/) (14).
6.	Generalized additive mixed model (GAMM)
   To explore the potentially complex non-linear developmental changes in nodal modular overlap, age effects on nodal entropy were also assessed using a generalized additive mixed model (15). This model was implemented in R using the package mgcv (https://cran.r-project.org/web/packages/mgcv/index.html).



### References
1.	Schaefer A, Kong R, Gordon EM, Laumann TO, Zuo XN, Holmes AJ, et al. Local-global parcellation of the human cerebral cortex from intrinsic functional connectivity MRI. Cereb Cortex. 2018;28(9):3095-114.
2.	Tian Y, Margulies DS, Breakspear M, Zalesky A. Topographic organization of the human subcortex unveiled with functional connectivity gradients. Nat Neurosci. 2020;23(11):1421-32.
3.	Yeo BTT, Krienen FM, Sepulcre J, Sabuncu MR, Lashkari D, Hollinshead M, et al. The organization of the human cerebral cortex estimated by intrinsic functional connectivity. J Neurophysiol. 2011;106(3):1125-65.
4.	Yan C, Wang X, Zuo X, Zang Y. DPABI: data processing & analysis for (resting-state) brain imaging. Neuroinformatics. 2016;14(3):339-51.
5.	Fischl B. FreeSurfer. Neuroimage. 2012;62(2):774-81.
6.	Tournier JD, Smith R, Raffelt D, Tabbara R, Dhollander T, Pietsch M, et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. Neuroimage. 2019;202:116137.
7.	Jenkinson M, Beckmann CF, Behrens TE, Woolrich MW, Smith SM. Fsl. Neuroimage. 2012;62(2):782-90.
8.	Avants BB, Tustison NJ, Song G, Cook PA, Klein A, Gee JC. A reproducible evaluation of ANTs similarity metric performance in brain image registration. Neuroimage. 2011;54(3):2033-44.
9.	Wang J, Wang X, Xia M, Liao X, Evans A, He Y. GRETNA: a graph theoretical network analysis toolbox for imaging connectomics. Front Hum Neurosci. 2015;9:386.
10.	Blondel VD, Guillaume JL, Lambiotte R, Lefebvre E. Fast unfolding of communities in large networks. J Stat Mech. 2008;2008(10):P10008.
11.	Faskowitz J, Esfahlani FZ, Jo Y, Sporns O, Betzel RF. Edge-centric functional network representations of human cerebral cortex reveal overlapping system-level architecture. Nat Neurosci. 2020;23(12):1644-54.
12.	Laird NM, Ware JH. Random-effects models for longitudinal data. Biometrics. 1982;38(4):963-74.
13.	Diggle P, Kenward MG. Informative drop-out in longitudinal data-analysis. J R Stat Soc Ser C Appl Stat. 1994;43(1):49-93.
14.	Chang C-C, Lin C-J. LIBSVM: a library for support vector machines. ACM transactions on intelligent systems and technology (TIST). 2011;2(3):1-27.
15.	Lin X, Zhang D. Inference in generalized additive mixed models by using smoothing splines. Journal of the Royal Statistical Society Series B: Statistical Methodology. 1999;61(2):381-400.


