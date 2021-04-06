%% Problem 17
clear all
%% Initial conditions
x(1) =.7; %x(0)

%% loop
rows = 70000;
cols = 1;
n=rows*cols-1;
xplot=linspace(2.8,4,n+1);
for i=1:n
        x(i+1)=logistic(xplot(i),x(i));
end
x=reshape(x,cols,rows)'

scatter(xplot,x,'.')
xlabel('mu')
ylabel('F(x)')
%% Functions
function output = logistic(mu,x)

    output = mu*x-mu*x*x;
end