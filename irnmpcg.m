function [x, iter]=irnmpcg(A, L, b, miu, WF, WL, x, tol, maxit)

awb = A' * (WF .* b);
 
iter = 0;
AWFA = A' *(WF .*(A * x));
% LWRL = miu * DxT(wl.*Dx(X)) + miu * DyT(wl.*Dy(X));
% LWRL = LWRL(:);
LWRL = miu * L' *(WL .*(L * x));
r = awb - AWFA - LWRL;
norm0 = norm(r);
nmr = 1;

while(nmr > tol)
    
    if (iter > maxit)
        break
    end

    %z = M * r;
    z = r;
    iter = iter + 1;    
	rz = r' * z;    
    
    if (iter == 1)
        p = z;
    else 
        beta = rz / rz0;
        p = z + beta * p;
    end 
    
	rz0 = rz;
	AWFA = A' *(WF .*(A * p));
    LWRL = miu * L' *(WL .*(L * p));
    
    Ap = AWFA + LWRL;
	pAp = p' * Ap;
	
    alpha = rz / pAp;
    x = x + alpha * p;
    r = r - alpha * Ap;
	normr = norm(r);
	nmr = normr/norm0;
end

return