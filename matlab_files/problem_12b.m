%% Problem 12b
%% Initial conditions
mu = 3.5;
x(1) = .5; %x(0)

%% loop
rows = 50;
cols = 4;
n=rows*cols-1;
for i=1:n
        x(i+1)=logisticeq(mu,x(i));
end
x=reshape(x,cols,rows)'

%% Functions
function output = logisticeq(mu,x)
    output = mu*x*(1-x);
end
function output = logisticeqsq(mu,x)
    a = mu*x*(1-x);
    output = mu*a*(1-a);
end
function output = logisticeqcube(mu,x)
    one = mu*x*(1-x);
    two = mu*one*(1-one);
    output =mu*two*(1-two);
end
function output = logisticeqquad(mu,x)
    one = mu*x*(1-x);
    two = mu*one*(1-one);
    three=mu*two*(1-two);
    output =mu*three*(1-three);
end