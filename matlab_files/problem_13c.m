%% Problem 13c
clear all
%% Initial conditions
x(1) = .9; %x(0)

%% loop
rows = 8;
cols = 2;
n=rows*cols-1;
for i=1:n
        x(i+1)=prob13c(x(i));
end
x=reshape(x,cols,rows)'

%% Functions
function output = prob13c(x)
    if x<=.5
        output = 2*x;
    else
        output = 2*(1-x);
    end
end
