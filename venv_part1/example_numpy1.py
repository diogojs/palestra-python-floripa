import numpy as np

x = np.asarray([1, 2, 3], dtype=np.int16)
y = np.vectorize(lambda x: x+x)(x)

assert y.dtype == np.int64
print("OK")
