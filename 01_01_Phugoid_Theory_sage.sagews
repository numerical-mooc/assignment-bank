︠d5f1008c-d5f7-4b93-a6fc-7ce45beef10fa︠
%auto
typeset_mode(true)
︡a1beac04-317c-4c23-a0c1-238fa030b378︡{"auto":true}︡
︠80b4a62c-57cb-49a1-a41b-569c01c2a336i︠
%md

# 01_01_Phugoid_Theory as SageMathCloud worksheet

Based on [numerical-mooc / lessons / 01_phugoid / 01_01_Phugoid_Theory.ipynb](http://nbviewer.ipython.org/github/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) from [MAE6286](http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/about).

Numbers in parentheses are equation numbers in the IPython notebook.
︡e3404c5d-b700-4fdd-a7c4-e98c1e410e49︡{"md":"\n# 01_01_Phugoid_Theory as SageMathCloud worksheet\n\nBased on [numerical-mooc / lessons / 01_phugoid / 01_01_Phugoid_Theory.ipynb](http://nbviewer.ipython.org/github/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) from [MAE6286](http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/about).\n\nNumbers in parentheses are equation numbers in the IPython notebook.\n"}︡
︠bfb06e38-c6ff-4ea0-9a39-63726b4d3af1i︠
%html

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type"><a href="http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/">MAE6286</a> phugoid flight tutorial transcribed to sage</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/DrXyzzy/assignment-bank" property="cc:attributionName" rel="cc:attributionURL">Hal Snyder</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/numerical-mooc/assignment-bank" rel="dct:source">https://github.com/numerical-mooc/assignment-bank</a>.
︡cfc9160e-0f63-4beb-9971-c0f000de9f78︡{"html":"\n<a rel=\"license\" href=\"http://creativecommons.org/licenses/by/4.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"https://i.creativecommons.org/l/by/4.0/80x15.png\" /></a><br /><span xmlns:dct=\"http://purl.org/dc/terms/\" href=\"http://purl.org/dc/dcmitype/InteractiveResource\" property=\"dct:title\" rel=\"dct:type\"><a href=\"http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/\">MAE6286</a> phugoid flight tutorial transcribed to sage</span> by <a xmlns:cc=\"http://creativecommons.org/ns#\" href=\"https://github.com/DrXyzzy/assignment-bank\" property=\"cc:attributionName\" rel=\"cc:attributionURL\">Hal Snyder</a> is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by/4.0/\">Creative Commons Attribution 4.0 International License</a>.<br />Based on a work at <a xmlns:dct=\"http://purl.org/dc/terms/\" href=\"https://github.com/numerical-mooc/assignment-bank\" rel=\"dct:source\">https://github.com/numerical-mooc/assignment-bank</a>.\n"}︡
︠32ae929c-1d4a-4e43-a89b-1d53292d0be3︠
# (1) equation of lift

# L     lift force
# S     surface area
# rho   density of air
# v     forward velocity
# C_L   coefficient of lift

%var L,S,rho,v, C_L
eq_L = L == C_L * S * (1/2) * rho * v^2
eq_L
︡d94347e5-ed3d-4d16-94ad-2e650536274a︡{"tex":{"tex":"L = \\frac{1}{2} \\, C_{L} S \\rho v^{2}","display":true}}︡
︠3cf22e93-3465-4af7-b504-216ba9253844︠
# (2) equation of drag


# D     drag force
# C_D   coefficient of drag

%var D,C_D
eq_D = D == C_D * S * (1/2) * rho * v^2
eq_D
︡22180fc0-26b9-477f-b9b8-0052769b978a︡{"tex":{"tex":"D = \\frac{1}{2} \\, C_{D} S \\rho v^{2}","display":true}}︡
︠e9267c27-b7e4-4edb-beef-7bef84b30751︠
# (3) equation of force perpendicular to the trajectory

# W     weight of airplane
# theta glide angle

%var W,theta
eq_fprp = L == W * cos(theta)
eq_fprp
︡e9ed821d-3e19-4ecf-814c-2645193e792b︡{"tex":{"tex":"L = W \\cos\\left(\\theta\\right)","display":true}}︡
︠5787cac9-243d-426b-89d5-155e64ebdd67︠
# (3) equation of force parallel to the trajectory

eq_fpar = D == W * sin(theta)
eq_fpar
︡65a7d794-2f82-44e7-a57b-afcdcc4a8746︡{"tex":{"tex":"D = W \\sin\\left(\\theta\\right)","display":true}}︡
︠25e955ff-628a-4b02-afc5-269f546b980e︠
# (4) at trim velocity, lift matches weight

# v_t   trim velocity (when L==W)

%var v_t
eq_L2 = eq_L.subs(v = v_t,L = W)
eq_L2

︡120ae0ab-ad7d-4ea2-b993-044cc56ec081︡{"tex":{"tex":"W = \\frac{1}{2} \\, C_{L} S \\rho v_{t}^{2}","display":true}}︡
︠7f07e7b6-c929-42ab-a456-1f3a4d26ce25︠
# (5) lift ratio as function of flight velocity

eq_lr = eq_L / eq_L2
eq_lr

︡087c2b00-b7d4-4ac0-99ec-295d82455556︡{"tex":{"tex":"\\frac{L}{W} = \\frac{v^{2}}{v_{t}^{2}}","display":true}}︡
︠a668adb4-f127-4ee1-a3c9-470da274501e︠
# (6) balance centripetal force from curve of plane's path and gravity

# g     acceleration of Earth's gravity
# R     radius of curvature of trajectory

%var g,R

eq_gbal = (L - W * cos(theta) == (W / g) * (v^2 / R)).add_to_both_sides(W * cos(theta))
eq_gbal

︡492ef2d7-9f6c-4527-8280-fc9072c10c7f︡{"tex":{"tex":"L = W \\cos\\left(\\theta\\right) + \\frac{W v^{2}}{R g}","display":true}}︡
︠12297820-6481-49ab-84a2-ec63feb1e5a1︠
# (7) phugoid equation in terms of velocity

eq_phv = (eq_gbal / W).subs_expr(eq_lr).factor().expand().add_to_both_sides(- cos(theta))
eq_phv
︡91065d0e-c740-4c49-83ea-fbc27a0e3857︡{"tex":{"tex":"\\frac{v^{2}}{v_{t}^{2}} - \\cos\\left(\\theta\\right) = \\frac{v^{2}}{R g}","display":true}}︡
︠fd56fe62-5711-40fc-869c-eca66382e05d︠
# (8) simplify - no friction, lift does no work, total energy is constant
# also set zero energy point at reference horizontal (z == 0)

# z     depth of plane below reference horizontal

%var z,z_t

eq_ze = (1/2) * v^2 - g * z == 0
eq_ze
eq_zt = eq_ze.subs(v = v_t, z = z_t)
eq_zt
︡b7a4d502-fbc2-448d-8902-915eb2b79562︡{"tex":{"tex":"\\frac{1}{2} \\, v^{2} - g z = 0","display":true}}︡{"tex":{"tex":"\\frac{1}{2} \\, v_{t}^{2} - g z_{t} = 0","display":true}}︡
︠45262911-1c0c-468d-acf8-148a636d8c41︠
# rearrange z equation

eq_ze2 = eq_ze.solve(v^2)[0]
eq_ze2
︡b3ae6101-3a3f-4b42-9700-d5256a1e12da︡{"tex":{"tex":"v^{2} = 2 \\, g z","display":true}}︡
︠9ba43ce9-7d1f-4432-acbf-977c0ee3573d︠
# rearrange z_t equation

eq_zt2 = eq_zt.solve(v_t^2)[0]
eq_zt2

︡5721c80c-6d35-42c4-a662-fda2342fc835︡{"tex":{"tex":"v_{t}^{2} = 2 \\, g z_{t}","display":true}}︡
︠d4c4ce68-6b5d-4a96-b22f-07be909e4671︠
# rewrite phugoid equation in terms of z, step 1

eq_p2 = eq_phv.subs_expr(eq_ze2)
eq_p2

︡83d043c0-1452-4b11-aab9-c94b11f01479︡{"tex":{"tex":"\\frac{2 \\, g z}{v_{t}^{2}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡
︠e4d6d896-a770-4324-a824-029833714bb8︠
# (9) rewrite phugoid equation in terms of z, step 2

eq_phz = (eq_p2 * eq_zt2).expand().subs_expr(eq_zt2).multiply_both_sides(1/(2*g*z_t)).expand()
eq_phz


︡feb6830e-54de-41fe-a1aa-c43db3f8e478︡{"tex":{"tex":"\\frac{z}{z_{t}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡
︠c27d6936-9088-4ca1-bd0a-7ada4c334068︠
# treat infinitesimals naively

# (10) diff eq for glide angle vs trajectory length

# ds    tiny arc length of trajectory
# dth   tiny glide angle

%var ds
dth = var('dth',latex_name = "d\\theta")

eq_dthds = 1 / R == dth/ds
eq_dthds
︡0d9d7ce4-a2ac-406e-960f-57d2b5a9b84c︡{"tex":{"tex":"\\frac{1}{R} = \\frac{d\\theta}{\\mathit{ds}}","display":true}}︡
︠dae5a7c6-7a26-4d58-9bad-bb68ef37d264︠
# (10) diff eq for depth below horizontal vs trajectory length

# dz    tiny depth below horizontal

%var dz

eq_dzds = sin(theta) == - dz/ds
eq_dzds
︡b9f3440f-3221-4bb7-9361-95ee931436d6︡{"tex":{"tex":"\\sin\\left(\\theta\\right) = -\\frac{\\mathit{dz}}{\\mathit{ds}}","display":true}}︡
︠d9e1a02c-a5e3-4d12-a4cc-bb335e29017a︠
# (11) diff eq for glide angle vs depth below horizontal

# chain rule is multiplication of infinitesimals

eq_dthdz = (eq_dthds / eq_dzds)
eq_dthdz
︡1301ef25-d61b-44ec-849f-bc8d736d0859︡{"tex":{"tex":"\\frac{1}{R \\sin\\left(\\theta\\right)} = -\\frac{d\\theta}{\\mathit{dz}}","display":true}}︡
︠0963f5bb-77ff-429b-8f56-37dee9741d45︠
# (12) multiply phugoid equation (9) by 1/(2*sqrt(z))

eq_phz2 = eq_phz.multiply_both_sides(1/(2*z^(1/2))).expand()
eq_phz2
︡33e183c1-93ee-4855-8def-813615696222︡{"tex":{"tex":"-\\frac{\\cos\\left(\\theta\\right)}{2 \\, \\sqrt{z}} + \\frac{\\sqrt{z}}{2 \\, z_{t}} = \\frac{\\sqrt{z}}{R}","display":true}}︡
︠220542da-9636-4dc4-9515-a94a225d6cc0︠
# (13) substitute for 1/R in (12)

# split this step to avoid long line in worksheet
eq_phz3a = eq_phz2.subs(eq_dthdz.multiply_both_sides(sin(theta)))
eq_phz3b = eq_phz3a.add_to_both_sides((cos(theta)/(2*z^(1/2))))
eq_phz3b
︡94b25921-c411-4ac6-a78b-8f8bad359ba2︡{"tex":{"tex":"\\frac{\\sqrt{z}}{2 \\, z_{t}} = -\\frac{d\\theta \\sqrt{z} \\sin\\left(\\theta\\right)}{\\mathit{dz}} + \\frac{\\cos\\left(\\theta\\right)}{2 \\, \\sqrt{z}}","display":true}}︡
︠e9368163-f067-40cb-a79a-be2535895908︠
# (14) rewrite (13) as an exact derivative

# theta becomes a function of z instead of a variable

theta = function('theta',z)
theta

︡e923ef20-5488-47b5-90fe-d85c3035b30a︡{"tex":{"tex":"\\theta\\left(z\\right)","display":true}}︡
︠d922aea6-cc8e-4e17-a161-5626edfb5f44︠
# (14) continued

# g is the function whose exact derivative appeared in (13)

g = function('g',z)

eq_g = g == z ^ (1/2) * cos(theta)
eq_g
eq_g.derivative(z)

# NOTE: dg/dz appears as D[0](g)(z), etc.


︡5dc9eb94-d8e6-46fa-b473-c43ff02a5fd4︡{"tex":{"tex":"g\\left(z\\right) = \\sqrt{z} \\cos\\left(\\theta\\left(z\\right)\\right)","display":true}}︡{"tex":{"tex":"D[0]\\left(g\\right)\\left(z\\right) = -\\sqrt{z} \\sin\\left(\\theta\\left(z\\right)\\right) D[0]\\left(\\theta\\right)\\left(z\\right) + \\frac{\\cos\\left(\\theta\\left(z\\right)\\right)}{2 \\, \\sqrt{z}}","display":true}}︡
︠9ff765b2-cbaf-4df9-9662-2005aeb2cb2d︠
### I want to redo steps (10)-(14) using differential equations
### instead of infinitesimals and use the chain rule.

### To be continued.
︡5714d3ee-bc5d-4ac4-a4c0-789b705d6187︡
︠464f3bd4-303e-4095-9765-dc397e669730︠
# (10) diff eq

# s     arc length

%var s

de_10 = (1/R) == diff(theta,s)
de_10
︡221ceb1b-9016-4366-90f7-9c02abac871b︡{"tex":{"tex":"\\frac{1}{R} = 0","display":true}}︡
︠ee9b6a9e-9ccc-4308-bd3c-6b42d00e5286︠
# substitute right hand side of (13) for d(theta)/dz

dthdz = derivative(theta,z)
dthdz

eq_phz3b.lhs()

eq_de1 = eq_g.derivative(z).subs(dthdz == eq_phz3b.lhs())
eq_de1

︡38b9b1a9-8fa2-4002-b323-0ccaf18eaa09︡{"tex":{"tex":"D[0]\\left(\\theta\\right)\\left(z\\right)","display":true}}︡{"tex":{"tex":"\\frac{\\sqrt{z}}{2 \\, z_{t}}","display":true}}︡{"tex":{"tex":"D[0]\\left(g\\right)\\left(z\\right) = -\\frac{z \\sin\\left(\\theta\\left(z\\right)\\right)}{2 \\, z_{t}} + \\frac{\\cos\\left(\\theta\\left(z\\right)\\right)}{2 \\, \\sqrt{z}}","display":true}}︡
︠196db583-aff6-4235-b3cc-7c1e157c71c8︠









