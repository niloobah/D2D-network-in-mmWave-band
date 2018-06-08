function [ laplaceEl ] = LaplaceEl( CL,G,g,beta,alpha_LOS,PGG,PGg,Pgg,lambda )
%LAPLACEEL Summary of this function goes here
%   Detailed explanation goes here
gain=[G*G,g*G,g*g];
p=[PGG,PGg,Pgg];
prd = zeros(length(gain),1);
for i=1:length(gain)
    A=gain(i)*CL;
    fun= @(x)(-1+(1+A*x.^(-alpha_LOS)).^-1).*exp(-beta*x).*x;
    local=integral(fun, 0, inf);
    prd(i) = exp(lambda*local*2*pi*p(i));
end
laplaceEl = prod(prd);
    
end

