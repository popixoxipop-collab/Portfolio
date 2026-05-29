 function [x,fx,ea,iter]=ParabolicOpt(f,x1,x2,x3,es,maxit,~)
 if nargin<4,error('at least 4 input arguments required'),end
 if nargin<5 || isempty(es), es=0.0001;end
 if nargin<6 || isempty(maxit), maxit=50;end
 iter=0; ea = 100; x4 = inf;
 while(1)
 iter=iter+1;
 x4old = x4;
 F1 = f(x1);F2 = f(x2);F3 = f(x3);
 x4 = x2 - (1/2)*((x2-x1).^2*(F2-F3)-(x2-x3).^2 ...
 *(F2-F1))/((x2-x1)*(F2-F3)-(x2-x3)*(F2-F1));
 F4 = f(x4);
 if x4 ~= 0, ea = abs((x4 - x4old)/x4) * 100; end
 fprintf('Iter : %2d → x1 = %.10f, x2 = %.10f,x3 = %.10f,x4 = %.10f, ea = %.6f\n' ...
 ,iter, x1, x2, x3, x4, ea)
 if ea <= es || iter >= maxit,break,end
 if x2 < x4
 x1 = x2; x2 = x4;
 else
 end
 end
 x2 = x4; x3 = x2;
 x=x4;fx=f(x4);