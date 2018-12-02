function [NegativeTrialMeans] = findNegativeMean(Subject)
%This function finds the negative means for each torque. Since some data
%is not aligned in the satance phase (have slightly different starting
%points) This function helps find a more realistic mean for average
%negative torque
% To isolate the negative numbers, any number less than zero is set to nan
% and then omitted in the mean function. 
% The input is the subject specific matrix and the output is the negative
% means that are found

 Subject(Subject>0)=nan;
for i=1:length(Subject)
    if Subject > 0
        Subject = NaN;
    end
        answer = mean(Subject,2, 'omitnan');
    NegativeTrialMeans = answer;
end
end

