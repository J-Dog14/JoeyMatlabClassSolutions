%% Matlab Project
% Joey Casadonte
% 11/5/18
% This project takes data from of participants knee torques during maximal
% walking speeds and running at the same speed. This toruqe data text file
% was generated from running a pipeline on the processed qtm data in V3D.
%
% The main goal of this function is to find the average knee torque, the
% peak knee torques, and peak negative torques for each of the praticipants
% two conditions. This will also be performed for the group means for each
% condition.
% The max and negative torques, and average positive and negative torques
% avereages and then torques throughout the stance phase are all plotted in
% graphs. The graphs are then exported as a JPEG.


%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Joey\Desktop\Github\JoeyMatlabClassSolutions\matlabClass\Final Project\Knee Torque Fast Walkng Slow Running.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/11/06 09:17:33

%% Initialize variables.
filename = 'C:\Users\Joey\Desktop\Github\JoeyMatlabClassSolutions\matlabClass\Final Project\Knee Torque Fast Walkng Slow Running.txt';
delimiter = '\t';
startRow = 8;
endRow = 130;

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%*s%*s%*s%*s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%*s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
S01C1T1 = cell2mat(raw(:, 1));
S01C1T2 = cell2mat(raw(:, 2));
S01C1T3 = cell2mat(raw(:, 3));
S02C1T1 = cell2mat(raw(:, 4));
S02C1T3 = cell2mat(raw(:, 5));
S03C1T1 = cell2mat(raw(:, 6));
S03C1T2 = cell2mat(raw(:, 7));
S03C1T3 = cell2mat(raw(:, 8));
S04C1T1 = cell2mat(raw(:, 9));
S04C1T2 = cell2mat(raw(:, 10));
S04C1T3 = cell2mat(raw(:, 11));
S04C2T2 = cell2mat(raw(:, 12));
S04C2T3 = cell2mat(raw(:, 13));
S01C2T1 = cell2mat(raw(:, 14));
S01C2T2 = cell2mat(raw(:, 15));
S01C2T3 = cell2mat(raw(:, 16));
S02C2T1 = cell2mat(raw(:, 17));
S02C2T2 = cell2mat(raw(:, 18));
S02C2T3 = cell2mat(raw(:, 19));
S03C2T1 = cell2mat(raw(:, 20));
S03C2T2 = cell2mat(raw(:, 21));
S03C2T3 = cell2mat(raw(:, 22));
S04C2T1 = cell2mat(raw(:, 23));


%% Clear temporary variables
clearvars filename delimiter startRow endRow formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp R;

%% Data Processing
% These lines will combibe each subjects three trials for each conditon
% into one matrix for the each condition for each subject
S01C1 = [S01C1T1 S01C1T2 S01C1T3];
S01C2 = [S01C2T1 S01C2T2 S01C2T3];
S02C1 = [S02C1T1 S02C1T3];
S02C2 = [S02C2T1 S02C2T2 S02C2T3];
S03C1 = [S03C1T1 S03C1T2 S03C1T3];
S03C2 = [S03C2T1 S03C2T2 S03C2T3];
S04C1 = [S04C1T1 S04C1T2 S04C1T3];
S04C2 = [S04C2T1 S04C2T2 S04C2T3];

% This section will fidn the minimum torques for each subjects condition
% matrix and will then take the average of those three values.
[S01C1C1min, S01C1minAvg]= findMin(S01C1);
[S01C2min, S01C2minAvg] = findMin(S01C2);

[S02C1C1min, S02C1minAvg]= findMin(S02C1);
[S02C2min, S02C2minAvg] = findMin(S02C2);

[S03C1C1min, S03C1minAvg]= findMin(S03C1);
[S03C2min, S03C2minAvg] = findMin(S03C2);

[S04C1C1min, S04C1minAvg]= findMin(S04C1);
[S04C2min, S04C2minAvg] = findMin(S04C2);

% This section operates the same as the section above but instead of
% average minimum, it will give us the average maximum
[S01C1max, S01C1maxAvg] = findMax(S01C1);
[S01C2max, S01C2maxAvg] = findMax(S01C2);

[S02C1max, S02C1maxAvg] = findMax(S02C1);
[S02C2max, S02C2maxAvg] = findMax(S02C2);

[S03C1max, S03C1maxAvg] = findMax(S03C1);
[S03C2max, S03C2maxAvg] = findMax(S03C2);

[S04C1max, S04C1maxAvg] = findMax(S04C1);
[S04C2max, S04C2maxAvg] = findMax(S04C2);

% This section will find the average positive torques for each column (trial) in
% each subjects matrix for both conditions

[S01C1positiveMeans] = findPositiveMean(S01C1);
[S01C2positiveMeans]= findPositiveMean(S01C2);

[S02C1positiveMeans]= findPositiveMean(S02C1);
[S02C2positiveMeans]= findPositiveMean(S02C2);

