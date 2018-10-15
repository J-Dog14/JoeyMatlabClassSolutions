function [Win] = ComputerWon(gameboard)
%This fucntion checks for a win condition from either the user
Win=false;

if (gameboard(1,1)==gameboard(1,2)&&gameboard(1,1)==gameboard(1,3)&&gameboard(1,1)==2)
    Win=true;
elseif (gameboard(1,1)==gameboard(2,1)&&gameboard(1,1)==gameboard(3,1)&&gameboard(1,1)==2)
    Win=true;
elseif (gameboard(1,1)==gameboard(2,2)&&gameboard(1,1)==gameboard(3,3)&&gameboard(1,1)==2)
    Win=true;
elseif (gameboard(3,1)==gameboard(2,2)&&gameboard(3,1)==gameboard(3,1)&&gameboard(3,1)==2)
    Win=true;
elseif (gameboard(3,1)==gameboard(3,2)&&gameboard(3,1)==gameboard(3,3)&&gameboard(3,1)==2)
    Win=true;
elseif (gameboard(2,1)==gameboard(2,2)&&gameboard(2,1)==gameboard(2,3)&&gameboard(2,1)==2)
    Win=true;
elseif (gameboard(1,2)==gameboard(2,2)&&gameboard(1,2)==gameboard(3,2)&&gameboard(1,2)==2)
    Win=true;
elseif (gameboard(1,3)==gameboard(2,3)&&gameboard(1,3)==gameboard(3,3)&&gameboard(1,2)==2)
    Win=true;
else
    Win=false;
    
end


