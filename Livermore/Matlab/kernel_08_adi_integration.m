function kernel_08_adi_integration(LEN_1D)
    %! init
    du1 = zeros(1, LEN_1D);
    du2 = zeros(1, LEN_1D);
    du3 = zeros(1, LEN_1D);
    u1 = randn(5, LEN_1D + 1, 2);
    u2 = randn(5, LEN_1D + 1, 2);
    u3 = randn(5, LEN_1D + 1, 2);
    nl1 = 1;
    nl2 = 2;
    fw = 2.0;
    sig = randn(1);
    a11 = randn(1);
    a12 = randn(1);
    a13 = randn(1);
    a21 = randn(1);
    a22 = randn(1);
    a23 = randn(1);
    a31 = randn(1);
    a32 = randn(1);
    a33 = randn(1);

    %! loop
    for kx = 2:3

        for ky = 2:LEN_1D
            du1(ky) = u1(kx, ky + 1, nl1) - u1(kx, ky - 1, nl1);
            du2(ky) = u2(kx, ky + 1, nl1) - u2(kx, ky - 1, nl1);
            du3(ky) = u3(kx, ky + 1, nl1) - u3(kx, ky - 1, nl1);
            u1(kx, ky, nl2) = u1(kx, ky, nl1) + a11 .* du1(ky) + a12 .* du2(ky) + a13 .* du3(ky) + sig .* (u1(kx + 1, ky, nl1) - fw .* u1(kx, ky, nl1) + u1(kx - 1, ky, nl1));
            u2(kx, ky, nl2) = u2(kx, ky, nl1) + a21 .* du1(ky) + a22 .* du2(ky) + a23 .* du3(ky) + sig .* (u2(kx + 1, ky, nl1) - fw .* u2(kx, ky, nl1) + u2(kx - 1, ky, nl1));
            u3(kx, ky, nl2) = u3(kx, ky, nl1) + a31 .* du1(ky) + a32 .* du2(ky) + a33 .* du3(ky) + sig .* (u3(kx + 1, ky, nl1) - fw .* u3(kx, ky, nl1) + u3(kx - 1, ky, nl1));
        end

    end

    %! array_op
    for kx = 2:3
        du1(2:LEN_1D) = u1(kx, 3:(LEN_1D + 1), nl1) - u1(kx, 1:(LEN_1D - 1), nl1);
        du2(2:LEN_1D) = u2(kx, 3:(LEN_1D + 1), nl1) - u2(kx, 1:(LEN_1D - 1), nl1);
        du3(2:LEN_1D) = u3(kx, 3:(LEN_1D + 1), nl1) - u3(kx, 1:(LEN_1D - 1), nl1);
        u1(kx, 2:LEN_1D, nl2) = u1(kx, 2:LEN_1D, nl1) + a11 .* du1(2:LEN_1D) + a12 .* du2(2:LEN_1D) + a13 .* du3(2:LEN_1D) + sig .* (u1(kx + 1, 2:LEN_1D, nl1) - fw .* u1(kx, 2:LEN_1D, nl1) + u1(kx - 1, 2:LEN_1D, nl1));
        u2(kx, 2:LEN_1D, nl2) = u2(kx, 2:LEN_1D, nl1) + a21 .* du1(2:LEN_1D) + a22 .* du2(2:LEN_1D) + a23 .* du3(2:LEN_1D) + sig .* (u2(kx + 1, 2:LEN_1D, nl1) - fw .* u2(kx, 2:LEN_1D, nl1) + u2(kx - 1, 2:LEN_1D, nl1));
        u3(kx, 2:LEN_1D, nl2) = u3(kx, 2:LEN_1D, nl1) + a31 .* du1(2:LEN_1D) + a32 .* du2(2:LEN_1D) + a33 .* du3(2:LEN_1D) + sig .* (u3(kx + 1, 2:LEN_1D, nl1) - fw .* u3(kx, 2:LEN_1D, nl1) + u3(kx - 1, 2:LEN_1D, nl1));
    end

end
