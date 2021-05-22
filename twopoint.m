function [C]=twopoint(A)
B=diff(A);
n=size(A,1);
C=zeros(n-2,1);
for i=1:n-2
    C(i,1)=B(i,1)+B(i+1,1);
end

end
