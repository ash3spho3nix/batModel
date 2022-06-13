function f=gadecode(chrom,lo,hi,bits)
[M,N]=size(chrom);
npar=N/bits; % number of variables
quant=(0.5.^[1:bits]'); % quantization levels
quant=quant/sum(quant); % quantization levels normalized
ct=reshape(chrom',bits,npar*M)';% each column contains
% one variable
ct1=reshape((ct*quant),npar,M)';
for i=1:npar
    par(:,i)=ct1(:,i)*((hi(i)-lo(i))+lo(i)); % DA conversion and
end
    % unnormalize varaibles
f=par;%reshape(par,npar,M)'; % reassemble population