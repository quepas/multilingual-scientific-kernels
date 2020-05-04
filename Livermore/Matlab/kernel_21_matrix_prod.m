function kernel_21_matrix_prod(LEN_1D)
    %! init
    px = randn(25, LEN_1D);
    vy = randn(25, 25);
    cx = randn(25, LEN_1D);

    %! loop
    for k = 1:25
        for ii = 1:25
            for jj = 1:LEN_1D
                px(ii, jj) = px(ii, jj) + vy(ii, k) .* cx(k, jj);
            end
        end
    end

    %! array_op
    for k = 1:25
        for ii = 1:25
            px(ii, :) = px(ii, :) + vy(ii, k) .* cx(k, :);
        end
    end

end
