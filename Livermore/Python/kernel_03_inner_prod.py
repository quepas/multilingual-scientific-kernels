def kernel_03_inner_prod(LEN_1D):
    #! init
    import numpy as np

    q = 0.0
    x = np.random.randn(LEN_1D)
    z = np.random.randn(LEN_1D)

    #! loop
    for k in range(LEN_1D):
        q = q + z[k] * x[k]

    #! array_op
    q = q + np.sum(z * x)
