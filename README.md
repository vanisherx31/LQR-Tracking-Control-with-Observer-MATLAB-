# LQR Tracking Control with Observer (MATLAB)

This project implements **optimal control and state estimation** for a multi-state dynamic system using:

- Linear Quadratic Regulator (LQR)
- Luenberger Observer
- Integral state augmentation for reference tracking

The controller enables the system outputs to track various reference trajectories including:

- Square wave signals
- Sinusoidal signals
- Circular trajectories
- Rotated elliptical trajectories

The simulations are implemented in **MATLAB** and demonstrate closed-loop tracking performance.

---

# System Model

The system is represented in state-space form:

\[
\dot{x} = Ax + Bu
\]

\[
y = Cx
\]

where


The system outputs correspond to:


---

# Controller Design

To enable **reference tracking**, the system is augmented with integral states:


The optimal feedback gain is obtained using **LQR**:


Weighting matrices:


The resulting control law is

**
---

# Observer Design

Since not all states are directly measured, a **Luenberger observer** is designed.
**

Observer dynamics:


The final closed-loop system is


---

# Reference Tracking Experiments

The controller is tested with multiple reference signals.

## Square Wave Tracking

Reference:


Result:

System output θ(t) tracks the square wave input with small transient error.

---

## Sinusoidal Tracking

Reference:


Result:

ψ(t) tracks the sinusoidal input with negligible steady-state error.

---

## Circular Trajectory Tracking

To generate a circle of radius 2:


This produces


which corresponds to a circle centered at the origin.

Example trajectory:


---

## Rotated Elliptical Trajectory

Ellipse parameters:


Unrotated ellipse:


where


The output trajectory converges to the rotated ellipse in steady state.

---

# Example Results

Tracking responses:

- θ(t) vs r₁(t)
- ψ(t) vs r₂(t)

Phase trajectories:

- Circular motion
- Rotated ellipse motion

---

# Repository Structure


---

# Key Concepts Demonstrated

This project demonstrates:

- Optimal control (LQR)
- Observer design
- State estimation
- Reference tracking
- Trajectory generation
- Closed-loop stability
- MATLAB simulation

---

# Tools Used

- MATLAB
- Control Systems Toolbox

---

# Author

Piyush More  
MS Aerospace Engineering  
Purdue University









