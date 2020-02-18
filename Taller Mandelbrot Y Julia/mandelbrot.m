function r = mandelbrot(w,n)

z(1)=w;

for i=1:n-1
    z(i+1)=((z(i)).^2)+(z(1));
end

if(abs(z(n))<=4)
    r=abs(z(n));
else 
    r=0.9;
end



