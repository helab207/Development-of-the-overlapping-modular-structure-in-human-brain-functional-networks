### Data
1.Basic information of functional MRI scans, including participant ID, age, sex, and head motion parameter
- Info_adults.mat
- Info_children.mat

Note: Resting-state functional MRI (rsfMRI) data of all participants are obtained from the Children School Functions and Brain Development project (CBD, Beijing Cohort). Basic information is present in a tabular form. In the third column, ‘0’ and ‘1’ denote female and male, respectively. Since some of the children underwent repeated rsfMRI scans, their ID labels are repeated in the tables according to the scanning order. meanFD, mean framewise displacement.

2.Regional time series of children and adults
- MTC_adults.mat (https://drive.google.com/file/d/1kTXLs37y5jUh_SslQu-Zp_AdUT9drIfI/view?usp=drive_link)
- MTC_children.mat (https://drive.google.com/file/d/1F6oS20OZH3W6C6BOUbPGZ63N_hoEEB15/view?usp=drive_link)

Note: Cortical nodes were defined based on functional parcellation comprising 200 cortical regions (i.e., Schaefer-200) (1), and subcortical nodes were defined according to a subcortical functional parcellation comprising 32 regions (2).

3.Regional entropy of children and adults
- Entropy_adults.mat
- Entropy_children.mat

### Codes
1.Preprocessing of multi-modal MRI data
The functional images of all children were preprocessed using SPM12 (https://www.fil.ion.ucl.ac.uk/spm) and DPABI 3.0 (https://rfmri.org/DPABI) (3).
The T1-weighted images were preprocessed using FreeSurfer v6.0 (https://github.com/freesurfer/freesurfer) (4).
The diffusion images were preprocessed using MRtrix 3.0 (https://www.mrtrix.org/) (5), FSL 6.0.1 (https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL) (6), and ANTs (https://github.com/ANTsX/ANTs) (7).
2.Overlapping modular architecture detection 
We first constructed a traditional functional network comprising nodal regions and interregional connectivities (i.e., edges) using the GRETNA package (http://www.nitrc.org/projects/gretna) (8). Then, we constructed the corresponding weighted edge graph representing the similarity between edges using Edge_graph_construction.m. Finally, we identified the module affiliations of edges using the Louvain algorithm (https://sites.google.com/site/findcommunities/) (9).
3.Modular overlap entropy 
Modular overlap entropy was calculated using the method developed by Faskowitz and colleagues, as described in their study (10). The implementation of this method can be found at https://github.com/brain-networks.
- fcn_node_entropy.m
4.Mixed effect model
To explore the developmental changes in the overlapping modular architecture, the age effects were estimated by using a mixed effect model (11, 12).
- Mixed_model.m
5.Support vector regression (SVR) analysis 
The SVR model was implemented using the LIBSVM toolbox in MATLAB with the default parameters (https://www.csie.ntu.edu.tw/~cjlin/libsvm/) (13).


### References
1.	Schaefer A, Kong R, Gordon EM, Laumann TO, Zuo XN, Holmes AJ, et al. Local-Global Parcellation of the Human Cerebral Cortex from Intrinsic Functional Connectivity MRI. Cereb Cortex. 2018;28(9):3095-114.
2.	Tian Y, Margulies DS, Breakspear M, Zalesky A. Topographic organization of the human subcortex unveiled with functional connectivity gradients. Nat Neurosci. 2020;23(11):1421-32.
3.	Yan C, Wang X, Zuo X, Zang Y. DPABI: data processing & analysis for (resting-state) brain imaging. Neuroinformatics. 2016;14(3):339-51.
4.	Fischl B. FreeSurfer. Neuroimage. 2012;62(2):774-81.
5.	Tournier JD, Smith R, Raffelt D, Tabbara R, Dhollander T, Pietsch M, et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. Neuroimage. 2019;202:116137.
6.	Jenkinson M, Beckmann CF, Behrens TE, Woolrich MW, Smith SM. Fsl. Neuroimage. 2012;62(2):782-90.
7.	Avants BB, Tustison NJ, Song G, Cook PA, Klein A, Gee JC. A reproducible evaluation of ANTs similarity metric performance in brain image registration. Neuroimage. 2011;54(3):2033-44.
8.	Wang J, Wang X, Xia M, Liao X, Evans A, He Y. GRETNA: a graph theoretical network analysis toolbox for imaging connectomics. Front Hum Neurosci. 2015;9:386.
9.	Blondel VD, Guillaume JL, Lambiotte R, Lefebvre E. Fast unfolding of communities in large networks. J Stat Mech. 2008;2008(10):P10008.
10.	Faskowitz J, Esfahlani FZ, Jo Y, Sporns O, Betzel RF. Edge-centric functional network representations of human cerebral cortex reveal overlapping system-level architecture. Nat Neurosci. 2020;23(12):1644-54.
11.	Laird NM, Ware JH. Random-effects models for longitudinal data. Biometrics. 1982;38(4):963-74.
12.	Diggle P, Kenward MG. Informative drop-out in longitudinal data-analysis. J R Stat Soc Ser C Appl Stat. 1994;43(1):49-93.
13.	Chang C-C, Lin C-J. LIBSVM: a library for support vector machines. ACM transactions on intelligent systems and technology (TIST). 2011;2(3):1-27.

