%% Initializing variables
clear all
clc
% Initial Conditions
a=3;
x0 = -1 ;

%% Cobweb
for i =-1:1
cobweb(@nm,i,-5,5,100)
end
hold off

%% Functions
function output = nm(x)
    output = .5.*(x+3./x);
end

function cobweb(f,initialpoint,intervalstart,intervalend,iterations)
x=linspace(intervalstart,intervalend,iterations);
y=f(x);
hold on
grid on
axis([intervalstart intervalend intervalstart intervalend ])
plot(initialpoint,0,'r*')
text(initialpoint,0,' x_0')
title(['Cobweb diagram'],['x_0 =', num2str(initialpoint)],'Color','blue');
plot(x,y,'k');
plot(x,x,'r');
xlabel('x(t)');
ylabel('y(t)');
x(1)=initialpoint;

line( [x(1),x(1)], [0,f(x(1))] );
line([x(1),f(x(1))],[f(x(1)),f(x(1))]);
for i=1:iterations
    x(i+1)= f(x(i));
    line([x(i+1),x(i+1)],[x(i+1),f(x(i+1))]);
    line([x(i+1),f(x(i+1))],[f(x(i+1)),f(x(i+1))]);
end

end