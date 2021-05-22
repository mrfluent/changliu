clc
clear all
tic
Bx=xlsread('E:\graduate\code2\fly data\飞行数据整理\高空学习飞行\1000m自北向南\800-1100-Magnetic.xlsx','Sheet1','B10001:B30000');
By=xlsread('E:\graduate\code2\fly data\飞行数据整理\高空学习飞行\1000m自北向南\800-1100-Magnetic.xlsx','Sheet1','C10001:C30000');
Bz=xlsread('E:\graduate\code2\fly data\飞行数据整理\高空学习飞行\1000m自北向南\800-1100-Magnetic.xlsx','Sheet1','D10001:D30000');
G1=xlsread('E:\graduate\code2\fly data\飞行数据整理\高空学习飞行\1000m自北向南\800-1100-Magnetic.xlsx','Sheet1','J10001:J30000');
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