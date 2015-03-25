function output=test(A)
% input A: mxArray
% output B: string with error msg as content
% get dimensions of data
dims=size(A); % dimensions
dimseq=prod(dims==[1044,1408,800]); % dimseq==1 correct dims

% intended class and dimensions
if dimseq==0 & isa(A,'uint16')==0
    output='wrong dimension and wrong data type,';
elseif dimseq==1 & isa(A,'uint16')==0
    output='wrong data type,';
elseif dimseq==0 and & isa(A,'uint16')==1
    output='wrong dimensions,';
else
    output='corrent dimension and data type,';
end

% test content
% Create B, same way as Scott. Value range 0~4095, arranged row-wise
% test if B is the same as A
range=uint16([0:1:2^12-1]); % 0~4095
B=repmat(range,1,1408*1044*800/2^12);
B=reshape(B,1408,1044,800); % reshape is column-wise
B=permute(B,[2 1 3]); % permute to transpose for N-D array

% randomly choose 10 points from A, see if them match the value in C
row=randi(1044,1,10);
col=randi(1408,1,10);
frame=randi(800,1,10);
for i=1:10
    result(i)=B(row(i),col(i),frame(i))==A(row(i),col(i),frame(i)) % equal=1
end

result=prod(result) % if result==1 is sucess

if result==1
    output=[output ' correct content']
else
    output=[output ' wrong content ']
end