[S03C1positiveMeans]= findPositiveMean(S03C1);
[S03C2positiveMeans]= findPositiveMean(S03C2);

[S04C1positiveMeans]= findPositiveMean(S04C1);
[S04C2positiveMeans]= findPositiveMean(S04C2);

% This section will find the average negative torques for each column
% (trial) in each subjects matrix for both conditions
[S01C1negativeMeans] = findNegativeMean(S01C1);
[S01C2negativeMeans]= findNegativeMean(S01C2);

[S02C1negativeMeans]= findNegativeMean(S02C1);
[S02C2negativeMeans]= findNegativeMean(S02C2);

[S03C1negativeMeans]= findNegativeMean(S03C1);
[S03C2negativeMeans]= findNegativeMean(S03C2);

[S04C1negativeMeans]= findNegativeMean(S04C1);
[S04C2negativeMeans]= findNegativeMean(S04C2);

% this section will combine all of the subject's average minimums into one
% matrix for all of one condition
C1minMatrix = [S01C1minAvg, S02C1minAvg, S03C1minAvg, S04C1minAvg];
C2minMatrix = [S01C2minAvg, S02C2minAvg, S03C2minAvg, S04C2minAvg];

% this sectiron will combine all fo the subject's average maximums into one
% matrix for all of one condition
C1maxMatrix = [S01C1maxAvg, S02C1maxAvg, S03C1maxAvg, S04C1maxAvg];
C2maxMatrix = [S01C2maxAvg, S02C2maxAvg, S03C2maxAvg, S04C2maxAvg];

% this section will combine all of the subjects average positive torques
% into one matrix for all of one condition
C1PositiveMeanMatrix = [S01C1positiveMeans, S02C1positiveMeans, S03C1positiveMeans, S03C1positiveMeans];
C2PositiveMeanMatrix = [S01C2positiveMeans, S02C2positiveMeans, S03C2positiveMeans, S03C2positiveMeans];

% this section will combine al of the subjects average  negative torques
% into one matrix for all of one condition 
C1NegativeMeanMatrix = [S01C1negativeMeans, S02C1negativeMeans, S03C1negativeMeans, S03C1negativeMeans];
C2NegativeMeanMatrix = [S01C2negativeMeans, S02C2negativeMeans, S03C2negativeMeans, S03C2negativeMeans];

% This section will make a scatter plot showing each subjects torques
% throughout the time recorded for each condition
figure(1)
subplot(3,4,9)
plot(S01C1,'b');
hold on
plot(S02C1,'r');
plot(S03C1,'g');
plot(S04C1,'k');
title('Walking Torques')
ylabel('Torque')
xlabel('% Stance Phase')
grid on

subplot(3,4,10)
plot(S01C2,'b');
hold on
plot(S02C2,'r');
plot(S03C2,'g');
plot(S04C2,'k');
title('Running Torques')
ylabel('Torque')
xlabel('% Stance Phase')
grid on

% This is create a bar graph for each subjects average positive and
% negative torques split up by each condition
subplot(3,4,1)
C1posMeanGraph = bar(C1PositiveMeanMatrix);
hold on
title('Avg Walking')
xlabel('% Stance Phase')
ylabel('Torque')

subplot(3,4,2)
C2posMeanGraph = bar(C2PositiveMeanMatrix);
hold on
title('Avg Running')
xlabel('% Stance Phase')
ylabel('Torque')

subplot(3,4,5)
C1negMeanGraph = bar(C1NegativeMeanMatrix);
hold on
title('Avg Walking')
xlabel('% Stance Phase')
ylabel('Torque')

subplot(3,4,6)
C2negMeanGraph = bar(C2NegativeMeanMatrix);
hold on
title('Avg Running')
xlabel('% Stance Phase')
ylabel('Torque')

% This is create a bar graph for each subjects average minimum and maximum
% for the two conditions tested

subplot(3,4,7)
C1minGraph = bar(C1minMatrix);
hold on
title('Min Values Walking')
xlabel('Subject')
ylabel('Min Torque')

subplot(3,4,8)
C2minGraph = bar(C2minMatrix);
hold on
title('Min Values Running')
xlabel('Subject')
ylabel('Min Torque')

subplot(3,4,3)
C1maxGraph = bar(C1maxMatrix);
hold on
title('Max Values Walking')
xlabel('Subject')
ylabel('Max Torque')

subplot(3,4,4)
C2maxGraph = bar(C2maxMatrix);
hold on
title('Max Values Running')
xlabel('Subject')
ylabel('Max Torque')

% Threw these bad boys in here because the plot would look weird without
% them so therye just blank plots used as space fillers
subplot(3,4,11)
subplot(3,4,12)



% This section will export the figures and total averages of min, max, and
% average hip torque produced by all subjects 

    

saveas(figure(1),'Torques Throughout Stance Phase.jpeg','jpeg')
