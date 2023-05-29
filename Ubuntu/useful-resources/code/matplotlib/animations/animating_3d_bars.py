import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import numpy as np
import pandas as pd


def animate(i, input_heights):
    input_heights = i * (input_heights / 20)
    output = ax.bar3d(x=xx - bar_width / 2,
                      y=yy - bar_depth / 2,
                      z=np.zeros_like(xx),
                      dx=width_vec,
                      dy=depth_vec,
                      dz=input_heights,
                      color=color)

    ax.xaxis.set_ticks(x)
    ax.set_xticklabels(shark_names)
    ax.yaxis.set_ticks(y)
    ax.set_yticklabels(industries_names)
    ax.zaxis.set_ticks(range(1, 15))

    ax.set_xlabel("Shark Name", labelpad=12)
    ax.set_ylabel("Industry name", labelpad=12)
    ax.set_zlabel("Price", labelpad=12)
    ax.set_title("Investments per Industry per shark")

    return output,


if __name__ == '__main__':
    shark_names = ['Barbra', 'Mark', 'Lori']
    industries_names = ['Health', 'Food', 'LifeStyle', 'Children']

    # Generating synthetic data:
    actual_bar_heights = np.random.randint(low=1, high=10, size=(len(industries_names), len(shark_names)))

    df = pd.DataFrame(data=actual_bar_heights,
                      columns=shark_names,
                      index=industries_names)

    # The coordinates of the anchor point of the bars:

    x = [idx + 0.5 for idx, _ in enumerate(shark_names, start=1)]
    y = [idx + 0.5 for idx, _ in enumerate(industries_names, start=1)]

    xx_table, yy_table = np.meshgrid(x, y)

    zz = np.zeros((len(industries_names), len(shark_names)))
    # skyblue', 'dodgerblue', 'lightseagreen','palegreen','navy'
    colors = np.array(['skyblue', 'dodgerblue', 'lightseagreen'] * len(industries_names)).reshape((4, 3))
    # dx, dy, dz : float or array-like
    # The width, depth, and height of the bars, respectively:
    bar_width = 0.2
    bar_depth = 0.4

    width_vec = [bar_width] * xx_table.shape[1]
    depth_vec = [bar_depth] * yy_table.shape[1]
    heights_vec = actual_bar_heights

    fig = plt.figure(figsize=(12, 12))
    ax = plt.axes(projection='3d')

    for idx, (xx, yy, heights, color) in enumerate(zip(xx_table, yy_table, actual_bar_heights, colors)):
        anim = FuncAnimation(fig,
                             func=animate,
                             frames=20,
                             fargs=(heights,),
                             interval=100,
                             blit=True)
        anim.save(f'images/anim_{idx}.gif', writer='imagemagick')
