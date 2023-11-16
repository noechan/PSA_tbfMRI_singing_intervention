% FDR multiple comparisons correction
clear()
output_path='/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/outputs/pFDR';
addpath('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/')
cd(output_path)

%Verbal learning: group x time tbfMRI cluster mean insula R (order: correct syll, correct and
%almost correct, correct minus error, correct words
pvals=[0.0059, 0.0698, 0.0491, 0.0185];
[h, crit_p, adj_ci_cvrg, adj_p]=fdr_bh(pvals, 0.05, 'pdep');
save('adj_pvals_verbal_learning-groupxtime_tbfMRI_cluster_N19_jasp_v3.mat', 'adj_p') 
%adj_p=[0.0236*; 0.0698;0.0655;0.0370*];

%Clinical outcomes: group x time tbfMRI cluster mean insula R (order:
%communication index, responsive speech index)
pvals=[0.0135, 0.0062];
[h, crit_p, adj_ci_cvrg, adj_p]=fdr_bh(pvals, 0.05, 'pdep');
save('adj_pvals_verbal_clinicaloutcomes-groupxtime_tbfMRI_cluster_N19_jasp_v3.mat', 'adj_p') 
%adj_p=[0.0135; 0.0124];

%Clinical outcomes: pre-post tbfMRI cluster mean STG R (order:
%communication index, responsive speech index)
pvals=[1.2224e-4, 0.7119];
[h, crit_p, adj_ci_cvrg, adj_p]=fdr_bh(pvals, 0.05, 'pdep');
save('adj_pvals_verbal_clinicaloutcomes-prepost_tbfMRI_cluster_N19_jasp_v3.mat', 'adj_p') 
%adj_p=[2.4448e-4; 0.7119];
