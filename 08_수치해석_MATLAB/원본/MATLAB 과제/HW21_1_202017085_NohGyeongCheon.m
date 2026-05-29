format compact
A= [2 -6 -1 ; -3 -1 7 ; -8 1 -2 ]
b= [ -38 ;-34; -20 ]
fprintf( "   A\\b 사용으로 x검증 \n")
A\b
fprintf( "   inv(A)*b 사용으로 x검증 \n")    
inv(A)*b
fprintf( "   계수행렬에 LU분해법 사용\n")
B= [10 2 -1 ; -3 -6 2 ; 1 1 5];
c= [27 ; -61.5; -21.5];
[L,U] =lu(B)
fprintf( "   L*U의 값 \n")
L*U
d=L\c
x=U\d
fprintf( "   x검증) U*x의 값 d와 비교 \n")
U*x
fprintf( "   x검증) L*U*x의 값 \n")
L*U*x 
fprintf( "   계수행렬의 역행렬로 LU분해법 사용\n")
[L2,U2]=lu( inv(B))
fprintf( "   L2*U2의 값 \n")
L2*U2 
fprintf( "   inv(B)의 값 \n")
inv(B)
d2=L2\c
x2=U2\d2
fprintf( "   x검증) U2*x2의 값 d2와 비교 \n")
U2*x2
fprintf( "   x검증) L2*U2*x2의 값 \n")
L2*U2*x2
