function [x,fx,ea,iter]=goldmin(f,xl,xu,es,maxit,~)
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4 || isempty(es),es=0.0001;end
if nargin<5 || isempty(maxit),maxit=50;end
phi = (1+sqrt(5))/2;iter=0;
d=(phi-1)*(xu-xl);
x1=xl+d;x2=xu-d;
f1=f(x1);f2=f(x2);
while(1)
    xint = xu - xl;
    fprintf('x1 = %3.5f x2 = %3.5f',x1,x2);
    fprintf(' iter =%3d xl = %3.5f xu = %3.5f ',iter,xl,xu);
    if f1<f2
        xopt=x1;xl=x2;x2=x1;f2=f1;
        x1=xl+(phi-1)*(xu-xl);f1=f(x1);
    else
        xopt=x2;xu=x1;x1=x2;f1=f2;
        x2=xu-(phi-1)*(xu-xl);f2=f(x2);
    end
    
   
 iter=iter+1;
 if xopt ~=0,ea=(2-phi)*abs(xint/xopt)*100;end
 if ea <= es || iter >= maxit,break,end
  fprintf(' ea =%2.4f %% \n',ea);
end
x=xopt;fx=f(xopt);
end
