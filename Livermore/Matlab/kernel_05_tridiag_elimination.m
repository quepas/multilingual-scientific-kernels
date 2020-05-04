function kernel_05_tridiag_elimination(LEN_1D)
    %! init
    x = randn(1, LEN_1D);
    y = randn(1, LEN_1D);
    z = randn(1, LEN_1D);

    %! loop
    for ii = 2:LEN_1D
        x(ii) = z(ii) .* (y(ii) - x(ii - 1));
    end

end
