function kernel_04_banded_lineq(LEN_1D)
    %! init
    m = fix((1001 - 7) ./ 2);
    xz = randn(1, LEN_1D);
    y = randn(1, LEN_1D);

    %! loop
    for k = 7:m:1001
        lw = k - 6;
        temp = xz(k - 1);

        for jj = 5:5:LEN_1D
            temp = temp - xz(lw) .* y(jj);
            lw = lw + 1;
        end
        xz(k - 1) = y(5) .* temp;
    end

end
