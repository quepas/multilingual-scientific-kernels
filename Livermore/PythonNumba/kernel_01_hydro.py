def kernel_01_hydro(LEN_1D):
    #! init
    import numpy as np
    import numba as nb

    r = np.random.randn(1)
    t = np.random.randn(1)
    q = np.random.randn(1)
    y = np.random.randn(LEN_1D)
    zx = np.random.randn(LEN_1D + 11)
    x = np.zeros(LEN_1D)

    @nb.njit
    def kernel_01_hydro_loop(r, t, q, y, x, zx, LEN_1D):
        for k in range(LEN_1D):
            x[k] = q + y[k] * (r * zx[k+10] + t * zx[k+11])
        return x

    @nb.njit
    def kernel_01_hydro_array_op(r, t, q, y, x, zx,LEN_1D):
        x = q + y * (r * zx[10:(LEN_1D+10)] + t * zx[11:(LEN_1D+11)])
        return x

    #! loop
    kernel_01_hydro_loop(r, t, q, y, x, zx, LEN_1D)

    #! array_op
    kernel_01_hydro_array_op(r, t, q, y, x, zx, LEN_1D)
