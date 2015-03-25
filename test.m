function B=test(A)
% get dimensions of data
dims=size(A); % dimensions
dimseq=prod(dims==[1044,1408,800]); % dimseq==1 correct dim

% intended class and dimensions
if dimseq==0 & isa(A,'uint16')==0
    B='wrong dimension and wrong data type';
elseif dimseq==1 & isa(A,'uint16')==0
    B='wrong data type';
elseif dimseq==0 and & isa(A,'uint16')==1
    B='wrong dimensions';
else
    B='sucess';
end

