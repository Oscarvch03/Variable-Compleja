function Z = triangle(p1,p2,p3,n)
    m = n/3;
    [X,Y] = line2points(p1,p2,m+1);
    [x1,y1] = line2points(p2,p3,m+1);
    [x2,y2] = line2points(p3,p1,m);
    
    X =[X,x1,x2];
    Y =[Y,y1,y2];
    
    Z = complex(X,Y);
end