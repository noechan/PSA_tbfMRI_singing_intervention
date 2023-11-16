% FDR multiple comparisons correction
clear()
output_path='/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/verbal learning/pFDR/';
addpath('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/verbal learning/')
cd(output_path)

%Verbal learning: group x time tbfMRI (order: correct syll, correct and
%almost correct, correct minus error, correct words
pvals=[0.0009, 0.024, 0.014, 0.005];
[h, crit_p, adj_ci_cvrg, adj_p]=fdr_bh(pvals, 0.05, 'pdep');
save('adj_pvals_verbal_learning-groupxtime_tbfMRI_N19_jasp.mat', 'adj_p') 

%Verbal learning: post vs pre tbfMRI
%almost correct, correct minus error, correct words
pvals=[0.005, 0.013, 0.013, 0.006];
[h, crit_p, adj_ci_cvrg, adj_p]=fdr_bh(pvals, 0.05, 'pdep');
save('adj_pvals_verbal_learning-postvspre_tbfMRI_N19_jasp.mat', 'adj_p')

