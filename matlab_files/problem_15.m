%% Problem 15
clear all
clc
%% Initial conditions
x(1) = .9; %x(0)


%% Cobweb

cobweb(@bakers,x,0,1,50)
hold off

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

function cobweb(f,initialpoint,intervalstart,intervalend,iterations)
x=linspace(intervalstart,intervalend,iterations);
for i=1:length(x)
y(i)=f(x(i));
end
hold on
grid on
%axis([intervalstart intervalend intervalstart intervalend ])
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