function kernel_09_integrate_predictors(LEN_1D)
    %! init
    px = randn(25, LEN_1D);
    dm22 = randn(1);
    dm23 = randn(1);
    dm24 = randn(1);
    dm25 = randn(1);
    dm26 = randn(1);
    dm27 = randn(1);
    dm28 = randn(1);
    c0 = randn(1);

    %! loop
    for k = 1:LEN_1D
        px(1, k) = dm28 .* px(13, k) + dm27 .* px(12, k) + dm26 .* px(11, k) + dm25 .* px(10, k) + dm24 .* px(9, k) + dm23 .* px(8, k) + dm22 .* px(7, k) + c0 .* (px(5, k) + px(6, k)) + px(3, k);
    end

    %! array_op
    px(1, 1:LEN_1D) = dm28 .* px(13, 1:LEN_1D) + dm27 .* px(12, 1:LEN_1D) + dm26 .* px(11, 1:LEN_1D) + dm25 .* px(10, 1:LEN_1D) + dm24 .* px(9, 1:LEN_1D) + dm23 .* px(8, 1:LEN_1D) + dm22 .* px(7, 1:LEN_1D) + c0 .* (px(5, 1:LEN_1D) + px(6, 1:LEN_1D)) + px(3, 1:LEN_1D);

end
