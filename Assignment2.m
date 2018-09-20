% Joey Casadonte
% Due: 9/14/18
% This assignment is a number of exercises from chapters 1, 2, and 3
%
%% Chapter 1 Exercises
% 1.) 

Cu = 63.55

% 2.)

myage = 21
myage - 2
myage + 1

% 3.) 

namelengthmax = 63

% 4.)

wt1 = 1

wt1 =

     1

wt2 = 16

wt2 =

    16

who

Your variables are:

Cu     ans    myage  wt1    wt2    

whos
  Name       Size            Bytes  Class     Attributes

  Cu         1x1                 8  double              
  ans        1x1                 8  double              
  myage      1x1                 8  double              
  wt1        1x1                 8  double              
  wt2        1x1                 8  double              

clear wt1
who

Your variables are:

Cu     ans    myage  wt2    

whos
  Name       Size            Bytes  Class     Attributes

  Cu         1x1                 8  double              
  ans        1x1                 8  double              
  myage      1x1                 8  double              
  wt2        1x1                 8  double  

% 5.)

uint32 intmin

ans =

         105         110         116         109         105         110

uint32 intmax

ans =

         105         110         116         109          97         120

uint64 intmin

ans =

                  105                  110                  116                  109                  105                  110

uint64 intmax

ans =

                  105                  110                  116                  109                   97                  120


% 6.)

var6 =

   57.8470

int32 var6

ans =

         118          97         114          54

% 11.)

 pounds = 10

pounds =

    10
kilos = pounds * 2.2

kilos =

    22    

% 12.)

ftemp = 60

ftemp =

    60

ctemp = (ftemp - 32)* 5/9

ctemp =

   15.5556

% 13.)

feet = 45

feet =

    45

meters = feet * 0.3048

meters =

   13.7160

% 14.)

sind(90)

ans =

     1

sin = sind(90)

sin =

     1

% 15.)

r1 = 6

r1 =

     6

r2 = 8

r2 =

     8

r3 = 10

r3 =

    10

rt = 1/((1/r1)+(1/r2)+(1/r3))

rt =

    2.5532


% 22.)

%In ASCii coding, the capital letters come before the lowercase

% 24.)

'b' >= 'c' - 1

ans =

  logical

   1

3 == 2 + 1

ans =

  logical

   1

(3 == 2) +1

ans =

     1

xor(5 < 6, 8 > 4)

ans =

  logical

   0


% 25.)

x = 6

x =

     6

y = 11

y =

    11

if (x > 5)
x + y
else (y < 10)
y = 10
end

ans =

    17

% 26.)

3*10^5 == 3e5

ans =

  logical

   1

% 27.)

log10(10000)

ans =

     4

4 == log10(10000)

ans =

  logical

   1
   
%% Chapter 2 Exercises

% 1.)

x = 2:7

x =

     2     3     4     5     6     7

y = 1.100:0.2:1.700

y =

    1.1000    1.3000    1.5000    1.7000

z = 8:-2:2

z =

     8     6     4     2
     
% 2.)

vec = linspace(0,2*pi,50)

vec =

  Columns 1 through 10

         0    0.1282    0.2565    0.3847    0.5129    0.6411    0.7694    0.8976    1.0258    1.1541

  Columns 11 through 20

    1.2823    1.4105    1.5387    1.6670    1.7952    1.9234    2.0517    2.1799    2.3081    2.4363

  Columns 21 through 30

    2.5646    2.6928    2.8210    2.9493    3.0775    3.2057    3.3339    3.4622    3.5904    3.7186

  Columns 31 through 40

    3.8468    3.9751    4.1033    4.2315    4.3598    4.4880    4.6162    4.7444    4.8727    5.0009

  Columns 41 through 50

    5.1291    5.2574    5.3856    5.5138    5.6420    5.7703    5.8985    6.0267    6.1550    6.2832
    
% 3.)    

vector = linspace(2,3,6)

vector =

    2.0000    2.2000    2.4000    2.6000    2.8000    3.0000

% 4.)

A = -5:-1, 5:2:9, 8:-2:4

A =

    -5    -4    -3    -2    -1


ans =

     5     7     9


ans =

     8     6     4
     
% 6.)

B = -1:.5:1

B =

   -1.0000   -0.5000         0    0.5000    1.0000

C = B.'

C =

   -1.0000
   -0.5000
         0
    0.5000
    1.0000
    
% 7.)    
     
odds = A(mod(A,2)~=0)

odds =

    -5    -3    -1
    
% 8.)

mat = [7 8 9 10; 12 10 8 6]

mat =

     7     8     9    10
    12    10     8     6

mat(1,3)

ans =

     9

mat(2,:)

ans =

    12    10     8     6
 
mat(:,[1:2])

ans =

     7     8
    12    10
    
% 9.)

mat = [1 2 1 2; 2 1 2 1]

mat =

     1     2     1     2
     2     1     2     1

     
% 10.)
mat = [1 2 1 2; 2 1 2 1]

mat =

     1     2     1     2
     2     1     2     1

mat = [1:4 ; 2 1 9 1]

mat =

     1     2     3     4
     2     1     9     1
     
% 12.)

rows = randi(5,1)

rows =

     3

cols = randi(5,1)

cols =

     2

mat = [0 0;0 0;0 0]

mat =

     0     0
     0     0
     0     0     

% 23.)

sum = 3 + 5 + 7 + 9 + 11

sum =

    35

% 26.)

num = 3:2:9

num =

     3     5     7     9

den = 1:4

den =

     1     2     3     4

num + den

ans =

     4     7    10    13

% 30.)

r = randi([-10,10],[1,5])

r =

    -2    -1     9    10     6

r-3

ans =

    -5    -4     6     7     3
    
    
r2 = abs(r)

r2 =

     2     1     9    10     6  
     
r3 = max(r)

r3 =

    10     

% 31.)

 m = randi(100,[3,5])

m =

    16     8    84    81    27
    96    32     1    25    11
    54    90    65     7    49

M = max(m)

M =

    96    90    84    81    49

M2 = max(m,[],2)

M2 =

    84
    96
    90


%% Chapter 3 Exercises

% 1.)

r0 = randi(100)
                    % I used a random number generator to give me value
                    % between 1 and 100 for r0
r0 =

    42

ri = randi(100)
                    % I used a random number generator to give me value
                    % between 1 and 100 for ri
ri =

    39

volume = (4*pi/3)*(r0^3-ri^3)

volume =

   6.1864e+04

% 4.)

vec = input('Enter a vector: ')
Enter a vector: randi(100,[5,5])

vec =

    89    24    41    54    77
    43     3    25    17    81
    29    71    66    89    64
     5     1    33    67    72
    22    62    11    85    69

% 6.)

fprintf('12345.6789')
12345.6789>>

% 8.)



% 13.)
