def kernel_05_tridiag_elimination(LEN_1D):
    #! init
    import numpy as np

    x = np.random.randn(LEN_1D);
    y = np.random.randn(LEN_1D);
    z = np.random.randn(LEN_1D);

    #! loop
    for k in range(1, LEN_1D):
        x[k] = z[k] * (y[k] - x[k-1])
