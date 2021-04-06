%% Problem 15
clear all
%% Initial conditions
x(1) =.7; %x(0)

%% loop
rows = 7000;
cols = 1;
n=rows*cols-1;
for i=1:n
        x(i+1)=bakers(x(i));
end
x=reshape(x,cols,rows)'
xplot=linspace(0,1,n+1);
for i=1:n+1
yplot(i)=bakers(xplot(i));
end
scatter(xplot,yplot)
%% Functions
function output = bakers(x)
    if x>=0 && x<.25
        output = 4*x;
    elseif x>=.25 && x<.5
        output = 4*x-1;
    elseif x>=.5 && x<.75
        output = 4*x-2;
    elseif x>=.75 && x<=1
        output = 4*x-3;
    end
end
