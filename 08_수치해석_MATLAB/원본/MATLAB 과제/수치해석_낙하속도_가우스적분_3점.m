format short g

g=9.81; m=70;cd=0.275;


a=4+4*(-sqrt(3/5));
b=4;
c=4+4*(sqrt(3/5));
t=[a b c];
v=sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t)