clc
clear all
tic
Bx=xlsread('E:\graduate\code2\fly data\飞行数据整理\低空测区飞行\200m自南向北\1500-1600-Magnetic.xlsx','Sheet1','B2:B25001');
By=xlsread('E:\graduate\code2\fly data\飞行数据整理\低空测区飞行\200m自南向北\1500-1600-Magnetic.xlsx','Sheet1','C2:C25001');
Bz=xlsread('E:\graduate\code2\fly data\飞行数据整理\低空测区飞行\200m自南向北\1500-1600-Magnetic.xlsx','Sheet1','D2:D25001');
G1=xlsread('E:\graduate\code2\fly data\飞行数据整理\低空测区飞行\200m自南向北\1500-1600-Magnetic.xlsx','Sheet1','E2:E25001');
t=0.002;
[n,~]=size(Bx);
a=ones(n,1);
e=(1:n)';
k=(1:7)';
[e,k]=model1(a,t,G1,Bx,By,Bz,e,k);
E=[max(abs(e(:,2)));min(abs(e(:,2)));mean(abs(e(:,2)))];
bx=diff(Bx)/t;bx=[bx(1);bx];
by=diff(By)/t;by=[by(1);by];
bz=diff(Bz)/t;bz=[bz(1);bz];
b=G1; L=eye(7);
A=[a,Bx,By,Bz,bx,by,bz];
toc