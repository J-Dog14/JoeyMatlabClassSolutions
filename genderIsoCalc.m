function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
%This function has two parts. The firts returns a martix with individual mean isometric strength
%calues across all 3 days of lifting for the appropriate group.
%The second set of outputs will return the single mean value for each group

male = Gender == {'M'};
findmale = find(male);
maleIsoIndMeans=(Day1(findmale)+Day2(findmale)+Day3(findmale))/3;
maleGroupIsoMean=mean(maleIsoIndMeans);
female = Gender == {'F'};
findfemale = find(female);
femaleIsoIndMeans=(Day1(findfemale)+Day2(findfemale)+Day3(findfemale))/3;
femaleGroupIsoMean=mean(femaleIsoIndMeans);

end

