# Final Project - Ian Carr
# Blasius solution - introduction to fluids

import numpy as np 
import matplotlib.pyplot as plt 

# building initial parameters
nfinal = 8.	# final value of n
dn = 0.01	# step size
N = int(nfinal/dn)  # 
n = np.linspace(0.0,nfinal,N)

f = np.zeros(N)
f1 = np.zeros(N)
f2 = np.zeros(N)

# explicitly initial conditions
f[0] = 0. 
f1[0] = 0.

# option for shooting method
f2[0] = 0.25

# our shot for the value of f at infty
f2shot = np.linspace(0.0,5.0,1000)
"""
for i in range(len(f2shot)):
	f2[0] = f2shot[i]
	# iterating using euler's method
	for j in range(0,N-1):
		f[j+1] = f[j] + f1[j]*dn
		f1[j+1] = f1[j] + f2[j]*dn
		f2[j+1] = f2[j] - 0.5*f[j]*f2[j]*dn
	if f1[-1] >= 1.0:
		print 'Final value of f1: ',f1[-1]
		print 'Chosen value of f2[0]: ', f2[0]
		print 'Number of guesses: ', i
		break

v = (0.5*(f1*n - f))

# plotting x-component of velocity
plt.figure()
plt.plot(f1,n)
plt.plot(v,n)
plt.ylabel('$\eta$',fontsize=18)
plt.xlabel('$u/u_\infty$',fontsize=18)
"""

# ---------- Newton-Raphson Method ----------

# starting with a reasonable guess for f2
f2guess = np.empty(N)
f2guess[0] = 0.2

# arrays to be filled by derivative functions
f3 = np.zeros(N)
f4 = np.zeros(N)
f5 = np.zeros(N)

# imposing initial condition
f5[0]=1

# setting up a break criterion for our loop
error_bound = 0.0001

for i in range(0,N-1):
	f2[0] = f2guess[i]
	for j in range(0,N-1):
		f[j+1] = f[j] + f1[j]*dn
		f1[j+1] = f1[j] + f2[j]*dn
		f2[j+1] = f2[j] - 0.5*f[j]*f2[j]*dn

		f3[j+1] = f3[j] + f3[j]*dn
		f4[j+1] = f4[j] + f5[j]*dn
		f5[j+1] = f5[j] - 0.5*(f3[j]*f2[j] + f[j]*f5[j])*dn

	f2guess[i+1] = f2guess[i] - ((f1[-1]-1)/f4[-1])

	if abs(f1[-1]-1)<=error_bound:
		print 'Final value of f1: ',f1[-1]
		print 'Chosen value of f2[0]: ', f2[0]
		print 'Number of guesses: ', i
		break
