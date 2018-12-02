function [SubjectMax, averageMax] = findMax(Subject)
%This function will take the subject matrix for each condtion as input and
%will find the miximum value for the matrix and output them as a 1x3 matrix
%   Input: Subject specific matrix consisting of their trials of each
%   conditions
%   Output: Subject Specific maximum for each column (trial) of the matrix
%   as well as the average max for each

SubjectMax=(max(Subject));
averageMax = mean(SubjectMax);

end

