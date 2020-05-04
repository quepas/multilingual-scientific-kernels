function kernel_18_explicit_hydro_2D(LEN_1D)
    %! init
    t = 0.0037;
    s = 0.0041;
    kn = 6;
    za = randn(LEN_1D + 1, 7);
    zb = randn(LEN_1D + 1, 7);
    zm = randn(LEN_1D + 1, 7);
    zp = randn(LEN_1D + 1, 7);
    zq = randn(LEN_1D + 1, 7);
    zr = randn(LEN_1D + 1, 7);
    zu = randn(LEN_1D + 1, 7);
    zz = randn(LEN_1D + 1, 7);
    zv = randn(LEN_1D + 1, 7);

    %! loop
    for k = 2:kn
        for j = 2:LEN_1D
            za(j, k) = (zp(j - 1, k + 1) + zq(j - 1, k + 1) - zp(j - 1, k) - zq(j - 1, k)) .* (zr(j, k) + zr(j - 1, k)) ./ (zm(j - 1, k) + zm(j - 1, k + 1));
            zb(j, k) = (zp(j - 1, k) + zq(j - 1, k) - zp(j, k) - zq(j, k)) .* (zr(j, k) + zr(j, k - 1)) ./ (zm(j, k) + zm(j - 1, k));
        end
    end

    for k = 2:kn
        for j = 2:LEN_1D
            zu(j, k) = zu(j, k) + s .* (za(j, k) .* (zz(j, k) - zz(j + 1, k)) - za(j - 1, k) .* (zz(j, k) - zz(j - 1, k)) - zb(j, k) .* (zz(j, k) - zz(j, k - 1)) + zb(j, k + 1) .* (zz(j, k) - zz(j, k + 1)));
            zv(j, k) = zv(j, k) + s .* (za(j, k) .* (zr(j, k) - zr(j + 1, k)) - za(j - 1, k) .* (zr(j, k) - zr(j - 1, k)) - zb(j, k) .* (zr(j, k) - zr(j, k - 1)) + zb(j, k + 1) .* (zr(j, k) - zr(j, k + 1)));
        end
    end

    for k = 2:kn
        for j = 2:LEN_1D
            zr(j, k) = zr(j, k) + t .* zu(j, k);
            zz(j, k) = zz(j, k) + t .* zv(j, k);
        end
    end

    %! array_op
    for k = 2:kn
        za(2:LEN_1D, k) = (zp(1:(LEN_1D - 1), k + 1) + zq(1:(LEN_1D - 1), k + 1) - zp(1:(LEN_1D - 1), k) - zq(1:(LEN_1D - 1), k)) .* (zr(2:LEN_1D, k) + zr(1:(LEN_1D - 1), k)) ./ (zm(1:(LEN_1D - 1), k) + zm(1:(LEN_1D - 1), k + 1));
        zb(2:LEN_1D, k) = (zp(1:(LEN_1D - 1), k) + zq(1:(LEN_1D - 1), k) - zp(2:LEN_1D, k) - zq(2:LEN_1D, k)) .* (zr(2:LEN_1D, k) + zr(2:LEN_1D, k - 1)) ./ (zm(2:LEN_1D, k) + zm(1:(LEN_1D - 1), k));
    end

    for k = 2:kn
        zu(2:LEN_1D, k) = zu(2:LEN_1D, k) + s .* (za(2:LEN_1D, k) .* (zz(2:LEN_1D, k) - zz(3:(LEN_1D + 1), k)) - za(1:(LEN_1D - 1), k) .* (zz(2:LEN_1D, k) - zz(1:(LEN_1D - 1), k)) - zb(2:LEN_1D, k) .* (zz(2:LEN_1D, k) - zz(2:LEN_1D, k - 1)) + zb(2:LEN_1D, k + 1) .* (zz(2:LEN_1D, k) - zz(2:LEN_1D, k + 1)));
        zv(2:LEN_1D, k) = zv(2:LEN_1D, k) + s .* (za(2:LEN_1D, k) .* (zr(2:LEN_1D, k) - zr(3:(LEN_1D + 1), k)) - za(1:(LEN_1D - 1), k) .* (zr(2:LEN_1D, k) - zr(1:(LEN_1D - 1), k)) - zb(2:LEN_1D, k) .* (zr(2:LEN_1D, k) - zr(2:LEN_1D, k - 1)) + zb(2:LEN_1D, k + 1) .* (zr(2:LEN_1D, k) - zr(2:LEN_1D, k + 1)));
    end

    for k = 2:kn
        zr(2:LEN_1D, k) = zr(2:LEN_1D, k) + t .* zu(2:LEN_1D, k);
        zz(2:LEN_1D, k) = zz(2:LEN_1D, k) + t .* zv(2:LEN_1D, k);
    end

end
