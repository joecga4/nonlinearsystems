import numpy as np
import matplotlib.pyplot as plt

# Define the system of equations
def system(X, t):
    x1, x2 = X
    dx1 = -x1 + x1 * x2
    dx2 = -x2
    dX = dx1, dx2
    return dX

# Create a grid of points for the phase plane
x1_vals = np.linspace(-20, 20, 50)
x2_vals = np.linspace(-20, 20, 50)
X1, X2 = np.meshgrid(x1_vals, x2_vals)

# Calculate the derivatives at each point in the grid
dX1 = -X1 + X1 * X2
dX2 = -X2

# Normalize the vectors for better visualization
magnitude = np.sqrt(dX1**2 + dX2**2)
dX1 /= magnitude
dX2 /= magnitude

# Plot the phase plane
plt.figure(figsize=(10, 10))
plt.quiver(X1, X2, dX1, dX2, color='blue', alpha=0.5)
plt.title("Phase Plane", fontsize=12)
plt.xlabel("$x_1$", fontsize=12)
plt.ylabel("$x_2$", fontsize=12)
plt.grid()

# Simulate trajectories with initial conditions
from scipy.integrate import odeint

initial_conditions = [(-1.5, 1.5), (0.5, -1.0), (1.0, 0.5), (-0.5, -0.5)]
t = np.linspace(0, 10, 500)

for x0 in initial_conditions:
    trajectory = odeint(system, x0, t)
    plt.plot(trajectory[:, 0], trajectory[:, 1], label=f"IC: {x0}")

plt.legend()
plt.show()
