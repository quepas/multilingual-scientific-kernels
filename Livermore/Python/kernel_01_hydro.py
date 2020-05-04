def kernel_01_hydro(LEN_1D):
    #! init
    import numpy as np

    r = np.random.randn(1)
    t = np.random.randn(1)
    q = np.random.randn(1)
    x = np.zeros(LEN_1D)
    y = np.random.randn(LEN_1D)
    zx = np.random.randn(LEN_1D + 11)

    #! loop
    for k in range(LEN_1D):
        x[k] = q + y[k] * (r * zx[k+10] + t * zx[k+11])

    #! array_op
    x = q + y * (r * zx[10:(LEN_1D+10)] + t * zx[11:(LEN_1D+11)])
