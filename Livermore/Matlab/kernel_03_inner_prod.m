function kernel_03_inner_prod(LEN_1D)
    %! init
    q = 0.0;
    x = randn(1, LEN_1D);
    z = randn(1, LEN_1D);

    %! loop
    for k = 1:LEN_1D
        q = q + z(k) .* x(k);
    end

    %! array_op
    q = q + sum(z .* x);

end
