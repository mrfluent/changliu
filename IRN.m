function x =IRN(A, L, b, miu, p, q, tau, tol, maxit, epsf, epsl)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%迭代初值
%x = b;
x=(A'*A+miu*L'*L)\(A'*b);


%normIg = norm(Ig);%真实值的二范数

%Lx = L * x;

e = 1;
ex = 1;
iters = [];
x0 = x;
es = [];
exs = [];
ts = [];
snrs = [];

tic;
while(ex > tau)
    Lx = L * x;
    r = A * x - b;
    
    WF = W(r, p, epsf);%理论上的WF是对角矩阵，这里的WF是一个由对角元素组成的向量
    WL = W(Lx, q, epsl);%同上
    AWALWL= A' *diag(WF)*A+miu * L' *diag(WL) *L;
    AWFb = A'*diag(WF)*b;
    
    %% 内迭代
    x1 = x0;
    x0 = x;
    
    %求解正规方程,这个是解决求逆的问题
	[x,iter] = irnmpcg(A, L, b, miu, WF, WL, x, tol, maxit);
    
    %x=pcg(AWALWL,AWFb);
    normx1 = norm(x1);
    ex = norm(x - x1)/normx1;%与上一步x值的相对误差

end

return

