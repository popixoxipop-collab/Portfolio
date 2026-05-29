function [x2,fx2,ea,iter]=Hal1(g,x0,x1,es,maxit)
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4 || isempty(es),es=1e-6;end
if nargin<5 || isempty(maxit),maxit=50;end
iter =0;ea=100;

while(1)
    x2=x1-((g(x1)*(x0-x1))/g(x0)-g(x1));
    iter=iter+1;
    fprintf(' iter =%3d xi-1 = %3.5f xi = %3.5f xi+1 = %3.5f',iter,x0,x1,x2);
    if x2 ~=0, ea = abs((x2-x1)/x2)*100;end
    fprintf(' ea =%3.4f %% \n',ea);
    if (ea<=es || iter >=maxit),break,end
    x0= x1;x1=x2;
end

fx2=g(x2);
end