function kernel_06_lin_recurrence(LEN_2D)
    %! init
    w = zeros(1, LEN_2D);
    b = randn(LEN_2D, LEN_2D);

    %! loop
    for ii = 2:LEN_2D
        w(ii) = 0.01;

        for k = 1:(ii - 1)
            w(ii) = w(ii) + b(ii, k) .* w(ii - k);
        end

    end

end
