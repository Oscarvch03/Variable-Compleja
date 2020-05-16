function Z = spikes(n)
    X = linspace(0,1,n);
    y = ones(1,n);
    
    N1 = abs(randn(1,200));
    N1 = N1./(get_max(N1));
    
    Y = y;
    
    count = 1;
    for i=1:n
        if(mod(i,5) == 0)
            Y(i) = y(i) + N1(count);
            count = count + 1;
        end
    end
    
    
    Z = complex(X,Y);
    
end
