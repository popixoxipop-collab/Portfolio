function [r,t]=flow(x,y)
r=0;
while(1)
    
    if x<0 && y>0,r=sqrt(x^2+y^2); end      
    if  x<0 && y<0
        r=sqrt(x^2+y^2);end
        t=(atan(y/x)+pi)*180/pi;
    if  x<=0 && y==0, r=x;    t=pi*180/pi;end
    
       
    if  x==0 && y>0 ,r=y;t=(pi*180)/(2*pi);end
     
        
    if  x==0 && y<0,r=y;t=-(pi*180)/(2*pi);end
        
        
    if  x==0 && y==0, r=0; t=0;end
    fprintf('r =%2d theta = %2d',r,t),break
     
end
     