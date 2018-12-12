import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# Pandas practice
# print('pandas practice')


xs = np.linspace(-2., 2., 100)
ys = xs ** 2
fig = plt.figure(figsize=(5, 5))
ax = fig.add_subplot(1, 1, 1)
ax.plot(xs, ys)
ax.set_xlabel('x', size=15)
ax.set_ylabel('x^2', size=15)
