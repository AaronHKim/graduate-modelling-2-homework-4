
%Function
f = @(t,w) w-t^2+1;

%Domain
a=0;
b=2;

%number of steps
N=1000;

% step size
h= (b-a)/N;
%intial value euler
y(1) = 1/2;


% t values
t(1)=0;

%eulers
for i=1:N
    t(i+1) = a+h*(i);
    y(i+1) = y(i) + h*f(t(i),y(i));
end

%R_K_4

%Initial value R_K

w(1) = y(1);

% setting k values
k=0;
for i=1:N
    k(i,1) = f(t(i),w(i));
    k(i,2) = f(t(i)+h/2,w(i) + h/2*k(i,1));
    k(i,3) = f(t(i)+h/2,w(i) + h/2*k(i,2));
    k(i,4) = f(t(i) + h, w(i) + h*k(i,3));
    w(i+1) = w(i) + (h/6)*(k(i,1) + 2*(k(i,2) +k(i,3))+k(i,4));
end

g =@(t) exp(t)*(exp(-t)*(t^2) +2*exp(-t)*t + exp(-t)-1/2);
exct=g(0);
for i=1:N
    
    exct(i+1) = g(h*i);
end


eul_error=norm(exct-y,inf)
rk_error = norm(exct-w,inf)

plot(t,y);
hold on
plot(t,w);
plot(t,exct);
hold off
