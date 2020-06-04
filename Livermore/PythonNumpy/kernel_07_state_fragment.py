def kernel_07_state_fragment(LEN_1D):
    #! init
    import numpy as np

    q = np.random.randn(1);
    r = np.random.randn(1);
    t = np.random.randn(1);
    u = np.random.randn(LEN_1D);
    x = np.zeros(LEN_1D);
    y = np.random.randn(LEN_1D);
    z = np.random.randn(LEN_1D);

    #! loop
    for k in range(LEN_1D - 6):
        x[k] = u[k] + r * (z[k] + r * y[k]) + t * (u[k + 3] + r * (u[k + 2] + r * u[k + 1]) + t * (u[k + 6] + q * (u[k + 5] + q * u[k + 4])))

    #! array_op
    x[0:(LEN_1D-6)] = u[0:(LEN_1D - 6)] + r * (z[0:(LEN_1D - 6)] + r * y[0:(LEN_1D - 6)]) + t * (u[3:(LEN_1D - 3)] + r * (u[2:(LEN_1D - 4)] + r * u[1:(LEN_1D - 5)]) + t * (u[6:(LEN_1D)] + q * (u[5:(LEN_1D - 1)] + q * u[4:(LEN_1D - 2)])))
