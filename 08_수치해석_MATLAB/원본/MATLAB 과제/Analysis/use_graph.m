clear ,clc, format compact
a=-2.75;b=18;c=-21;d=-12;
mp=linspace(-1,5);
fp=a.*mp.^3+b.*mp.^2+c.*mp+d;
plot(mp,fp),grid