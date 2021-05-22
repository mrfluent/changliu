function [e,k]=model1(a,t,G1,Bx,By,Bz,e,k)
bx=diff(Bx)/t;bx=[bx(1);bx];
by=diff(By)/t;by=[by(1);by];
bz=diff(Bz)/t;bz=[bz(1);bz];
B=[a,Bx,By,Bz,bx,by,bz];
[Q,R]=qr(B');
k0=Q*pinv(R')*G1;
e0=B*k0-G1;
k=[k,k0];
%k=lsqr(A,b,1e-06,500);
e=[e,e0];