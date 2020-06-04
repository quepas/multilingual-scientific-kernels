def kernel_12_first_diff(LEN_1D):
    #! init
    import numpy as np

    x = np.zeros(LEN_1D)
    y = np.random.randn(LEN_1D + 1)

    #! loop
    for k in range(LEN_1D):
        x[k] = y[k+1] - y[k]

    #! array_op
    x = y[1:(LEN_1D + 1)] - y[0:LEN_1D]
