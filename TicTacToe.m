% Joey Casadonte
% 9/25/2018
% This assignment is as simple as a game of tic tac toe. The user will be
% asked to play tic tac toe and the program will execute until the user
% says no
% How to play Tic-Tac-Toe
% Computer will go first and will select a box with an 'X'
% The player will then select a tile and it will be filled with an 'O'
% The computer will then go again and this will continue until three in
% a row is achieved by the computer or player
% If board is filled without three in a row, the game is a draw.

% Code Start
% Reset Matlab

ttt=true;
while ttt==true
    Start = menu('Would you like to play a game?','Yes','No');
    if Start == 1
        close all
        clear all
        
        
        
        % Create gameboard
        figure('Name','Tic Tac Toe'); %Creates pop up figure
        figure = 'Gameboard'; %labels gameboard
        plot(-1. -1); %plots y axis -3:-1 and the x axis 0:2
        axis([0 3 0 3]); %put the axis's 0 to 3
        set(gca,'xTick',0:3); %makes only whole numbers appear on the x-axis
        set(gca,'yTick',0:3); %makes only whole numbers appear on the y-axis
        set(gca,'xTickLabel',''); %gets rid of the numbers on the x tick
        set(gca,'yTickLabel',''); %gets rid of the numbers on the y tick
        grid on %turns on grid lines
        shg %brings the board to the front of your screen
        
        gameboard = zeros(3,3);
        
        Win = false;
        while Win~= true
            
            
            
            Question = menu('Who should go first?','Hooman','Intelligent Computer');
            if Question == 1
                
                
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                for i = flip(1:1)
                    pause(.5)
                end
                %Computer turn
                [figure, gameboard] = ComputerTurn(1,figure,gameboard);
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                for i = flip(1:1)
                    pause(.5)
                end
                %Computer turn
                [figure, gameboard] = ComputerTurn(1,figure,gameboard);
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                %User win check
                [Win] = UserWon(gameboard);
                for i = flip(1:1)
                    pause(.5)
                end
                %Computer turn
                [figure, gameboard] = ComputerTurn(1,figure,gameboard);
                %Computer win check
                [Win] = ComputerWon(gameboard);
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                %User win check
                [Win] = UserWon(gameboard);
                for i = flip(1:1)
                    pause(.5)
                end
                %Computer turn
                [figure, gameboard] = ComputerTurn(1,figure,gameboard);
                %Computer win check
                [Win] = ComputerWon(gameboard);
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                %User win check
                [Win] = UserWon(gameboard);
                
            elseif Question == 2
                
                hold on
                plot(.5,.5,'rx','MarkerSize',100)
                gameboard(3,1) = 1;
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                for i = flip(1:1)
                    pause(.5)
                end
                %Computer turn
                [figure, gameboard] = ComputerTurn(1,figure,gameboard);
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                for i = flip(1:1)
                    pause(.5)
                end
                %Computer turn
                [figure, gameboard] = ComputerTurn(1,figure,gameboard);
                %Computer win check
                [Win] = ComputerWon(gameboard);
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                %User win check
                [Win] = UserWon(gameboard);
                for i = flip(1:1)
                    pause(.5)
                end
                %Computer turn
                [figure, gameboard] = ComputerTurn(1,figure,gameboard);
                %Computer win check
                [Win] = ComputerWon(gameboard);
                %User turn
                [figure, gameboard] = UserTurn(1,figure, gameboard);
                %User win check
                [Win] = UserWon(gameboard);
                for i = flip(1:1)
                    pause(.5)
                end
                %Computer turn
                [figure, gameboard] = ComputerTurn(1,figure,gameboard);
                %Computer win check
                [Win] = ComputerWon(gameboard);
            end
        end
    
        if Win == true
            WinBox=menu('That''s A Dub! Wanna Play Again?','Yes','No');
            if WinBox ==1
                ttt=true;
            else
                ttt=false;
            end
        elseif Win ~= true
            TieBox=menu('It''s A Tie! Want To Play Again?','Yes','No');
            if TieBox == 1
                ttt=true;
            else
                ttt=false;
            end
        end
        
    else
        Start == 2;
        msgbox('oh well...goodbye')
        ttt=false;
        
    end
end
