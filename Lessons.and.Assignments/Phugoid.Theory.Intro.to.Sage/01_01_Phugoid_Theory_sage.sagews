︠d5f1008c-d5f7-4b93-a6fc-7ce45beef10fa︠
%auto
typeset_mode(true)
︡a4edcd7b-19d3-472e-85d4-825ea16cc8fe︡{"auto":true}︡
︠80b4a62c-57cb-49a1-a41b-569c01c2a336i︠
%md

# 01_01_Phugoid_Theory as SageMathCloud worksheet

Based on [numerical-mooc / lessons / 01_phugoid / 01_01_Phugoid_Theory.ipynb](http://nbviewer.ipython.org/github/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) from [MAE6286](http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/about).

Numbers in parentheses are equation numbers in the IPython notebook.
︡e184e6a4-1760-4dc9-9b12-ba7799a46615︡{"md":"\n# 01_01_Phugoid_Theory as SageMathCloud worksheet\n\nBased on [numerical-mooc / lessons / 01_phugoid / 01_01_Phugoid_Theory.ipynb](http://nbviewer.ipython.org/github/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) from [MAE6286](http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/about).\n\nNumbers in parentheses are equation numbers in the IPython notebook.\n"}︡
︠bfb06e38-c6ff-4ea0-9a39-63726b4d3af1i︠
%html

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type"><a href="http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/">MAE6286</a> phugoid flight tutorial transcribed to sage</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/DrXyzzy/assignment-bank" property="cc:attributionName" rel="cc:attributionURL">Hal Snyder</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/numerical-mooc/assignment-bank" rel="dct:source">https://github.com/numerical-mooc/assignment-bank</a>.
︡914bfaf8-d661-407e-bfa5-88c1f8e4321f︡{"html":"\n<a rel=\"license\" href=\"http://creativecommons.org/licenses/by/4.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"https://i.creativecommons.org/l/by/4.0/80x15.png\" /></a><br /><span xmlns:dct=\"http://purl.org/dc/terms/\" href=\"http://purl.org/dc/dcmitype/InteractiveResource\" property=\"dct:title\" rel=\"dct:type\"><a href=\"http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/\">MAE6286</a> phugoid flight tutorial transcribed to sage</span> by <a xmlns:cc=\"http://creativecommons.org/ns#\" href=\"https://github.com/DrXyzzy/assignment-bank\" property=\"cc:attributionName\" rel=\"cc:attributionURL\">Hal Snyder</a> is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by/4.0/\">Creative Commons Attribution 4.0 International License</a>.<br />Based on a work at <a xmlns:dct=\"http://purl.org/dc/terms/\" href=\"https://github.com/numerical-mooc/assignment-bank\" rel=\"dct:source\">https://github.com/numerical-mooc/assignment-bank</a>.\n"}︡
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
︡c1f34103-39e9-4ae0-82e9-72b678855880︡{"tex":{"tex":"L = \\frac{1}{2} \\, C_{L} S \\rho v^{2}","display":true}}︡
︠3cf22e93-3465-4af7-b504-216ba9253844︠
# (2) equation of drag


# D     drag force
# C_D   coefficient of drag

%var D,C_D
eq_D = D == C_D * S * (1/2) * rho * v^2
eq_D
︡d6f9a463-e01c-4e63-9705-c46376539e2a︡{"tex":{"tex":"D = \\frac{1}{2} \\, C_{D} S \\rho v^{2}","display":true}}︡
︠e9267c27-b7e4-4edb-beef-7bef84b30751︠
# (3) equation of force perpendicular to the trajectory

# W     weight of airplane
# theta glide angle

%var W,theta
eq_fprp = L == W * cos(theta)
eq_fprp
︡fcf7db91-2c07-47f6-83ed-d536f06d12f7︡{"tex":{"tex":"L = W \\cos\\left(\\theta\\right)","display":true}}︡
︠5787cac9-243d-426b-89d5-155e64ebdd67︠
# (3) equation of force parallel to the trajectory

eq_fpar = D == W * sin(theta)
eq_fpar
︡3131a6a0-077c-4596-b675-df251a72b8e8︡{"tex":{"tex":"D = W \\sin\\left(\\theta\\right)","display":true}}︡
︠25e955ff-628a-4b02-afc5-269f546b980e︠
# (4) at trim velocity, lift matches weight

# v_t   trim velocity (when L==W)

%var v_t
eq_L2 = eq_L.subs(v = v_t,L = W)
eq_L2

︡f42a8fe7-68ce-4b42-bce7-f272be52f96c︡{"tex":{"tex":"W = \\frac{1}{2} \\, C_{L} S \\rho v_{t}^{2}","display":true}}︡
︠7f07e7b6-c929-42ab-a456-1f3a4d26ce25︠
# (5) lift ratio as function of flight velocity

eq_lr = eq_L / eq_L2
eq_lr

︡29b6873e-f6a6-49e4-ae07-d31dd3d1858e︡{"tex":{"tex":"\\frac{L}{W} = \\frac{v^{2}}{v_{t}^{2}}","display":true}}︡
︠a668adb4-f127-4ee1-a3c9-470da274501e︠
# (6) balance centripetal force from curve of plane's path and gravity

# g     acceleration of Earth's gravity
# R     radius of curvature of trajectory

%var g,R

eq_gbal = (L - W * cos(theta) == (W / g) * (v^2 / R)).add_to_both_sides(W * cos(theta))
eq_gbal

︡b47f1a7a-8a98-4017-9958-669a9354f392︡{"tex":{"tex":"L = W \\cos\\left(\\theta\\right) + \\frac{W v^{2}}{R g}","display":true}}︡
︠12297820-6481-49ab-84a2-ec63feb1e5a1︠
# (7) phugoid equation in terms of velocity

eq_phv = (eq_gbal / W).subs_expr(eq_lr).factor().expand().add_to_both_sides(- cos(theta))
eq_phv
︡a83ee771-84a9-406a-addc-3cba513bd9be︡{"tex":{"tex":"\\frac{v^{2}}{v_{t}^{2}} - \\cos\\left(\\theta\\right) = \\frac{v^{2}}{R g}","display":true}}︡
︠fd56fe62-5711-40fc-869c-eca66382e05d︠
# (8) simplify - no friction, lift does no work, total energy is constant
# also set zero energy point at reference horizontal (z == 0)

# z     depth of plane below reference horizontal

%var z,z_t

eq_ze = (1/2) * v^2 - g * z == 0
eq_ze
eq_zt = eq_ze.subs(v = v_t, z = z_t)
eq_zt
︡2230b0e7-6f42-47a8-9152-8efbf4603207︡{"tex":{"tex":"\\frac{1}{2} \\, v^{2} - g z = 0","display":true}}︡{"tex":{"tex":"\\frac{1}{2} \\, v_{t}^{2} - g z_{t} = 0","display":true}}︡
︠45262911-1c0c-468d-acf8-148a636d8c41︠
# rearrange z equation

eq_ze2 = eq_ze.solve(v^2)[0]
eq_ze2
︡35e02ffa-b252-4779-90dc-b287142cc9e5︡{"tex":{"tex":"v^{2} = 2 \\, g z","display":true}}︡
︠9ba43ce9-7d1f-4432-acbf-977c0ee3573d︠
# rearrange z_t equation

eq_zt2 = eq_zt.solve(v_t^2)[0]
eq_zt2

︡69bf586e-ca48-44f7-969f-14ba9d3e3d2a︡{"tex":{"tex":"v_{t}^{2} = 2 \\, g z_{t}","display":true}}︡
︠d4c4ce68-6b5d-4a96-b22f-07be909e4671︠
# rewrite phugoid equation in terms of z, step 1

eq_p2 = eq_phv.subs_expr(eq_ze2)
eq_p2

︡1c66ec30-5156-4642-b8f7-d07fc007e1d0︡{"tex":{"tex":"\\frac{2 \\, g z}{v_{t}^{2}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡
︠e4d6d896-a770-4324-a824-029833714bb8︠
# (9) rewrite phugoid equation in terms of z, step 2

eq_phz = (eq_p2 * eq_zt2).expand().subs_expr(eq_zt2).multiply_both_sides(1/(2*g*z_t)).expand()
eq_phz


︡505a902a-4324-4d09-bc46-d7441bb75353︡{"tex":{"tex":"\\frac{z}{z_{t}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡
︠560419ef-427c-4fbe-a937-7359a692964b︠
# (10) diff eq for theta vs s

%var s

theta = function('theta',s)
de1 = 1 / R == diff(theta,s)
de1
︡f787de0e-e315-4da1-b6f1-f422a97fc8b6︡{"tex":{"tex":"\\frac{1}{R} = D[0]\\left(\\theta\\right)\\left(s\\right)","display":true}}︡
︠4f49d796-0944-4247-b595-559867753f39︠
# (10) diff eq for z vs s

z = function('z',s)
de2 = sin(theta) == - diff(z,s)
de2
︡e961b721-bd48-435f-9b38-6df31f434584︡{"tex":{"tex":"\\sin\\left(\\theta\\left(s\\right)\\right) = -D[0]\\left(z\\right)\\left(s\\right)","display":true}}︡
︠6e65714a-0783-4bee-9756-0d4adcb9a7fe︠
f = z ^ (1/2) * cos(theta)
f
type(f)
type(z)
type(s)
︡bd53f67d-2fbc-49ae-8e95-11e2e4ea030e︡{"tex":{"tex":"\\cos\\left(\\theta\\left(s\\right)\\right) \\sqrt{z\\left(s\\right)}","display":true}}︡{"stdout":"<type 'sage.symbolic.expression.Expression'>\n"}︡{"stdout":"<type 'sage.symbolic.expression.Expression'>\n"}︡{"stdout":"<type 'sage.symbolic.expression.Expression'>\n"}︡
︠c27d6936-9088-4ca1-bd0a-7ada4c334068︠


# treat infinitesimals naively

# (10) diff eq for glide angle vs trajectory length

# ds    tiny arc length of trajectory
# dth   tiny glide angle

%var ds
dth = var('dth',latex_name = "d\\theta")

eq_dthds = 1 / R == dth/ds
eq_dthds
︡6c873af5-130f-4030-a9aa-6fb00031c5b8︡{"tex":{"tex":"\\frac{1}{R} = \\frac{d\\theta}{\\mathit{ds}}","display":true}}︡
︠dae5a7c6-7a26-4d58-9bad-bb68ef37d264︠
# (10) diff eq for depth below horizontal vs trajectory length

# dz    tiny depth below horizontal

%var dz

eq_dzds = sin(theta) == - dz/ds
eq_dzds
︡157f055e-ff41-444c-99df-4605dbcbc0c3︡{"tex":{"tex":"\\sin\\left(\\theta\\left(s\\right)\\right) = -\\frac{\\mathit{dz}}{\\mathit{ds}}","display":true}}︡
︠d9e1a02c-a5e3-4d12-a4cc-bb335e29017a︠
# (11) diff eq for glide angle vs depth below horizontal

# chain rule is multiplication of infinitesimals

eq_dthdz = (eq_dthds / eq_dzds)
eq_dthdz
︡3819eb43-a5d9-410b-aecb-7cfa8eb30b52︡{"tex":{"tex":"\\frac{1}{R \\sin\\left(\\theta\\left(s\\right)\\right)} = -\\frac{d\\theta}{\\mathit{dz}}","display":true}}︡
︠0963f5bb-77ff-429b-8f56-37dee9741d45︠
# (12) multiply phugoid equation (9) by 1/(2*sqrt(z))

eq_phz2 = eq_phz.multiply_both_sides(1/(2*z^(1/2))).expand()
eq_phz2
︡4d35f473-9b24-47f8-af23-cd5f264d7f8b︡{"tex":{"tex":"-\\frac{\\cos\\left(\\theta\\right)}{2 \\, \\sqrt{z\\left(s\\right)}} + \\frac{z}{2 \\, z_{t} \\sqrt{z\\left(s\\right)}} = \\frac{z}{R \\sqrt{z\\left(s\\right)}}","display":true}}︡
︠220542da-9636-4dc4-9515-a94a225d6cc0︠
# (13) substitute for 1/R in (12)

# split this step to avoid long line in worksheet
eq_phz3a = eq_phz2.subs(eq_dthdz.multiply_both_sides(sin(theta)))
eq_phz3b = eq_phz3a.add_to_both_sides((cos(theta)/(2*z^(1/2))))
eq_phz3b
︡72421636-1618-47cc-863a-b7e2c5a8bbd6︡{"tex":{"tex":"-\\frac{\\cos\\left(\\theta\\right)}{2 \\, \\sqrt{z\\left(s\\right)}} + \\frac{\\cos\\left(\\theta\\left(s\\right)\\right)}{2 \\, \\sqrt{z\\left(s\\right)}} + \\frac{z}{2 \\, z_{t} \\sqrt{z\\left(s\\right)}} = -\\frac{d\\theta z \\sin\\left(\\theta\\left(s\\right)\\right)}{\\mathit{dz} \\sqrt{z\\left(s\\right)}} + \\frac{\\cos\\left(\\theta\\left(s\\right)\\right)}{2 \\, \\sqrt{z\\left(s\\right)}}","display":true}}︡
︠e9368163-f067-40cb-a79a-be2535895908︠
# (14) rewrite (13) as an exact derivative

# theta becomes a function of z instead of a variable

theta = function('theta',z)
theta

︡aff15d9e-23b7-4579-bb99-d8cddc154b47︡{"tex":{"tex":"\\theta\\left(z\\left(s\\right)\\right)","display":true}}︡
︠d922aea6-cc8e-4e17-a161-5626edfb5f44︠
# (14) continued

# g is the function whose exact derivative appeared in (13)
%var zv

g = function('g',zv)

eq_g = g == z ^ (1/2) * cos(theta)
eq_g
eq_g.derivative(zv)

# NOTE: dg/dz appears as D[0](g)(z), etc.


︡48b10b2d-8817-4408-8e57-35f3d54d2de7︡{"tex":{"tex":"g\\left(\\mathit{zv}\\right) = \\cos\\left(\\theta\\left(z\\left(s\\right)\\right)\\right) \\sqrt{z\\left(s\\right)}","display":true}}︡{"tex":{"tex":"D[0]\\left(g\\right)\\left(\\mathit{zv}\\right) = 0","display":true}}︡
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









