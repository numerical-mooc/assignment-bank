Particle in Cell Simulation
======

This bonus notebook is intended to take the student through the theory and implementation of a "Particle-in-Cell" (PIC) simulation, common in the field of plasma modeling. While these kinds of projects can become exceedingly difficult, we make certain assumptions that will allow us to solve a simplified version of a common problem: the motion of electrons and ions in the presence of electromagnetic fields.
For this case, the most important assumption is that changes in the applied magnetic field is essentially zero. As such, we will only be updating the electric field at each timestep.
Once completed, some interesting additional steps could include: adding collisions, making the magnetic field update on every timestep (like the E field), and setting safeguards against some of the common pitfalls of the code provided (particles leaving the grid, etc.). Perhaps even a scaling animation at each frame, showing how the electrons move once they have escaped the ions' grasp!
The original code has been provided in the supplementary file: "PICsim_RawCode". Feel free to tinker with it, should your heart desire.
I hope you enjoy the bonus notebook!
