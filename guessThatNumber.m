function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber()
%
%        NAME:Joey Casadonte
%
%         DUE: November 27
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it,
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 10 - 12 bugs,
%              depending on how you correct them.
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;     % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
    'This program plays the game of Guess That Number in which you have to guess\n', ...
    'a secret number.  After each guess you will be told whether your \n', ...
    'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): ');

while level ~= beginner && level ~= moderate && level ~= advanced %BUG FOUND with while loop so it was changed to an if statement adn '||' was changed to '&&'
    fprintf('Sorry, that is not a valid level selection.\n')
    level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner   %BUG FOUND, profile on and ran the code and it identified '=' which was changed to '=='
    
    highest = beginnerHighest;
    
elseif level == moderate
    
    highest = moderateHighest;
    
elseif level == advanced
    
    highest = advancedHighest;    %BUG FOUND using profile on, 'h' was not capilized
    
end
% randomly select secret number between 1 and highest for level of play

secretNumber = floor(randi([1,highest]));    % BUG FOUND Rand swithced to randi and added the 1 and highest inside the conditions of randi

% initialize number of guesses and User_guess

numOfTries = 0;  % BUG FOUND number of tries changed to 0
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber
    
    % get a valid guess (an integer from 1-Highest) from the user
    
    fprintf('\nEnter a guess (1-%d): ', highest);
    userGuess = input('');
    
    
    while userGuess < 1 || userGuess > highest %BUG FOUND, took out the '=' sign so that the highest number can be guessed
        
        fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);
        
        userGuess = input('');
        
    end % of guess validation loop
    % add 1 to the number of guesses the user has made
    numOfTries = numOfTries + 1;
    
    % report whether the user's guess was high, low, or correct
    
    if userGuess < secretNumber % BUG FOUND, '>' was changed to '<'
        fprintf('Sorry, %d is too low.\n', userGuess);
    elseif userGuess > secretNumber
        fprintf('Sorry, %d is too high.\n', userGuess);
    elseif numOfTries == 1
        fprintf('\nLucky You!  You got it on your first try!\n\n');
    else
        fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
            secretNumber, numOfTries); % BUG FOUND, number of tries was not displaying at the end so it was added here
        
    end % BUG FOUND with profile on and running the code it identified an 'end' was missing so it was added
    
end  % of guessing while loop
fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n'); %BUG FOUND (maybe) moved the game over message to the end of the loop but I'm not sure if it's a real bug
% end of game