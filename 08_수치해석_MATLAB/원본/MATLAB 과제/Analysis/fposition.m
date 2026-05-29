function [root,fx,ea,iter]=fposition(func,xl,xu,es,maxit,varagin)
if nargin<3,error('at least 3 input arguments required'),end
test=func(xl)*func(xu);
if test>0,error('no sign change'),end
if nargin<4 || isempty(es),es=0.0001;end
if nargin<5 || isempty(maxit),maxit=50;end
iter =0; xr = xl;ea=100;

while(1)
xrold= xr;xr=xu-(func(xu).*(xl-xu))./(func(xl)-(func(xu)));
iter=iter+1;
fprintf(' iter =%2d  xl = %2.4f,xu = %2.4f,xr = %2.4f \n',iter,xl,xu,xr);
if xr~=0,ea=abs((xr-xrold)/xr)*100;end
test= func(xl)*func(xr);
if test <0
    xu=xr;
elseif test > 0
    xl=xr;
else 
    ea=0;
end
fprintf(' ea =%.4f \n',ea);
if ea <= es || iter >=maxit,break,end
end
root = xr;fx=func(xr);

   