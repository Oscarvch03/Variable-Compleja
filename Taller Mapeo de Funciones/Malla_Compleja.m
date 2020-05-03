function Mc = Malla_Compleja(W)
    [i, j] = size(W);
    a = pi;
    b = pi;
    m = linspace(-a, a, i);
    n = linspace(-b, b, j);
    n = -1 .* n;
    M = (ones(length(n), 1)) * m;
    N = (n.') * ones(1, length(m));
    Mc = complex(M, N);
end

