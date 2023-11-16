function LASAverballearningpairedTN19 = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  LASAVERBALLEARNINGPAIREDTN19 = IMPORTFILE(FILENAME) reads data from
%  text file FILENAME for the default selection.  Returns the data as a
%  table.
%
%  LASAVERBALLEARNINGPAIREDTN19 = IMPORTFILE(FILE, DATALINES) reads data
%  for the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  LASAverballearningpairedTN19 = importfile("/Volumes/LASA/Aphasia_project/tb-fMRI/results/behaviour/cluster/mean/LASA_verbal_learning_pairedT_N19.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 09-Nov-2023 15:18:56

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 7, "Encoding", "UTF-8");

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["ID_BIDS", "Group", "Trained_Song", "TRvsUTR_C_syll_postvspre", "TRvsUTR_C_and_alm_C_syll_postvspre", "TRvsUTR_C_minus_errors_syll_postvspre", "TRvsUTR_C_words_postvspre"];
opts.VariableTypes = ["double", "double", "categorical", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "Trained_Song", "EmptyFieldRule", "auto");

% Import the data
LASAverballearningpairedTN19 = readtable(filename, opts);

end