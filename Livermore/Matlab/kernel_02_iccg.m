function kernel_02_iccg(LEN_1D)
    %! init
    x = randn(1, LEN_1D * 2);
    v = randn(1, LEN_1D * 2);

    %! loop
    ii = LEN_1D;
    ipntp = 0;

    while true
        ipnt = ipntp;
        ipntp = ipntp + ii;
        ii = fix(ii ./ 2);
        jj = ipntp + 1;

        for k = (ipnt + 2):2:ipntp
            jj = jj + 1;
            x(jj) = x(k) - v(k) .* x(k - 1) - v(k + 1) .* x(k + 1);
        end

        if (ii <= 1)
            break;
        end

    end

end
