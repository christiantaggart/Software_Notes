# numpy

import numpy as np

# py_lst = list(range(1000000))
# %timeit sum(py_lst)

# numpy array
np_arr = np.arange(1000000)


# specifies an array of floats (SAME AS 1.0, 2.0 ETC)
alpha = np.array([1.,2.,3.,4.,5.])
print(alpha.shape)  # DEPTH and Tuple of array dimensions.
print(alpha.dtype) # DATA TYPE

# defines NumPy array of ints
bravo = np.array([1,2,3,4,5,6,7], np.int64)
print(bravo.shape)  # Tuple of array dimensions.
print(bravo.dtype)

linspy = np.linspace(0.,100.,4)
print(linspy)

