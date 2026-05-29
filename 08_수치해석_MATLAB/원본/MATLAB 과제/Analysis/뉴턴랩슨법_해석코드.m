function [root,ea,iter]=newtraph(func,dfunc,xr,es,maxit,varagin)
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4 || isempty(es),es=0.0001;end
if nargin<5 || isempty(maxit),maxit=50;end
iter =0; 
while(1)
    xrold=xr;
    xr=xr-func(xr)/dfunc(xr);
    iter=iter+1;
    fprintf(' iter =%2d xr = %2.5f',iter,xr);
    if xr ~=0, ea = abs((xr-xrold)/xr)*100;end
    fprintf(' ea =%2.4f %% \n',ea);
    if ea <=es || iter >=maxit,break,end
end
root=xr;
end
   
