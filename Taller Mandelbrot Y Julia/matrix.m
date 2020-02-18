function Z= matrix(a,b)
clc

x=-a:0.005:a;
y=-b:0.005:b;

X=(ones(length(y),1))*x;
Y=(y.')*ones(1,length(x));

Z=X+(i*Y);  

end
