function [SubjectMin, averageMin] = findMin(Subject)
%This function will take the subject matrix for each condtion as input and
%will find the minumum value for the matrix and output them as a 1x3 matrix
%   Input: Subject specific matrix consisting of their trials of each
%   conditions
%   Output: Subject Specific minimum for each column (trial) of the matrix
%   as well as the average minimum 

SubjectMin=(min(Subject));
averageMin = mean(SubjectMin);
end

