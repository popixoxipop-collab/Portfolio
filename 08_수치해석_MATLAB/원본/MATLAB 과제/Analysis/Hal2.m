function root = Hal2(func,xi,delta,error,maxit)
i=1;
xrold = 0;
xr= xi;
 
 while(1)
     xrold = xr;
     xr=xr- func(xr)/((func(xi+delta)-func(xi))/delta)
      fprintf(' i =%2d xr = %2.5f ',i,xr)
     er=(xr-xrold)/xr;
     fprintf('error= %2.4f %% \n',error);
     i=i+1;

 if i == maxit || abs(er) <= error,break,end
 end
end


