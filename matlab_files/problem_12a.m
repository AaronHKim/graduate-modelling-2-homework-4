%% Problem 12
%% Initial conditions
mu = 3.4;
x(1) = .45; %x(0)

%% loop
n=50;
for i=1:n+1
        x(i+1)=logisticeq(3.4,x(i));
end
x= reshape(x,2,(n+2)/2)'

%% Functions
function output = logisticeq(mu,x)
    output = mu*x*(1-x);
end