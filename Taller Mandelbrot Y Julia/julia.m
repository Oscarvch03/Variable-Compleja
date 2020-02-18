function r = julia(w,n,exp,c)

z(1)=w;

for i=1:n-1
    z(i+1)=((z(i)).^exp)+c;
end

if(abs(z(n))<=4)
    r=abs(z(n));
else 
    r=0.9;
end
