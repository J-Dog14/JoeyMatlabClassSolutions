function [day1toDay2,day2toDay3] = dayComparator(SubjectID,Day1,Day2)
%This function takes the subject ids and two days as inputs and returns a
%matrix withthe subject ids of the subjects who had an increase fromt eh
%first to second day and can also be applied to those who had increases
%from the second to third day

day1toDay2 = zeros(25,1);
day2toDay3 = zeros(25,1);
SubjectMatrix=[SubjectID, Day1, Day2];%Makes a matrix for subjects and two days
for i=1:length(SubjectMatrix)
    if [Day1(i)]<[Day2(i)]
        [day1toDay2(i)] = 1;
    else
        [day1toDay2(i)] = 0;
    end
end

end

