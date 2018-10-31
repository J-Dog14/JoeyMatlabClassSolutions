% Assignment 5
% Joey Casadonte 10/18/18
% Due 10/30/18
% This assignment uses a spreadsheet of data from the spreadsheet put on
% blackboard. Import functions and other functions will be used to process
% the data  and organize it in matlab
close all
clear all
%This function brings in the data imported with the import function with
%each column as a seperate vector
[SubjectID,Age,Gender,Weight,Day1,Day2,Day3] = importfile('isok_data_6803.csv');

%This calulates individual and group means for each day for both males and
%females
[maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3);

%This inputs the first two days and outputs a matrix that displays a 1 if
%day 2 is greater than day 1
[day1toDay2] = dayComparator(SubjectID,Day1,Day2); 

%This inputs the first two days and outputs a matrix that displays a 1 if
%day 3 is greater than day 2
[day2toDay3] = dayComparator(SubjectID,Day2,Day3);

%These next lines normalize the data for each day with their weight
NormDay1=Day1./Weight;
NormDay2=Day2./Weight;
NormDay3=Day3./Weight;

%Adds up all the normalized values for the days
totalNormDay1=sum(NormDay1);
totalNormDay2=sum(NormDay2);
totalNormDay3=sum(NormDay3);

%Divides the total of each day by 25 to get the average for each day
normDay1mean=(totalNormDay1/25);
normDay2mean=(totalNormDay2/25);
normDay3mean=(totalNormDay3/25);

%This put all variables that have less than 25 values so that the rest of
%their column reads not a number. This way all teh data can be put in a
%table

femaleGroupIsoMean(2:25,1) = nan;
maleGroupIsoMean(2:25,1) = nan;
normDay1mean(2:25,1) = nan;
normDay2mean(2:25,1) = nan;
normDay3mean(2:25,1) = nan;
maleIsoIndMeans(14:25,1) = nan;
femaleIsoIndMeans(13:25,1) = nan;

%This creates a table out of the data so that it can be easily exported 
T=table(maleIsoIndMeans,maleGroupIsoMean,femaleIsoIndMeans,femaleGroupIsoMean,day1toDay2,day2toDay3,normDay1mean,normDay2mean,normDay3mean);

%This will export the data into a csv file
writetable(T,'iso_results.csv')




