function x =IRN(A, L, b, miu, p, q, tau, tol, maxit, epsf, epsl)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%������ֵ
%x = b;
x=(A'*A+miu*L'*L)\(A'*b);


%normIg = norm(Ig);%��ʵֵ�Ķ�����

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
    
    WF = W(r, p, epsf);%�����ϵ�WF�ǶԽǾ��������WF��һ���ɶԽ�Ԫ����ɵ�����
    WL = W(Lx, q, epsl);%ͬ��
    AWALWL= A' *diag(WF)*A+miu * L' *diag(WL) *L;
    AWFb = A'*diag(WF)*b;
    
    %% �ڵ���
    x1 = x0;
    x0 = x;
    
    %������淽��,����ǽ�����������
	[x,iter] = irnmpcg(A, L, b, miu, WF, WL, x, tol, maxit);
    
    %x=pcg(AWALWL,AWFb);
    normx1 = norm(x1);
    ex = norm(x - x1)/normx1;%����һ��xֵ��������

end

return

