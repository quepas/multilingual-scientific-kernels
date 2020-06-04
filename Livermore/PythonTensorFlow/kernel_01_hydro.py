def kernel_01_hydro(LEN_1D):
    #! init
    import tensorflow as tf

    r = tf.random.normal([1])
    t = tf.random.normal([1])
    q = tf.random.normal([1])
    x = tf.zeros(LEN_1D)
    y = tf.random.normal([LEN_1D])
    zx = tf.random.normal([LEN_1D + 11])

    @tf.function
    def kernel_01_hydro_array_op(r, t, q, x, y, zx, LEN_1D):
        x = q + y * (r * zx[10:(LEN_1D+10)] + t * zx[11:(LEN_1D+11)])
        return x

    #! array_op
    kernel_01_hydro_array_op(r, t, q, x, y, zx, LEN_1D)
