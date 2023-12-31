function LASAverballearningflexN19 = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  LASAVERBALLEARNINGFLEXN19 = IMPORTFILE(FILENAME) reads data from text
%  file FILENAME for the default selection.  Returns the data as a table.
%
%  LASAVERBALLEARNINGFLEXN19 = IMPORTFILE(FILE, DATALINES) reads data
%  for the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  LASAverballearningflexN19 = importfile("/Users/noeliamartinezmolina/Documents/GitHub/tbfMRI_LASA_current_code/notebooks/behaviour copia/LASA_verbal_learning_flex_N19.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 09-Nov-2023 15:52:11

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 7);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["ID_BIDS", "Group", "UU_C_syll_2vs1", "UU_C_and_alm_C_syll_2vs1", "UU_C_minus_errors_syll_2vs1", "UU_C_words_2vs1", "UU_minus_TY_syll_sum_perc_2vs1"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
LASAverballearningflexN19 = readtable(filename, opts);

end