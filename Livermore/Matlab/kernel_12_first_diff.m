function kernel_12_first_diff(LEN_1D)
    %! init
    x = zeros(1, LEN_1D);
    y = randn(1, LEN_1D + 1);

    %! loop
    for k = 1:LEN_1D
        x(k) = y(k + 1) - y(k);
    end

    %! array_op
    x = y(2:(LEN_1D + 1)) - y(1:LEN_1D);

end
