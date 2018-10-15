function [figure, gameboard] = UserTurn(Oturn,figure, gameboard)
%This function allows the user to make their turn as an O
%   The gameboard is converted to a matrix, ceilings and floors are set so
%   that the user can click anywhere in the gaemboard.
xmat=0;ymat=0;

while Oturn==1
    hold on
    [x,y] = ginput(1);
    x=ceil(x);
    y=ceil(y);
    gameboard;
    %check gameboard for available spot
    if(y == 1)
        gameboardy = 3;
    elseif(y==3)
        gameboardy = 1;
    else
        gameboardy = y;
    end
    gameboardnew = gameboard;
    gameboardnew;
    if(gameboard(gameboardy,x)==0)
        plot(x-.5,y-.5,'ro','MarkerSize',80);
        gameboard(gameboardy,x)=1;
    else
        uiwait(errordlg('Please Select A Spot That Is Not Taken'))
        continue;
    end
        
    Oturn=0;
    
    %invalid move
    if x<=0||y<=0||y>3||x>3
        uiwait(errordlg('Please Select A Spot On The Board'))
        continue;
    end
    
    
end
end

