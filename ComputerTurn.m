function [Win, gameboard] = ComputerTurn(Xturn,Win,gameboard)
%This function should automatically plot an X for the computers turn
%   Ceillings are set and free spot checks are included
xmat=0;ymat=0;

while Xturn==1
    hold on
    gameboard;
    
    gameboardnew = gameboard;
    gameboardnew;
    if gameboard(3,1) == 0
        plot(1-.5,1-.5,'rx','MarkerSize',100);
        gameboard(3,1) = 2;
    elseif gameboard(1,1) == 0
        plot(1-.5,3-.5,'rx','MarkerSize',100);
        gameboard(1,1) = 2;
    elseif gameboard(1,3) == 0
        plot(3-.5,3-.5,'rx','MarkerSize',100);
        gameboard(1,3) = 2;
    elseif gameboard(2,2) == 0
        plot(2-.5,2-.5,'rx','MarkerSize',100);
        gameboard(2,2) = 2;
    elseif gameboard(2,1) == 0
        plot(1-.5,2-.5,'rx','MarkerSize',100);
        gameboard(2,1) = 2;
    elseif gameboard(1,2) == 0
        plot(2-.5,3-.5,'rx','MarkerSize',100);
        gameboard(1,2) = 2;
    elseif gameboard(3,3) == 0
        plot(3-.5,1-.5,'rx','MarkerSize',100);
        gameboard(3,3) = 2;
    elseif gameboard(2,3) == 0
        plot(3-.5,2-.5,'rx','MarkerSize',100);
        gameboard(2,3) = 2;
    else
        plot(2-.5,1-.5,'rx','MarkerSize',100);
        gameboard(2,3) = 2;
        
    end
    Xturn=0;
end






