function Z = paralelogram(p1,p2,p3,p4,n)
    m = n/4;
    [X,Y] = line2points(p1,p2,m);
    [x1,y1] = line2points(p2,p3,m);
    [x2,y2] = line2points(p3,p4,m);
    [x3,y3] = line2points(p4,p1,m);
    
    X =[X,x1,x2,x3];
    Y =[Y,y1,y2,y3];
    
    Z = complex(X,Y);
    
end