function kernel_07_state_fragment(LEN_1D)
    %! init
    q = randn(1);
    r = randn(1);
    t = randn(1);
    u = randn(1, LEN_1D);
    x = zeros(1, LEN_1D);
    y = randn(1, LEN_1D);
    z = randn(1, LEN_1D);

    %! loop
    for k = 1:(LEN_1D - 6)
        x(k) = u(k) + r .* (z(k) + r .* y(k)) + t .* (u(k + 3) + r .* (u(k + 2) + r .* u(k + 1)) + t .* (u(k + 6) + q .* (u(k + 5) + q .* u(k + 4))));
    end

    %! array_op
    x(1:(LEN_1D - 6)) = u(1:(LEN_1D - 6)) + r .* (z(1:(LEN_1D - 6)) + r .* y(1:(LEN_1D - 6))) + t .* (u(4:(LEN_1D - 3)) + r .* (u(3:(LEN_1D - 4)) + r .* u(2:(LEN_1D - 5))) + t .* (u(7:(LEN_1D)) + q .* (u(6:(LEN_1D - 1)) + q .* u(5:(LEN_1D - 2)))));

end
