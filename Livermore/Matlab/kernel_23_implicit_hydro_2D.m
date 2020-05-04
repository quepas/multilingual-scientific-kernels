function kernel_23_implicit_hydro_2D(LEN_1D)
    %! pragma init
    za = randn(LEN_1D + 1, 7);
    zb = randn(LEN_1D + 1, 7);
    zr = randn(LEN_1D + 1, 7);
    zu = randn(LEN_1D + 1, 7);
    zz = randn(LEN_1D + 1, 7);
    zv = randn(LEN_1D + 1, 7);
    fw = 0.175;

    %! pragma loop
    for jj = 2:6

        for k = 2:LEN_1D
            qa = za(k, jj + 1) .* zr(k, jj) + za(k, jj - 1) .* zb(k, jj) + za(k + 1, jj) .* zu(k, jj) + za(k - 1, jj) .* zv(k, jj) + zz(k, jj);
            za(k, jj) = za(k, jj) + fw .* (qa - za(k, jj));
        end

    end

end
