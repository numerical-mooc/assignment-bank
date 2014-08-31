︠d5f1008c-d5f7-4b93-a6fc-7ce45beef10fa︠
%auto
typeset_mode(true)
︡8ba1b05a-6488-406b-90a5-0dad6484d38f︡{"auto":true}︡
︠80b4a62c-57cb-49a1-a41b-569c01c2a336i︠
%md

# Phugoid Theory as SageMathCloud worksheet

Based on [numerical-mooc / lessons / 01_phugoid / 01_01_Phugoid_Theory.ipynb](http://nbviewer.ipython.org/github/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) from [MAE6286](http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/about).

Numbers in parentheses are equation numbers in the IPython notebook.
︡a6e52a9d-2f8f-497e-9e5b-d6ff635410bc︡{"md":"\n# Phugoid Theory as SageMathCloud worksheet\n\nBased on [numerical-mooc / lessons / 01_phugoid / 01_01_Phugoid_Theory.ipynb](http://nbviewer.ipython.org/github/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) from [MAE6286](http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/about).\n\nNumbers in parentheses are equation numbers in the IPython notebook.\n"}︡
︠71365654-349a-46ff-bdeb-a82f5986cf1e︠
# (1) equation of lift

# L     lift force
# S     surface area
# rho   density of air
# v     forward velocity
# C_L   coefficient of lift

%var L,S,rho,v, C_L
eq_L = L == C_L * S * (1/2) * rho * v^2
eq_L
︡9cc42607-c690-42a0-a3c4-d53bdce8f230︡{"tex":{"tex":"L = \\frac{1}{2} \\, C_{L} S \\rho v^{2}","display":true}}︡
︠3cf22e93-3465-4af7-b504-216ba9253844︠
# (2) equation of drag


# D     drag force
# C_D   coefficient of drag

%var D,C_D
eq_D = D == C_D * S * (1/2) * rho * v^2
eq_D
︡99bb20b1-9b25-4333-8d0f-3d0b85dda45f︡{"tex":{"tex":"D = \\frac{1}{2} \\, C_{D} S \\rho v^{2}","display":true}}︡
︠e9267c27-b7e4-4edb-beef-7bef84b30751︠
# (3) equation of force perpendicular to the trajectory

# W     weight of airplane
# theta glide angle

%var W,theta
eq_fprp = L == W * cos(theta)
eq_fprp
︡0d76f3e8-d03a-419c-9a55-8ea293b380ff︡{"tex":{"tex":"L = W \\cos\\left(\\theta\\right)","display":true}}︡
︠5787cac9-243d-426b-89d5-155e64ebdd67︠
# (3) equation of force parallel to the trajectory

eq_fpar = D == W * sin(theta)
eq_fpar
︡dedd8f91-f825-40cd-80b3-4250db43025d︡{"tex":{"tex":"D = W \\sin\\left(\\theta\\right)","display":true}}︡
︠25e955ff-628a-4b02-afc5-269f546b980e︠
# (4) at trim velocity, lift matches weight

# v_t   trim velocity (when L==W)

%var v_t
eq_L2 = eq_L.subs(v = v_t,L = W)
eq_L2

︡caaa1534-b780-40e7-9919-d07bf6c438bb︡{"tex":{"tex":"W = \\frac{1}{2} \\, C_{L} S \\rho v_{t}^{2}","display":true}}︡
︠7f07e7b6-c929-42ab-a456-1f3a4d26ce25︠
# (5) lift ratio as function of flight velocity

eq_lr = eq_L / eq_L2
eq_lr

︡a482ac1e-d843-4981-b2ab-99f8c347d64b︡{"tex":{"tex":"\\frac{L}{W} = \\frac{v^{2}}{v_{t}^{2}}","display":true}}︡
︠a668adb4-f127-4ee1-a3c9-470da274501e︠
# (6) balance centripetal force from curve of plane's path and gravity

# g     acceleration of Earth's gravity
# R     radius of curvature of trajectory

%var g,R

eq_gbal = (L - W * cos(theta) == (W / g) * (v^2 / R)).add_to_both_sides(W * cos(theta))
eq_gbal

︡db3587b3-741d-4e58-809a-7ee289bc20e9︡{"tex":{"tex":"L = W \\cos\\left(\\theta\\right) + \\frac{W v^{2}}{R g}","display":true}}︡
︠12297820-6481-49ab-84a2-ec63feb1e5a1︠
# (7) phugoid equation in terms of velocity

eq_phv = (eq_gbal / W).subs_expr(eq_lr).factor().expand().add_to_both_sides(- cos(theta))
eq_phv
︡81838969-8355-4432-bc88-8af295294512︡{"tex":{"tex":"\\frac{v^{2}}{v_{t}^{2}} - \\cos\\left(\\theta\\right) = \\frac{v^{2}}{R g}","display":true}}︡
︠fd56fe62-5711-40fc-869c-eca66382e05d︠
# (8) simplify - no friction, lift does no work, total energy is constant
# also set zero energy point at reference horizontal (z == 0)

# z     depth of plane below reference horizontal

%var z,z_t

eq_ze = (1/2) * v^2 - g * z == 0
eq_ze
eq_zt = eq_ze.subs(v = v_t, z = z_t)
eq_zt
︡8522aa7d-468c-4da2-9b04-22d0f40e1620︡{"tex":{"tex":"\\frac{1}{2} \\, v^{2} - g z = 0","display":true}}︡{"tex":{"tex":"\\frac{1}{2} \\, v_{t}^{2} - g z_{t} = 0","display":true}}︡
︠45262911-1c0c-468d-acf8-148a636d8c41︠
# rearrange z equation

eq_ze2 = eq_ze.solve(v^2)[0]
eq_ze2
︡393d2431-3d06-4ee2-a97c-63c4495ea5c3︡{"tex":{"tex":"v^{2} = 2 \\, g z","display":true}}︡
︠9ba43ce9-7d1f-4432-acbf-977c0ee3573d︠
# rearrange z_t equation

eq_zt2 = eq_zt.solve(v_t^2)[0]
eq_zt2

︡0e40639b-76ef-444b-b9e2-a9959e2c3b68︡{"tex":{"tex":"v_{t}^{2} = 2 \\, g z_{t}","display":true}}︡
︠d4c4ce68-6b5d-4a96-b22f-07be909e4671︠
# rewrite phugoid equation in terms of z, step 1

eq_p2 = eq_phv.subs_expr(eq_ze2)
eq_p2

︡3cb834a1-9aed-4bb2-aece-9c07c284084a︡{"tex":{"tex":"\\frac{2 \\, g z}{v_{t}^{2}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡
︠e4d6d896-a770-4324-a824-029833714bb8︠
# (9) rewrite phugoid equation in terms of z, step 2

eq_phz = (eq_p2 * eq_zt2).expand().subs_expr(eq_zt2).multiply_both_sides(1/(2*g*z_t)).expand()
eq_phz


︡530d1f8b-af7d-4c8f-8407-a2f5bc3beb62︡{"tex":{"tex":"\\frac{z}{z_{t}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡
︠c27d6936-9088-4ca1-bd0a-7ada4c334068︠
# treat infinitesimals naively

# (10) diff eq for glide angle vs trajectory length

# ds    tiny arc length of trajectory
# dth   tiny glide angle

%var ds
dth = var('dth',latex_name = "d\\theta")

eq_dthds = 1 / R == dth/ds
eq_dthds
︡5c4c9e22-e087-41a4-a010-4acc54ae4081︡{"tex":{"tex":"\\frac{1}{R} = \\frac{d\\theta}{\\mathit{ds}}","display":true}}︡
︠dae5a7c6-7a26-4d58-9bad-bb68ef37d264︠
# (10) diff eq for depth below horizontal vs trajectory length

# dz    tiny depth below horizontal

%var dz

eq_dzds = sin(theta) == - dz/ds
eq_dzds
︡7d41786e-9d19-41a6-adb3-62235961b230︡{"tex":{"tex":"\\sin\\left(\\theta\\right) = -\\frac{\\mathit{dz}}{\\mathit{ds}}","display":true}}︡
︠d9e1a02c-a5e3-4d12-a4cc-bb335e29017a︠
# (11) diff eq for glide angle vs depth below horizontal

# chain rule is multiplication of infinitesimals

eq_dthdz = (eq_dthds / eq_dzds)
eq_dthdz
︡ba9290b0-d5c4-4faf-8a0a-244c7267c6c3︡{"tex":{"tex":"\\frac{1}{R \\sin\\left(\\theta\\right)} = -\\frac{d\\theta}{\\mathit{dz}}","display":true}}︡
︠0963f5bb-77ff-429b-8f56-37dee9741d45︠
# (12) multiply phugoid equation (9) by 1/(2*sqrt(z))

eq_phz2 = eq_phz.multiply_both_sides(1/(2*z^(1/2))).expand()
eq_phz2
︡dba2371e-cf99-42e0-a75e-bc1b7c45e2ff︡{"tex":{"tex":"-\\frac{\\cos\\left(\\theta\\right)}{2 \\, \\sqrt{z}} + \\frac{\\sqrt{z}}{2 \\, z_{t}} = \\frac{\\sqrt{z}}{R}","display":true}}︡
︠220542da-9636-4dc4-9515-a94a225d6cc0︠
# (13) substitute for 1/R in (12)

# split this step to avoid long line in worksheet
eq_phz3a = eq_phz2.subs(eq_dthdz.multiply_both_sides(sin(theta)))
eq_phz3b = eq_phz3a.add_to_both_sides((cos(theta)/(2*z^(1/2))))
eq_phz3b
︡ae7d31df-59a0-4355-9380-957ded153645︡{"tex":{"tex":"\\frac{\\sqrt{z}}{2 \\, z_{t}} = -\\frac{d\\theta \\sqrt{z} \\sin\\left(\\theta\\right)}{\\mathit{dz}} + \\frac{\\cos\\left(\\theta\\right)}{2 \\, \\sqrt{z}}","display":true}}︡
︠e9368163-f067-40cb-a79a-be2535895908︠
# (14) rewrite (13) as an exact derivative

# theta becomes a function of z instead of a variable

theta = function('theta',z)
theta
︡2d2bf9c5-57de-47b8-916f-3b020827097b︡{"tex":{"tex":"\\theta\\left(z\\right)","display":true}}︡
︠d922aea6-cc8e-4e17-a161-5626edfb5f44︠
# (14) continued

# g is the function whose exact derivative appeared in (13)

g = function('g',z)

eq_g = g == z ^ (1/2) * cos(theta)
eq_g
eq_g.derivative(z)

# NOTE: dg/dz appears as D[0](g)(z), etc.


︡6c1d3b50-2ab2-482c-8a55-3bdf57d98bfb︡{"tex":{"tex":"g\\left(z\\right) = \\sqrt{z} \\cos\\left(\\theta\\left(z\\right)\\right)","display":true}}︡{"tex":{"tex":"D[0]\\left(g\\right)\\left(z\\right) = -\\sqrt{z} \\sin\\left(\\theta\\left(z\\right)\\right) D[0]\\left(\\theta\\right)\\left(z\\right) + \\frac{\\cos\\left(\\theta\\left(z\\right)\\right)}{2 \\, \\sqrt{z}}","display":true}}︡
︠9ff765b2-cbaf-4df9-9662-2005aeb2cb2d︠
### I want to redo steps (10)-(14) using differential equations
### instead of infinitesimals and use the chain rule.

### To be continued.
︡e68c4f6e-403f-431f-82a3-3220e2b19683︡
︠196db583-aff6-4235-b3cc-7c1e157c71c8︠









