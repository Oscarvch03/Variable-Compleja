function m = get_max(A)
    m = A(1);
    for i=2:length(A)
        if (A(i) > m)
            m = A(i);
        end
    end
end