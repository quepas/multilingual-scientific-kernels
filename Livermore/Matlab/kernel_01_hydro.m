function kernel_01_hydro(LEN_1D)
    %! init
    r = randn(1);
    t = randn(1);
    q = randn(1);
    x = zeros(1, LEN_1D);
    y = randn(1, LEN_1D);
    zx = randn(1, LEN_1D + 11);

    %! loop
    for k = 1:LEN_1D
        x(k) = q + y(k) .* (r .* zx(k + 10) + t .* zx(k + 11));
    end

    %! array_op
    x = q + y .* (r .* zx(11:(LEN_1D + 10)) + t .* zx(12:(LEN_1D + 11)));

end
