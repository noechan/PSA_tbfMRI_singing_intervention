function L2_PairedT_SingaVSRest_TU_Age(subjects, outdir, varargin)
%L2_PairedT_LisVsRest_TU
%----------------------------------------------------------------------------------------
% Initialise inputs and pathnames
p = inputParser;

p.addRequired('subjects', @isstruct);
p.addRequired('outdir', @ischar);

p.addParameter('derdir', 'derivatives', @ischar)
p.addParameter('ses1', 'ses-001', @ischar)
p.addParameter('ses2', 'ses-002', @ischar)
p.addParameter('L1dir', 'SPM_first_level', @ischar)
p.addParameter('L1folder', 'L1_dur0_explbase_microres72_art_explmask_TU_missed', @ischar)
p.addParameter('L2folder', 'singa_vs_rest_TU_2by2_Age_TIV_WABAQ_expmaskBRAVE_les', @ischar)

p.parse(subjects, outdir, varargin{:});
Arg = p.Results;
 
%% Model specification    
matlabbatch{1}.spm.stats.factorial_design.dir = {fullfile(outdir, Arg.L2folder)};
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).name = 'subject';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).dept = 0; %independent
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).variance = 0; %equal
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).name = 'group';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).dept = 0; %independent
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).variance = 1; %unequal
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).name = 'time';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).dept = 1; %dependent
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).variance = 0; %equal
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).ancova = 0;

%Select scans
n=1; a=1;
for sbj = 1:size(subjects, 1)
    disp(subjects(sbj).name)
    sub_path= fullfile(subjects(sbj).folder, subjects(sbj).name);
    if subjects(sbj).group==1
        gr=1;
    elseif subjects(sbj).group==2
        gr=2;
    end
    
    %scans session 1
    sub_path_ses1= fullfile(sub_path, Arg.ses1, Arg.derdir,Arg.L1dir, Arg.L1folder);
    cd(sub_path_ses1), load('SPM.mat')
    con_idx_ses1=find(ismember({SPM.xCon.name}, {'Sing_along>baseline'}));
    if ~isempty(con_idx_ses1)
        if con_idx_ses1 >9
            con_ses1{sbj,1}=spm_select('List', fullfile(sub_path_ses1),['^con_00' num2str(con_idx_ses1) '.*\.nii$']);
        elseif con_idx_ses1 <10
            con_ses1{sbj,1}=spm_select('List', fullfile(sub_path_ses1),['^con_000' num2str(con_idx_ses1) '.*\.nii$']);
        end
        con_fnames_ses1{sbj,1}=fullfile(sub_path_ses1, con_ses1{sbj,1});
    end
    clear SPM
    
    %scans session 2
    sub_path_ses2= fullfile(sub_path, Arg.ses2, Arg.derdir,Arg.L1dir, Arg.L1folder);
    cd(sub_path_ses2), load('SPM.mat')
    con_idx_ses2=find(ismember({SPM.xCon.name}, {'Sing_along>baseline'}));
    if ~isempty(con_idx_ses2)
        if con_idx_ses2 >9
            con_ses2{sbj,1}=spm_select('List', fullfile(sub_path_ses2),['^con_00' num2str(con_idx_ses2) '.*\.nii$']);
        elseif con_idx_ses2 <10
            con_ses2{sbj,1}=spm_select('List', fullfile(sub_path_ses2),['^con_000' num2str(con_idx_ses2) '.*\.nii$']);
        end
        con_fnames_ses2{sbj,1}=fullfile(sub_path_ses2, con_ses2{sbj,1});
    end
    clear SPM
        
    if ~isempty(con_idx_ses1) && ~isempty( con_idx_ses2) 
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(n).scans = vertcat(con_fnames_ses1(sbj,1), con_fnames_ses2(sbj,1));
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(n).conds = [gr 1; gr 2];
        n=n+1;
    else
        idx_Age(a,1)=sbj;
        exclude_sbj{a,1}= subjects(sbj).name;
        a=a+1;
    end
end

matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{1}.inter.fnums = [2
    3];
matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{2}.fmain.fnum = 1;

% Input age covariate:
if exist('idx_Age'), subjects(idx_Age)=[]; end
age_double= [subjects(:).age]; age_double=repmat(age_double,2,1); age_double=reshape(age_double,numel(age_double),1);
TIV_double= [subjects(:).TIV]; TIV_double=repmat(TIV_double,2,1); TIV_double=reshape(TIV_double,numel(TIV_double),1);
WAB_AQ_double= [subjects(:).WAB_AQ]; WAB_AQ_double=repmat(WAB_AQ_double,2,1); WAB_AQ_double=reshape(WAB_AQ_double,numel(WAB_AQ_double),1);
Lesion_size_double= [subjects(:).Lesion_size]; Lesion_size_double=repmat(Lesion_size_double,2,1); Lesion_size_double=reshape(Lesion_size_double,numel(Lesion_size_double),1);
matlabbatch{1}.spm.stats.factorial_design.cov(1).c = age_double;
matlabbatch{1}.spm.stats.factorial_design.cov(1).cname = 'Age';
matlabbatch{1}.spm.stats.factorial_design.cov(1).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(1).iCC = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(2).c = WAB_AQ_double;
matlabbatch{1}.spm.stats.factorial_design.cov(2).cname = 'WAB_AQ';
matlabbatch{1}.spm.stats.factorial_design.cov(2).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(2).iCC = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(3).c = TIV_double;
matlabbatch{1}.spm.stats.factorial_design.cov(3).cname = 'TIV';
matlabbatch{1}.spm.stats.factorial_design.cov(3).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(3).iCC = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(4).c = Lesion_size_double;
matlabbatch{1}.spm.stats.factorial_design.cov(4).cname = 'Lesion_size';
matlabbatch{1}.spm.stats.factorial_design.cov(4).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(4).iCC = 1;

matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 0;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {'/Volumes/LASA/Aphasia_project/tb-fMRI/results/masks/BRAVE_masks/Sing_along-baseline_unc_p0-001_k248.nii,1'};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;


%% Model estimation
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;


%% Contrast specification
matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'AB>BA x TP2>TP1';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [-1 1 1 -1];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'BA>AB x TP2>TP1';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [1 -1 -1 1];
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;

spm_jobman ('interactive', matlabbatch)