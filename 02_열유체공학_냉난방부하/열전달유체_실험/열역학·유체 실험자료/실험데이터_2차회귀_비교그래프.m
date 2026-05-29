clear all;
close all; clc;


x=[0 16 18 32 49]';
y=[0.2 0.6 0.5 1.1 1.5]';
m=[0 0.7 1.1 1.9 2.3]';
n=[0.2 0.7 0.9 1.4 2]';


A=[1 0 0; 
    1 16 256;
    1 18 324;
    1 32 1024;
    1 49 2401];

C = inv(A'*A)*A'*y
D = inv(A'*A)*A'*m
E = inv(A'*A)*A'*n


x_g=0:0.1:50
y_g=C(1)+C(2).*x_g+C(3).*x_g.^2
d_g=D(1)+D(2).*x_g+D(3).*x_g.^2
e_g=E(1)+E(2).*x_g+E(3).*x_g.^2

plot(x_g,y_g);

hold on
plot(x_g,d_g);
plot(x_g,e_g);
plot(x,y,'r+');
axis([0 49 0 3]);