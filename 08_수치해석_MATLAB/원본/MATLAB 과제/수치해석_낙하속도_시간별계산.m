format short g
t=[0 1 2 3 4 5 6 7 8];
g=9.81; m=70;cd=0.275;
v=round(sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t))
