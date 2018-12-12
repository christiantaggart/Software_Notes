import numpy as np

# https://docs.scipy.org/doc/numpy/user/quickstart.html

# py_list = list(range(1000000))
# # print(sum(py_list))

# np_arr = np.arange(1000000)

# # print(np.sum(np_arr))


# alpha = np.array([1., 2., 3.,4.,5.,])
# print(alpha.shape)
# print(alpha.dtype)

# bravo = np.array([1, 2, 3, 4, 5, 6, 7], np.int64)
# print(bravo.shape)
# print(bravo.dtype)


# charlie = np.array(['1', 2, '3'])
# print(charlie.dtype)



# xray = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
# print(xray)
# print(xray.shape)
# xray.shape


# cold = np.array([[1], [2], [3]])
# print(cold)

# print(cold.shape)  # describes dimensions of array


# zeros_arr = np.zeros((3,4))
# ones_arr = np.ones((5,5,))
# identity_arr = np.identity(4)
# random_arr = np.random.rand(2,2)
# range_arr = np.arange(0,100, 2)
# linspace_arr = np.linspace(0.,100.,4) # equally spaced by last num between first and last index specified


# print('Before reshape {}'.format(linspace_arr.shape))
# kilo = linspace_arr.reshape((2,2)) # specifying -1 for either arg will create columns
# print(kilo)
# kilo2 = linspace_arr.reshape((-1, 1))
# print(kilo2)

# print('After reshape {}'.format(kilo.shape))
# kilo_flat = kilo.flatten()
# print('After flatter {}'.format(kilo_flat.shape))


# X = np.array([[3,5],[5,7]])
# Y = np.array([[7,5],[5,3]])
# print(X+Y)


# # # Broadcasting
# X2 = np.array([[1,2],[3,4]])
# # X2 - [4,5]
# # X2 - [[4], [5]]
# X2 = X2- (4,5)
# # print(X2 - (4, 5))
# print(X2)

# ## Slicing
# X3 = np.arange(0,20,1).reshape(5,4)
# # print(X3)
# # print(X3[1,1])
# # print(X3[:,3])
# # print('X3[2] ',X3[2])
# # print('X3[0:2] ', X3[0:2])
# # print('X3[0:2,1:3] ', X3[0:2, 1:3])

# # print(X3.sum())
# # print(X3.sum(axis=0)) # sums based on axis in this case the first row

# # print(X3.mean())
# print(X3.cumprod(axis=0))
# print(X3.cumsum(axis=0))

# # Where()
# Z = np.arange(2,30,2)
# print(np.where((Z <= 2 ) & (Z >= 4)))
# print(np.where(Z == 2))
# print(np.where(Z >= 2))
# print(Z)


# arr = np.arange(12)
# print(arr)
# arr1 = arr % 2 == 0
# print(arr)
# arr2 = arr[arr % 2 == 0]
# print(arr2)


# vec = np.array([3,5,7])
# vec2 = np.array([2,3,4])

# mat = np.array([[3,2],[7,4],[9,1]])
# mat2 = np.array([[1, 2], [2, 3], [3, 4]])
# print(vec.dot(vec2))

