// 1. Import your custom functions from the template file
#import "template.typ": research-notes, hl, theory-box, math-box

// 2. Apply the template
#show: research-notes.with(
  title: "Dark Matter Notes",
  author: "T.Y. Booritth Balaji",
  affiliation: "Indian Institute of Science",
  // supervisor: "Prof. Ranjan Laha"
)

// // 3. Start writing!
// = Introduction to Quantum Field Theory
// This document serves as the primary reference notes. Here is a highlighted concept: #hl[this text is highlighted clearly].

// #theory-box(title: "The IceCube Detector Mechanism")[
//   This box is now pulling its styling entirely from the external file!
// ]

= Cosmological Background 

== The isotropic, homogeneous universes and their metrics

When averaged over a large distance ($~ 100$ Mpc), the universe is: 
  - *isotropic*: is the same in all directions 
  - *homogenous*: the same at every point in space

  Given these conditions, the systematics of the evolution of the universe simplifies by a great deal. 

  First, we start off with describing the space-time geometry, which is primarily characterized by the space-time metric. 

  A *metric* is just an object that turns coordinate distances to physical distances. In 3D euclidean space, the physical distance $d l$ corresponding to the physical distance between two points separated by an infinitesimal coordinates: $d x, d y, d z$ is: 
  
  $ d l^2 = d x^2 + d y^2 + d z^2 = sum_(i, j = 1)^(3) delta_(i j) dif x^i dif x^j  $

  where $(x^1, x^2, x^3) = (x, y, z)$. In this example, the metric is just the _Kronecker delta_: $delta_(i j) = "diag"(1,1,1)$ 

  If we were to do the same in the polar coordinates, we would get: 

  $ dif l^2 = dif r^2 + r^2 dif theta^2 + r^2 sin^2 theta dif phi^2 = sum_(i, j = 1)^(3) g_(i j) dif x^i dif x^j  $  

  where $(x^1, x^2, x^3) = (r, theta, phi)$ and in this case, the metric takes the form: $g(i j) = "diag"(1, r^2, r^2 sin^2 theta)$ 

  Since the physical distance is the same, regardless of which coordinate system we use, its called the *invariant*. 

  Coming to 4D space-time coordinates: $x^mu = (c t, x^i)$, the invariant is then given by: 

  $ dif s^2 = g_(mu nu) dif x^mu dif x^nu $

  In SR, the space-time is _Minkowski space_, whose properties are: 

  $ dif s^2 = -c^2 dif t^2 + delta_(i j) dif x^i dif x^j \ g_(i j) = "diag"(-1, 1, 1, 1) $

  The spatial homogeneity and isotropy of the universe mean that it can be represented by a time-ordered sequence of three-dimensional spatial slices, each of which is homogeneous and isotropic. 

  Now, a homogeneous and isotropic three-space can have three possible geometries: flat (zero curvature), spherical (uniform positive curvature) and hyperbolic (uniform negative curvature). If the curvature is non-uniform, then the space is either not isotropic or not homogeneous, breaking the cosmological principle.  We will consider the three cases one by one and then unify them together.

  - *flat space* ($E^3$): In flat space, there is zero curvature and the line element is directly given by: $ dif l^2 = dif bold(x)^2 = delta_(i j) dif x^i dif x^j $ In spherical-polar coordinates the line element is given by: $ dif l^2 = dif r^2 + r^2 (dif theta^2 + sin^2 theta dif phi^2) $

  - *spherical space* ($S^3$): The other scenario is when there is a uniform positive curvature. To understand how this would lead to a homogenous and isotropic space, we can reduce the dimensions and imagine a 2D surface with a uniform positive curvature, which is a surface of a sphere. #figure(image("images/positive-curvature.png", width: 30%), caption: [Uniform positive curvature of a two-dimensional surface, a sphere])<positive-curvature.png> The line element for a 2D surface embedded on to a 3D sphere is given by: $ x^2 + y^2 + z^2 = R_0^2 $ Similarly, if we consider our original case of a 3D space with uniform positive curvature, we can represent it as a 3-sphere embedded in a 4D Euclidean space: $ x^2 + y^2 + z^2 + w^2 = R^2 $ This was in cartesian coordinates, but we can write this in the 4D generalization of spherical-polar coordinates using the following transformations: $ r = R sin chi $ $ x = R sin chi sin theta cos phi "  ,  " y = R sin chi sin theta sin phi \ z = R sin chi cos theta "  ,  " w = R cos chi $ Now a point on $S^3$ is determined by the three angular coordinates: $chi, theta in [0, pi]$, $phi in [0, 2 pi)$. The metric or the line element then becomes: $ dif l^2 = R^2 [dif chi^2 + sin^2 chi (dif theta^2 + sin^2 theta dif phi^2)] $  An interesting fact to note here is that in the case of a 2-sphere, the surface area is fixed at $4 pi R^2$ which makes it so that there is a maximum distance between any two points on the sphere, which is $pi R$. In the case of a 3-sphere, the volume is fixed and also there is a maximum distance between any two points.  
  
  - *hyperbolic space* ($H^3$): Similar to the last case, if the curvature is uniformly negative then the space is homogenous and isotropic as well. This can be visualized by considering a 2D surface with uniform negative curvature, which is a hyperboloid, or a saddle-shaped surface. #figure(image("images/negative-curvature.png", width: 40%), caption: [Uniform negative curvature of a two-dimensional surface, a hyperboloid])<negative-curvature.png> Although this representation is not entirely correct since it is impossible to construct a 2D surface of uniform negative curvature in a 3D Euclidean space. This particular visualization only holds near the center. Generalizing this to 3D, we can represent a 3D space with uniform negative curvature as a hyperboloid embedded in a 4D Lorentzian space: $ x^2 + y^2 + z^2 - w^2 = - R^2 $ Going through a similar process as before, we can write the line element for this space in 4D spherical polar coordinates as: $ dif l^2 = R^2 [dif chi^2 + sinh^2 chi (dif theta^2 + sin^2 theta dif phi^2)] $
  
  The metrics can be written in a unified way as: 
  
  $ dif l^2 = (dif r^2)/(1 - k r^2 slash R_0^2) + r^2 (dif theta^2 + sin^2 theta dif phi^2) "  where  " k = cases(+1 "   spherical", 0 "     flat", -1 "   hyperbolic") $ 
  
  or in 4D spherical polar coordinates as: 
  
  $ dif l^2 = R^2 [dif chi^2 + S^2_k (chi) (dif theta^2 + sin^2 theta dif phi^2) ] "  where  " S_k (chi) = cases(sin chi "   " k = +1, 0 "       " k = 0, sinh chi " " k = -1) $ 

  or typically it is written in the following form:

  $ dif l^2 = dif r^2 + S_k (r)^2 (dif theta^2 + sin^2 theta dif phi^2) "  where  " S_k (r) = cases( R sin (r slash R) "   " k = +1, r "                " k = 0, R sinh (r slash R) " " k = -1) $
  
  The metric described by the minkowski space is not sufficient to describe the geometry of the universe. For that, we incorporate the line element that we derived above with the time component to get the metric of the universe. 

$ dif s^2 = - c^2 dif t^2 + dif l^2 $

#math-box[  
   $ dif s^2 = - c^2 dif t^2 + a^2(t) [1/(1 - k r^2 slash R^2) dif r^2 + r^2 (dif theta^2 + sin^2 theta dif phi^2)] \ \ dif s^2 = -c^2 dif t^2 + a^2(t) [dif r^2 + S_k (r)^2 (dif theta^2 + sin^2 theta dif phi^2)] $<FLRW>
]



This is the *Friedmann-Lemaitre-Robertson-Walker (FLRW) metric* in polar coordinates. 

The role of the *dimensionless scale factor $a(t)$* is to account for the expansion of the universe: whatever $dif l$ is at the present time, it will be scaled by some factor at a different time since the universe is expanding. 
  
  // The 4D invariant can then be generalized as: 

  // $ dif s^2 = -c^2 dif t^2 + a^2(t) dif l^2  $

  // where $dif l^2 = gamma_(i j) (x^k) dif x^i dif x^j$ is the line-element on a single space-slice, and $a(t)$ is the scale factor which is related to the expansion of the universe. 

  // First, we will determine the spatial metric $gamma_(i j)$. Since the universe is homogenous and isotropic, the three-spaces must have an intrinsic curvature: 

  // - *flat space* ($E^3$): The simplest possibility, with 3D Euclidean space, where parallel lines don't intersect. The line element is given by: 
  //   $ dif l^2 = dif bold(x)^2 = delta_(i j) dif x^i dif x^j $

  //   This is invariant under any translation ($x^i arrow x^i + a^i$) and rotations ($x^i arrow R^i_j x^j$)


  // - *spherical space* ($S^3$): This is a three-space with a constant positive curvature. On such a space, parallel lines will eventually meet. This is can be represented as a three-sphere embedded in a four-dimensional Euclidean space: $ dif l^2 = dif bold(x)^2 + dif u^2 ",  " bold(x)^2 + u^2 = R_0^2  $

  //   where $R_0$ is the radius of the sphere. 
 
  // - *hyperbolic space* ($H^3$): Similar to the last case, if the curvature is negative then parallel lines diverge. This geometry can be represented as a hyperboloid embedded in four-dimensional Lorentzian space. $ dif l^2 = dif bold(x)^2 - dif u^2 ",  " bold(x)^2 - u^2 = - R_0^2 $

  //   where $R_0^2 > 0$ is a constant determining the curvature of the hyperboloid. 

// The last two cases can be written compactly as: 

// $ dif l^2 = dif bold(x)^2 plus.minus dif u^2 ",  " bold(x)^2 plus.minus u^2 = plus.minus R_0^2 $

// The differential can be written as: $ u dif u = minus.plus bold(x) dot dif bold(x) $ then we can write: $ dif l^2 = dif bold(x)^2 plus.minus (bold(x) dot dif bold(x))^2/(R_0^2 minus.plus bold(x)^2) $

// We can unify this with the Euclidean flat space case by writing: 

// $ dif l^2 = dif bold(x)^2 plus k dot (bold(x) dot dif bold(x))^2/(R_0^2 minus k bold(x)^2) "   where   " k = cases(0 ",    " E^3,+1 ",    " S^3,-1 ",    " H^3 ) $

// It is more convenient to write this in polar form: 

// $ dif bold(x)^2 = dif r^2 + r^2 (dif theta^2 + sin^2 theta dif phi^2) \ bold(x) dot dif bold(x) = r dot dif r \ bold(x)^2 = r^2 $ 

// Then the line elements comes to: 

// $ dif l^2 = (dif r^2)/(1 - k r^2 slash R_0^2) + r^2 dif Omega^2 "  where  " dif Omega^2 = dif theta^2 + sin^2 theta dif phi^2 $

// Substituting the line element we get the *Friedmann-Lemaitre-Robertson-Walker (FLRW) metric* in polar coordinates: 

// $ dif s^2 = - c^2 dif t^2 + a^2(t)[ (dif r^2)/(1 - k r^2 slash R_0^2) + r^2 dif Omega^2 ]  $<FLRW>

A few important points to note about the FLRW metric:

- The line element  has a rescaling symmetry: $ a arrow lambda a "   " r arrow r slash lambda "    " R_0 arrow R_0 slash lambda $

  This means the geometry of the space-time is invariant under a rescaling of the scale factor, the radial coordinate, and the curvature radius. We use this property and set the #hl("scale factor at the present time to be 1"): $ a(t_0) = 1 $

  The scale $R_0$ is then the curvature radius of the universe at the present time. 


- The coordinate $r$ is called the *comoving* radial coordinate, i.e. it is fixed to the expanding space and does not change with time and is not a physical distance. The actual physical distance is given by $bold(r)_"phy" = a(t) dot bold(r)$. 

  Consider a galaxy with comoving trajectory $bold(r)(t)$, then the physical velocity of the galaxy is given by: 

  $ bold(v)_"phy" = (dif bold(r)_"phy" (t))/ (dif t)  = (dif (a(t) dot bold(r)))/ (dif t) = dot(a)(t) bold(r) + a(t) dot(bold(r)) = H bold(r)_"phy" + bold(v)_"pec" $

  where $H = dot(a)(t) slash a(t)$ is the Hubble parameter and $bold(v)_"pec" = a(t) dot(bold(r))$ is the peculiar velocity of the galaxy. 

  #hl[The first term is the velocity of the galaxy due to the expansion of the space between us and the galaxy, the second term] ($bold(v)_"phy" = a(t) dot(bold(r))$) #hl[is the velocity  observed by a comoving observer at rest with respect to the expansion of the universe.] It is the velocity of the galaxy with respect to the cosmological rest frame. 
  
   
// We define the redshift parameter $z$ as: $ 1 + z = 1/a(t) $ A galaxy at redshift $z = 1$ is observed when the universe was half its current size, a galaxy at redshift $z=2$ when it was one third its current size and so on. The CMB was created at redshift $z approx 1100$ and the first galaxies formed around redshift $z ~ 10$.


// To understand the evolution of different components of the universe, we need to understand the *Energy-Momentum Tensor* $T_(mu nu)$, which is a tensor that describes the density and flux of energy and momentum in space-time. 

// We can decompose $T_(mu nu)$ into a three-scalar ($T_(00)$), two three-vectors ($T_(0 i)$ and $T_(i 0)$) and a three-tensor ($T_(i j)$). The physical meaning of these components are: 

// #figure(image("images/Energy-momentum-tensor-decom.png", width: 70%))<Energy-momentum-tensor-decom.png>


// In a homogenous universe the energy density must be independent of the spatial coordinates, so $T_(00) = epsilon(t)$, where $epsilon$ is the energy density. The momentum density must be zero, so $T_(0 i) = T_(i 0) = 0$ due to the isotropy requiring their mean values of the three-vectors to vanish in the comoving frame. And lastly the isotropy around a point $bold(x) = 0$ constrains the mean value of any three-tensor such that $T_(i j)$ is proportional to $delta_(i j)$. 

// Since the metric $g_(i j)$ equals $a^2 delta_(i j)$ at $bold(x) = 0$, we have: 

// $ T_(i j) (bold(x) = 0) prop delta_(i j) prop g_(i j)(bold(x) = 0) $

== Proper distance

The *proper distance* between two points in space-time is the physical distance between them at a given time, or more accurately, the length of the spatial geodesic (shortest path) between them when the scale factor is fixed at some value. 

Consider yourself to be at the origin and a galaxy at a comoving spherical coordinate $(r, theta, phi)$, as shown below @galaxy-proper-distance.png. We want to determine the proper distance between you and the galaxy at a given time $t$. 


#figure(image("images/galaxy-proper-distance.png", width: 70%), caption: [An observer is at the origin observing a galaxy at comoving coordinates $(r, theta, phi)$])<galaxy-proper-distance.png>


Since we are working at a fixed time, $dif t = 0$, the FLRW metric reduces to: 

$ dif s^2 = dif l^2 = a(t)^2 [dif r^2 + S_k (r)^2 dif Omega^2 ] $

where $ dif Omega^2 = dif theta^2 + sin^2 theta dif phi^2 $

The radial line between the origin and the galaxy is in itself the geodesic between the two points, this means $ dif theta, dif phi = 0 $

This reduces the line element to: 

$ dif l^2 = a(t)^2 dif r^2 => dif l = a(t) dif r $

The proper distance is then given by integrating the above expression: 

$ d_"proper" = a(t) integral_0^r dif r' = a(t) r $

which is intiutive, since $r$ is the co-moving distance and $a(t)$ is the scale factor that accounts for the expansion of the universe, so the true distance at any point in time would be the product of the two. 

#theory-box[An important point here is that the radius of curvature of the universe also increases as it expands, following the same relation as before: $ R(t) = a(t) R_0 $]

== Redshift 

In most cases it is not possible to directly measure the proper distance to a galaxy, but we can measure the redshift of the light coming from that galaxy. What's interesting is that #hl[ this redshift is not due to the doppler effect, but rather due to the expansion of the universe, and so it is called the *cosmological redshift* and has a special relation to the scale factor.] 

Consider the same galaxy before, @galaxy-proper-distance.png, and say it emits a light signal at time $t_e$ and we receive it at time $t_0$. The light travels along a null geodesic, which means $dif s^2 = 0$.
#theory-box(title: "Why light travels on a null geodesic?")[Light travels on a *null geodesic* due to its velocity and its state of free fall. Because light propagates at $c$, its spacetime interval is always zero ($d s^2 = 0$), defining a *null* path (where spatial distance matches temporal elapsed time). Because it is in free fall, it follows the straightest possible path through curved spacetime, defining a *geodesic*. 

Rigorously, in the geometric optics limit of Maxwell's equations in curved spacetime, the wave vector $k^mu$ must be null ($k^mu k_mu = 0$) and parallel-propagated ($k^nu nabla_nu k^mu = 0$), which is the exact mathematical definition of a null geodesic.]

Since along the path of the light, $dif theta = dif phi = 0$, the line element reduces to: $ c^2 dif t^2 = a(t)^2 dif r^2 $

Rearraging which, we get: $ dif r = (c/a(t)) dif t $

Here we see that #hl[the right hand side is only a function of time, while the left hand side is only a function of space.] Suppose the light emitted from the galaxy is with a wavelength $lambda_e$ (as observed by an observer there say). Now lets focus on a single wave crest of the light signal. That wave crest will be emitted at time $t_e$ and received at time $t_0$. The comoving distance traveled by that wave crest is given by integrating the above expression: 

$ integral_0^r dif r = integral_(t_e)^(t_0) c/a(t) dif t  \ \ 
=> r = integral_(t_e)^(t_0) c/a(t) dif t $

Now lets focus on the next wavecrest. That would have been emitted at time $t_e + lambda_e/c$ and received at time $t_0 + lambda_0/c$, where $lambda_0$ is the wavelength observed by us. The comoving distance traveled by that wave crest is given by:

$ integral_0^r dif r = integral_(t_e + lambda_e/c)^(t_0 + lambda_0/c) c/a(t) dif t  \ \ 
=> r = integral_(t_e + lambda_e/c)^(t_0 + lambda_0/c) c/a(t) dif t $

Equating the two expressions for $r$, we get: 

$ integral_(t_e)^(t_0) c/a(t) dif t = integral_(t_e + lambda_e/c)^(t_0 + lambda_0/c) c/a(t) dif t $

We shall subtract the integral $ integral_(t_e + lambda_e/c)^(t_0) c/a(t) dif t $ from both sides to get: 

$ integral_(t_e)^(t_e + lambda_e/c) c/a(t) dif t = integral_(t_0)^(t_0 + lambda_0/c) c/a(t) dif t $

Now, in the time in between the emission and reception of the wave crest, the scale factor does not change by much, so we can approximate $a(t)$ to be constant in the above integrals: $ a(t_e + lambda_e/c) approx a(t_e) "     " a(t_0 + lambda_0/c) approx a(t_0) $

and so the integral becomes: 

$ 1/a(t_e) integral_(t_e)^(t_e + lambda_e/c) dif t = 1/a(t_0) integral_(t_0)^(t_0 + lambda_0/c) dif t $

$ => 1/a(t_e) dot lambda_e/c = 1/a(t_0) dot lambda_0/c \ \ \ => lambda_0/lambda_e = a(t_0)/a(t_e) $

Combining this with the definition of redshift, which is: 

$  z = (lambda_0 - lambda_e)/lambda_e $

we get: 

$  z = a(t_0)/a(t_e) - 1 $

and by our convention, $a(t_0) = 1$, so we get the final relation between redshift and scale factor:

#math-box[$ 1 + z = 1/a(t_e) $]

Thus, if we observed a galaxy having a cosmological redshift of $z = 1$, then the scale factor at the time of emission of the light from that galaxy was $a(t_e) = 1/2$, which means the universe was half its current size when that light was emitted. 

#theory-box[The redshift we observe  for a distant object depends only on the relative scale factors at the time of emission and the time of observation. It doesn’t depend on how the transition between $a(t_e)$ and $a(t_0)$ was made. It doesn’t matter if the expansion was  gradual or abrupt; it doesn't matter if the transition was monotonic or oscillatory. All that matters is the scale factors at the time of emission and the time of observation.] 

We often refer to times in the past in terms of this redshift parameter $z$. We currently sit at $z = 0$, the CMB was created at $z approx 1100$ and the first galaxies formed around $z ~ 10$. #hl[The bigger the redshift, the further back in time we are looking.]

== Cosmological Fluids 

To study the evolution of the universe, we model the different components of the universe as #hl[perfect fluids], which are fluids that have no viscosity and no heat conduction. 

=== Equation of State

For a perfect fluid, we can write the *equation of state*, which is a relation between the pressure and the energy density of the fluid.

//  To derive that, we first look at the following two situations. 

// The energy of a system is given by the equation: $ E^2 = (m c^2)^2 + (p c)^2 $, which can exist in two limits: 
// 
// - *non-relativistic limit*: when $p << m c$, then $E approx m c^2$ and the velocity of the atoms is approximately $bold(v) = bold(p)/m$ 
// 
// - *relativistic limit*: when $p >> m c$, then $E approx p c$ and the velocity of the atoms is approximately $bold(v) = bold(p)/p = c$

In cosmology we often deal with dilute gases, for which the equation of state is often a simple linear relation between the pressure and the energy density: 

#math-box[$ P = w epsilon $<EOS>]

where $w$ is a #hl[dimensionless constant] and $epsilon$ is the #hl[energy density].

Different components of the universe have different values of $w$, which are listed below: 

- *radiation* or *relativistic matter*: $w = 1/3$
- *non-relativistic matter*: $w = 0$
- *dark energy*: $w = -1$

Determining $w$ for different components of the universe is a difficult task.  As an example, we will be evaluating it for a low-density non-relativistic gas: 

// #pad(left: 2em, right: 2em)[
#theory-box(title: "Equation of state for a non-relativistic gas")[
 The particles of such a gas have the speeds of random thermal motion much smaller than the speed of light, and thus the gas follows the ideal gas law: 
  $ P = rho/mu k T $

where $mu$ is the mean molecular weight of the gas, $k$ is the Boltzmann constant and $T$ is the temperature, $rho$ is the mass density of gas. Since the gas is non-relativistic, the energy density is dominated by the rest mass energy, so $epsilon = rho c^2$. Substituting this into the ideal gas law, we get:

$ P = rho/mu k T = (k T)/(mu c^2) epsilon $ 

For non-relativistic gases, the relation between the temperature and the mean square velocity of the particles is given by: $ 3 k T = mu chevron v^2 chevron.r $ 

Substituting this into the previous equation, we get: $ P = (mu chevron.l v^2 chevron.r )/(mu c^2) epsilon $

Thus the equation of state can be written as: $ P = w epsilon "  where  " w = (chevron.l v^2chevron.r )/c^2 << 1 $

So effectively for our purposes, we can treat a non-relativistic gas as a pressureless fluid with $w = 0$. 

$ =>  P = 0 $

]


=== Continuity Equation

For such fluids, we can also write the *continuity equation*, which is essentially the conservation of energy-momentum which we will use to determine the evolution of the energy density of the different components as the universe expands. 

From the laws of thermodynamics, we can write the first law as: $ dif E = - P dif V $ where $E$ is the total energy of the fluid, $P$ is the pressure and $V$ is the volume. 

Now consider a comoving volume, $V_0$, then the physical volume of the fluid is given by $V = a^3 V_0$. $ => (dif V)/(dif t) = 3 a^2 dot(a) V_0 $

The energy in this volume is given by $E = epsilon V = epsilon a^3 V_0$ where $epsilon$ is the energy density of the fluid. $ => (dif E)/(dif t) = a^3 V_0 dot(epsilon) + 3 a^2 dot(a) epsilon V_0 $

Substituting these into the first law, we get the final form of the continuity equation: 

#math-box[$ dot(epsilon) + 3H (epsilon + P) = 0 $<continuity>]


=== Friedmann Equations 

Now that we have linked the energy density and pressure of the fluid, we can focus on linking these quantities with the rest of the cosmological variables i.e. the scale factor $a(t)$, curvature $k$ and the radius of curvature $R_0$. 

This is done using the *Friedmann equations*, which are derived from Einstein's field equations of General Relativity and is given by: 

#math-box[$ (dot(a)/a)^2 = (8 pi G)/(3 c^2) epsilon - (k c^2)/R_0^2 dot 1/a(t)^2 $<friedmann>]

where $G$ is the gravitational constant, $epsilon$ is the energy density of the fluid, $k$ is the curvature parameter and $R_0$ is the curvature radius of the universe at the present time. 

We will not be going through the relativistic derivation of the Friedmann equations, but we can get an intuitive understanding of the first Friedmann equation by using Newtonian mechanics. 

_I was initially going to write the derivation for the newtonian case, but in the interest of time, I will refer you to Barbara Ryden's "Introduction to Cosmology" chapter 4.2 or you can have a look at David Tong's cosmology notes as well_.

// #theory-box(title: "The Newtonian Friedmann equation")[

//   Consider a homogenous sphere of total mass $M_s$, which is expanding or contracting isotropically, with its radius at time $t$ given by $R_s (t)$.  


// ]

Since we have, $ H(t) = (dot(a)(t))/a(t) $ the Friedmann equation can be re-written as: 

$ H(t)^2 = (8 pi G)/(3 c^2) epsilon - (k c^2)/R_0^2 dot 1/a(t)^2 $

// At the present, i.e. at $t = t_0$: $ H(t_0) = H_0 "   " a(t_0) = 1 $ $ => H_0^2 = (8 pi G)/(3 c^2) epsilon - (k c^2)/R_0^2 $

For a spatially flat universe ($k = 0$), @friedmann takes the form: 

$ H(t)^2 = (8 pi G)/(3 c^2) epsilon $

Thus for a given value of $H(t)$ we can define a #hl[*critical energy density*], $epsilon_c$ as the following: 

#math-box[$ epsilon_c = (3 c^2)/(8 pi G) H(t)^2 $<crit-energy-dens> ] 

At any point in time $epsilon(t)$ represents the energy density at time $t$, and can be back calculated from the Friedmann equation to be: 

$ epsilon(t) = (3 c^2)/(8 pi G) H(t)^2 + (3 c^4)/(8 pi G) dot k/(R_0^2 dot a(t)^2) $ 

$ => epsilon(t) = epsilon_c + (3 c^4)/(8 pi G) dot k/(R_0^2 dot a(t)^2) $

So if at any point in time, $epsilon(t) > epsilon_c$, i.e. the energy density is greater than the critical density then we can be sure that $k = +1$ and the curvature is positive. And if the energy density is lower than the critical density, then $k = -1$ and the curvature is negative. 

We further define the dimensionless #hl[*density parameter*], $Omega (t)$, which is defined as: 

$ Omega (t) = (epsilon (t))/(epsilon_c (t)) $

The Friedmann equation can then be re-written in terms of the density parameter as: 

$ H(t)^2 = (8 pi G)/(3 c^2) epsilon_c Omega (t) - (k c^2)/R_0^2 dot 1/a(t)^2 \ \  => H(t)^2 = Omega(t) H(t)^2 - (k c^2)/R_0^2 dot 1/a(t)^2 $ 

#math-box[ $ 1 - Omega (t) = - (k c^2)/(R_0^2 a(t)^2 H(t)^2) $ ]

Since the righ hand side of the above equation can not change sign as time passes, the curvature of the universe is fixed once determined. It can't go from a positive to negative curvature, or vice-versa. 

The current value of $Omega(t = t_0) = Omega_0$ sits between $0.995 < Omega_0 < 1.005$. 

=== Acceleration equation 

The Friedmann equation and fluid equation can be combined into the acceleration equation that tells how the universe speeds up or slows down with time. 

The Friedmann equation, @friedmann, multiplied by $a^2$, takes the form:

$ dot(a)^2 = (8 pi G)/(3 c^2) epsilon a^2 - (k c^2)/R_0^2 $

Taking the time derivative yields:

$ 2 dot(a) dot(dot(a)) = (8 pi G)/(3 c^2) (dot(epsilon) a^2 + 2 epsilon a dot(a)) $

Dividing by $2 dot(a) a$ tells us:

$ dot.double(a)/a = (4 pi G)/(3 c^2) (dot(epsilon) a/dot(a) + 2 epsilon) $

Using the fluid equation, @continuity, we may make the substitution:

$ dot(epsilon) a/dot(a) = -3(epsilon + P) $

to find the usual form of the acceleration equation:

#math-box[$ dot.double(a)/a = - (4 pi G)/(3 c^2) (epsilon + 3P) $<acceleration-eqn>]

When the energy density is positive, the acceleration is negative, which means the expansion of the universe is slowing down. 

A gas made up of normal baryonic matter/photons/neutrinos/WIMPs will all have a positive pressure which, again, would cause the expansion to slow down. 

But if there was a component such that: $ epsilon + 3 P < 0 => P < -1/3 epsilon $ 

then the acceleration would be positive and the expansion of the universe would speed up. This is the case for dark energy, which has a negative pressure and is causing the expansion of the universe to accelerate. This actually relates back to our equation of state discussion where this is equivalent to having $w < -1 slash 3$. 


=== The Cosmological constant 

Einstein introduced the constant, $Lambda$, as a way to counter-act the gravitational attraction of matter and keep the universe static. Adding this to the Friedmann equation, we get: 

$ H(t)^2 = (8 pi G)/(3 c^2) epsilon - (k c^2)/(R_0^2 a^2) + (Lambda)/3 $

and the acceleration equation becomes:

$ dot.double(a)/a = - (4 pi G)/(3 c^2) (epsilon + 3P) + (Lambda)/3 $ 

while the continuity equation remains unchanged. 

The introduction of $Lambda$ is equivalent to introducing a new component of the universe. And say this constant does not change with time, then the energy density of this component, given by: $ epsilon_Lambda = (c^2)/(8 pi G) Lambda $ and the pressure, given by: $ P_(Lambda) = - (c^2)/(8 pi G) Lambda = - epsilon_Lambda $ also do not change with time. 

#hl[Thus the cosmological constant can be thought of as a perfect fluid with an equation of state: $w = -1$ and a constant energy density.]

The leading physical explanation for the cosmological constant is that it is the energy of the vacuum, which is a consequence of quantum field theory. The vacuum is not empty, but rather has a non-zero energy density due to quantum fluctuations. This energy density is constant and does not change with time, which is consistent with the properties of the cosmological constant.

But the value of the cosmological constant predicted by quantum field theory is much larger than the observed value, which is known as the "cosmological constant problem".



== Model Universe

The actual universe is a composite of different components, each with its own equation of state and energy density. The total energy density of the universe is the sum of the energy densities of all its components: 

$ epsilon = sum_i epsilon_i $

where $epsilon_i$ is the energy density of the $i$-th component. Similarly, thanks to the linearity of the equation of state, the total pressure is the sum of the pressures of all its components:

$ P = sum_i P_i = sum_i w_i epsilon_i $

where $w_i$ is the equation of state parameter for the $i$-th component.

#hl[Thanks to the linearity, each component of the universe evolves independently according to its own equation of state. But that is only true when the components do not interact with each other.] If there are interactions between the components, then the evolution of each component will be affected by the others.

=== Evolution of the energy density

Consider a component, $i$, with an equation of state parameter $w_i$. The continuity equation, @continuity, can be written as: 

$ dot(epsilon)_i + 3H (epsilon_i + P_i) = 0 
\ \ => dot(epsilon)_i + 3H (1 + w_i) epsilon_i = 0 $


which can be rearranged to give:

$ (dif epsilon_i)/epsilon_i = -3 (1 + w_i) (dif a)/a  $

If $w_i$ is a constant, we can integrate this and obtain: 

#math-box[$ epsilon_i = epsilon_(i,0) a^(-3(1 + w_i)) $<energy-density-evolution>]

where $epsilon_(i,0)$ is the energy density of the $i$-th component at the present time.

We know that for non-relativistic matter, $w = 0$, so its energy density evolves as:

$ epsilon_m = epsilon_(m,0) a^(-3) $

and for radiation/relativistic matter, $w = 1/3$, so its energy density evolves as:

$ epsilon_r = epsilon_(r,0) a^(-4) $


#theory-box(title: "Why Radiation Has a Different Evolution")[
  
  The extra factor of $a^(-1)$ in the radiation energy density comes from the fact that the energy of each photon is redshifted as the universe expands. 

  To see exactly how that happens, consider the following. 

  The energy of each particle is given by: $ E^2 = p^2 c^2 + m^2 c^4 $ and for non-relativistic matter, $p << m c$, so $E approx m c^2$ and the energy of each particle is constant. But for relativistic matter, $p >> m c$ (and in the case of radiation, $m = 0$), so $E approx p c$.

  Now, note that the number density for particles, be it non-relativistic or relativistic, evolves as $n prop a^(-3)$, since the number of particles is conserved and the volume of the universe increases as $a^3$. 

  For non-relativistic matter, the energy density is given by $epsilon_m = n m c^2$, so $epsilon_m prop a^(-3)$.

  However for relativistic matter and radiation, the energy density is given by $epsilon_r = n E prop p a^(-3) $. But since $p = h c slash lambda$, where $lambda$ is the wavelength of the particle. Now as space expands, the wavelength of the particle is stretched, so $lambda prop a$, which means $p prop 1/a$. Thus we get $epsilon_r prop 1/a a^(-3) = a^(-4)$.

  Thats the physical reasoning behind why radiation has an extra factor of $a^(-1)$ in its energy density evolution compared to non-relativistic matter.

]

But we can't take the evolution of energy density for the radiation to heart, because we are still working with the assumption that no radiation is being created or destroyed, which is completely false. 

But it turns out #hl[the energy density of radiation is still dominated by the photons of the CMB], which are relics from the early universe and have been redshifted to microwave frequencies. The contributin to the radiation energy density by starlight is only about 10% of that of the contribution by CMB photons. #hl[So we can still use the evolution of the energy density of radiation as a good approximation for the evolution of the energy density of the universe. ]

In addition to the CMB, there's also the cosmic neutrino background, which formed even before the CMB, and is also a relic from the early universe. We use the same evolution for the energy density of neutrinos as we do for radiation, since they are relativistic particles (their mass is negligible). Some values for the density parameters of the different components of radiation are given below: 

$ Omega_("starlight", 0) approx 0.1 times Omega_("CMB", 0) \ \ Omega_("neutrinos", 0) approx 0.6 times Omega_("CMB", 0) \ \ Omega_("CMB", 0) approx 5.35 times 10^(-5) $

So the total density parameter for radiation is given by: 

$ Omega_("radiation", 0) = Omega_("starlight", 0) + Omega_("neutrinos", 0) + Omega_("CMB", 0) approx 9 times 10^(-5) $

The density parameter for the non-relativistic matter is given by: 

$ Omega_("matter", 0) approx 0.31 $

For a flat-universe, we then have: $ Omega_(Lambda, 0) + Omega_("matter", 0) + Omega_("radiation", 0) = 1 => Omega_(Lambda, 0) approx 0.69 $

#theory-box[
  The component with the largest $w$ would be the most dominant in the early universe i.e. when $a -> 0$.

  By this logic, the universe would have been dominated by radiation in the early universe, then by non-relativistic matter and finally by dark energy at the current time. This also means that at points in the past there would exist an equality between the energy densities of the different components. First came the matter-radiation equality and then came the matter-dark energy equality. 

  Further in a continuously expanding universe, a unique value of $a$ can be assigned to a unique value of $t$. And since there exists a direct relation between the scale factor and the redshift, we can also assign a unique value of $z$ to a unique value of $t$. Often this is the case where we speak about the past in terms of redshifts. 

  For example, we say that the matter-lambda equality happened at a redshift of $z_(m Lambda) approx 0.31 $ 
]

=== An Empty Universe

Consider the case when the universe is empty, i.e. $epsilon = 0$. The Friedmann equation, @friedmann, reduces to: 

$ dot(a)^2 = - (k c^2)/(R_0^2) $<empty-friedmann>

This leaves us with three option, each one corresponding to the three values $k$ can take:  

- *$k = 0$* : By setting this, we get a flat empty universe and additionally from  @empty-friedmann, we get $dot(a) = 0$, which means the scale factor is constant and the universe is static. This means that the universe does not expand or contract, the most ideal place for special relativity to hold!

- *$k = +1$* : This case is not possible! Since it would require $dot(a)^2$ to be negative, and thus the scale factor would be imaginary, which is not physically possible. 

- *$k = -1$* : We get a negatively curved empty universe in this case which is much more interesting to study and we will focus on this case for the rest of this section. 

By setting $k = -1$, the @empty-friedmann boils down to: 

$ dot(a)(t) = plus.minus c/R_0 \ \ => dif a = plus.minus c/R_0 dif t  $

#hl[The positive sign here corresponds to an expanding universe, while the negative sign corresponds to a contracting universe.] Integrating the above equation, we get: 

$ a(t) = plus.minus c/R_0 dot t $

we set $t_0 = plus.minus R_0 slash c$ to get the relation between the scale factor and time as: $ a(t) = t/t_0 "       " dot(a)(t) = 1/t_0 $


From this we can get the Hubble parameter, 

$ H(t) = dot(a)/a = 1/t $

$ t = H^(-1) (t) => t_0 = H_0^(-1)  $

\

#figure(image("images/scale-factor-model-universe.png", width: 60%), caption: [Scale factor versus $H_0$ times the time difference from the current time, for different types of model universes (empty, only matter/radiation/dark energy)])<scale-factor-model-universe.png>

Suppose you are an observer in this universe, and you observe a galaxy having some cosmological redshift $z$. You observe the galaxy at time $t_0$ and the light from the galaxy was emitted at time $t_e$. Then the formula for the redshift gives us: 

$ 1 + z = a(t_0)/a(t_e) = 1/a(t_e) = t_0/t_e $

From here its easy to calculate the time of emission of the light from the galaxy as: $ t_e = t_0/(1 + z) = (H_0^(-1))/(1 + z) $

Similarly, say the galaxy is at some comoving distance $r$, then the light from the galaxy travels along a null geodesic, which means $dif s^2 = 0$. The FLRW metric reduces to:

$ dif s^2 = c^2 dif t^2 - a(t)^2 dif r^2 = 0 => dif r = c/a(t) dif t $

Integrating this, we get: 

$ integral_0^r dif r = integral_(t_e)^t_0 c/a(t) dif t => r = c dot integral_(t_e)^t_0 1/a(t) dif t $

Since $a(t) = t slash t_0$, we can substitute this into the above integral to get: 

$ r = c dot integral_(t_e)^t_0 t_0/t dif t = c t_0 ln (t_0/t_e) $

Now, the proper distance to the galaxy at the time of observation is given by: $ d_"proper" (t_0) = a(t_0) r = r = c t_0 ln (t_0/t_e) $ 

$ => d_"proper" (t_0) = c/H_0 ln (1 + z) $

However, the proper distance to the galaxy at the time of emission is given by: $ d_"proper" (t_e) = a(t_e) r = t_e/t_0 dot c t_0 ln (t_0/t_e) = c t_e ln (t_0/t_e) $

$ => d_"proper" (t_e) = c/H_0 dot (ln (1 + z))/(1 + z) $<emission-proper-distance-empty-universe>
\

#figure(image("images/proper-distance-model-universe.png", width: 90%), caption: [Proper distance (measured in units of $c slash H_0$) to the galaxy at the time of emission (right) and observation (left) versus the observed redshift for different model universes.  ])<proper-distance-model-universe.png>

#theory-box(title:"Infinite observation distance?")[
  Notice that we have a maximum for the proper distance at the time of emission, but not for the proper distance at the time of observation. This seems counter-intuitive, but it makes sense when you notice that eventhough our observation distance might be larger than $c/H_0$ (which is the distance light can travel in the age of the universe), the light from that galaxy was emitted when it was much closer to us, and then the expansion of the universe carried it away to a much larger distance. 

  But we have a maximum emission distance, as evident from the right side plot of @proper-distance-model-universe.png. From @emission-proper-distance-empty-universe, we see the maximum proper distance at the time of emission occurs when $z = e - 1 approx 1.718$ and is given by: 

  $ d_"proper, max" (t_e) = 1/e dot c/H_0 approx 0.37 dot c slash H_0 $

  ]


=== Single Component Universe 

In the previous scenario we set the energy density to zero, effectively creating an empty universe. But on the flip side, we can consider setting the curvature to zero, effectively creating a flat universe, and study its evolution when it is dominated by a single component. 

In such a universe, the Friedmann equation, @friedmann, reduces to (upon substitution of the energy density evolution, @energy-density-evolution): 

$ H^2 = (8 pi G epsilon)/(3 c^2)  => dot(a)^2 = (8 pi G epsilon_0)/(3 c^2) a^(-(1+3 w)) $<friedmann-single-component>

To get the scale factor as a function of time, we can take a guess and assume a power law solution of the form: $ a(t) prop t^n => dot(a) prop t^(n-1) $ and substituting this into the Friedmann equation, we get:

$ (t^(n-1))^2 prop t^(-n(1+3 w)) $

Equating the powers of $t$, we get the value of $n$ in terms of $w$ as:

$ n = 2/(3 + 3w) $

which gives us the scale factor as a function of time as: 

$ a(t) = (t/t_0)^(2/(3 + 3w)) $

where $t_0$ is a constant for normalization, that is set such that $a(t_0) = 1$ (meaning $t_0$ is the age of the universe). We can determine it by substituting the above in @friedmann-single-component. Upon performing this calculation, we get the value of $t_0$:

$ t_0 = 1/(1+w) sqrt(c^2/(6 pi G epsilon_0)) $
  
The Hubble constant then is given as: 

$ H_0 = (dot(a)/a)_(t = t_0) = 2/(3 + 3w) t_0^(-1) $

$ => t_0 = 2/(3 + 3w) H_0^(-1) $

From the above equation, we can see that if $w > -1 slash 3$ then the age of the universe is less than the hubble time, $H_0^(-1)$, and if $w < -1 slash 3$ then the age of the universe is greater than the hubble time.

Since we have the scale factor as a function of time, we can also get the relation for the evolution of the energy density of the universe as a function of time. From @energy-density-evolution, we have: 

$ epsilon(t) = epsilon_0 a(t)^(-3(1+w)) $

$ => epsilon(t) = epsilon_0 (t/t_0)^(-2) $

This is interesting because the evolution of #hl[the energy density of the universe is independent of the component that dominates the universe, i.e. it is independent of the value of] $w$.

We can also get the value of the critical energy density at the present time by using the formula @crit-energy-dens, which gives us: 

$ epsilon_(c, 0) = (3 c^2)/(8 pi G) H_0^2 = c^2/(6 pi (1 + w)^2) t_0^(-2) $

It's also obvious from @friedmann-single-component that, 

$ epsilon_0 = (3 c^2)/(8 pi G) H_0^2 = epsilon_(c, 0) $

This means the critical energy density is equal to the energy density of the universe at the present time, which is also a direct consequence of a flat universe. Substituting this back, we get our final expression for the evolution of the energy density of the universe as a function of time: 

$ epsilon(t) = 1/(6 pi (1 + w)^2) c^2/G t^(- 2) $

Similar to the calculations performed for the empty universe, we can also calculate the proper distance to a galaxy at the time of observation and at the time of emission. I am skipping the calculations here and only quoting the final results, which are: 


$ d_"proper" (t_0) = c/H_0 2/(1+3w) [1 - (1+z)^(-(1+3w) slash 2)] $

From here one thing is obvious that the maximum proper distance one can observe is when $z -> infinity$, which represents the light coming from the beginning of the universe ($t_e -> 0$). This distance is called the *horizon distance* because it represents the farthest we can see from us, and is given by the formula: 

$ d_"horizon" (t_0) = c/H_0 2/(1+3w) $

#theory-box[Note that the horizon distance is only finite when $w > -1 slash 3$. For $w < -1 slash 3$, the formula diverges and the horizon distance is infinite, which means we can see infinitely far into the universe. This is the case for dark energy, which has $w = -1$.]


==== Matter only universe

For a matter dominated universe, we have $w = 0$, which on substituting in the previously derived formulas gives us: 

$ t_0 = 2/(3 H_0) $

$ d_"horizon" (t_0) = (2c)/H_0 $

The relation between the scale factor and time is given by, 

$ a_m (t) = (t/t_0)^(2/3) $

and is illustrated in @scale-factor-model-universe.png. 

The proper distances at the time of observation and emission are given by: 

$ d_"proper" (t_0) = (2c)/H_0 [1 - 1/sqrt(1 + z)]  $

$ d_"proper" (t_e) = (2c)/(H_0(1+z)) [1 - 1/sqrt(1 + z)]  $

both of which are illustrated in @proper-distance-model-universe.png. 



==== Radiation only universe

#theory-box[This case is of special interest to us since our own universe was very much dominated by radiation in its early stages. Thus, at early times – long before the time of radiation–matter equality – the universe was well described by a spatially flat, radiation-only model!]

The age of the universe and the horizon distance for a radiation only universe are given by: 

$ t_0 = 1/(2 H_0) $

$ d_"horizon" (t_0) = (c)/H_0 $

The scale factor as a function of time is given by: 

$ a_r (t) = sqrt(t/t_0) $

which is illustrated in @scale-factor-model-universe.png. 

The proper distances at the time of observation and emission are given by:

$ d_"proper" (t_0) = (c)/H_0 dot z/(1 + z)  $

$ d_"proper" (t_e) = (c)/(H_0) dot z/(1 + z)^2   $

which are also illustrated in @proper-distance-model-universe.png. The proper distance at the time of emission has a maximum at $z = 1$, where the maximum proper distance is given by: $d_"proper, max" (t_e) = 0.25 dot c slash H_0$ 

The energy density evolution of the universe as a function of time is given by: 

$ epsilon_r (t) = 3/(32 pi) c^2/G t^(-2) $

Here we make a conversion of the constants $c$ and $G$ to the Planck units, where: 

$ c = l_p/t_p  "   " G = l_p^5/(t_p^4 E_p) $

where $l_p$ is the Planck length, $t_p$ is the Planck time and $E_p$ is the Planck energy. Substituting these into the above equation, we get: 

$ epsilon_r (t) = 3/(32 pi) E_p/l_p^3 (t/t_p)^(-2) $

Since all the energy density is in the form of radiation, we can also get the temperature of the universe as a function of time by using the Stefan-Boltzmann law, which gives us: 

$ T_r (t) = (45/(32 pi^2))^(1/4) T_p (t/t_p)^(-1/2) $

where $T_p = 1.42 times 10^(32) " K"$ is the planck temperature. And the number density of photons is: 

$ n(t) = (epsilon_r (t))/E_"mean"(t) approx 0.018/(l_p^3) (t/t_p)^(-3/2) $ 

The horizon distance at any point in time is given by: 

$ d_"horizon" (t) = (c)/H(t) = 2 c t $

Based on this, we can calculate the number of photons in the horizon volume at any point in time as: 

$ N(t) = n(t) dot V_"horizon"(t) approx 0.6 (t/t_p)^(3 slash 2) $


#theory-box[Note that the number of photons in the horizon volume increases with time, which means that photons are being created as the universe expands. This is a consequence of the fact that the energy density of radiation decreases with time, which means that the energy of each photon is decreasing with time. Since the total energy in the horizon volume is decreasing with time, the number of photons must increase to compensate for this decrease in energy.]

In this universe as $t -> 0$, we see that the energy density diverges to infinity and the temperature diverges to infinity. But this infinity should not be taken literally. 

This is because we are using classical general relativity to describe the universe, which is not valid at very early times (at Planck scales). At these scales, quantum effects become important and we need a theory of quantum gravity to describe the universe.


=== The Benchmark Model Universe 

This model provides a good approximation to the actual universe we live in, which is a composite of different components. This model was constructed based on observational cosmological data along with the theoretical predictions (for stuff like the $C nu B$). It predicts a spatially flat universe, whose details are given below in @benchmark-model-values.png. 

The horizon distance at the present time is given by:

$ d_"horizon" (t_0) = 3.20 (c)/H_0 = 14 000 "Mpc" = 14 "Gpc" = 45 "Gly" $

which is what we commonly call the size of the observable universe. The age of the universe is given by: 

$ t_0 = 0.995 H_0^(-1) = 13.74 "Gyr" $

#figure(image("images/benchmark-model-values.png", width: 70%), caption: [The density parameters and the radiation/matter/lambda equality scale factors and ages calculated using the benchmark model. For all calculcations a Hubble's constant of $H_0 = 68 " km s"^(-1) "Mpc"^(-1)$])<benchmark-model-values.png>


#figure(image("images/scale-factor-vs-time-benchmark-model.png", width: 70%), caption: [Scale factor v/s time for the benchmark model, with the two equality points indicated])<scale-factor-vs-time-benchmark-model.png>

#pagebreak()

= QFT and the Standard Model 

We work in the units where $c = planck = 1$, which means that we measure time and distance in units of energy.

== Lorentz Invariance 

Under a 2D rotation, we have the following coordinate transformation: 

$ x -> x' = x cos theta + y sin theta  \ y -> y' = - x sin theta + y cos theta $

which can be written in matrix form as: 

$ mat(x'; y') = mat(cos theta, sin theta; -sin theta, cos theta) mat(x; y) $

or as: 

$ bold(x'_i) = R_i^j bold(x)_j $ 

where $R_i^j$ is the rotation matrix and $bold(x_i) = mat(x; y)$. Here we have followed the Einstein summation convention, where repeated indices are summed over: 

$ R_i^j bold(x_j) = R_i^1 x_1 + R_i^2 x_2 = R_i^1 x + R_i^2 y $

For the row vector, $bold(x^j)$, we have: 

$ bold(x)^j = bold(x)^i (R^T)^j_i $

Note that, $R^T = R^{-1}$, i.e. the transpose of the rotation matrix is equal to its inverse. Which means, 

#math-box[$ R^T R = I $]

#hl[This property of the rotation matrix is called orthogonality, and this along with the fact that the determinant of the rotation matrix is 1,
can be used as the definition of a rotation matrix.]

The group of all 2D rotations is called the special orthogonal group, denoted as $"SO"(2)$. The "special" in the name refers to the fact that the determinant of the rotation matrix is 1, which means that it preserves orientation, and the 2 in the name refers to the fact that it is a 2D rotation. So the group of all 3D rotations is called $"SO"(3)$. 

\ 

When we contract the row and column vectors, we get the following invariant quantity:

$ bold(x)^i bold(x)_i = (x)^2 + (y)^2 $

This invariant quantity, also known as the "norm" of the vector, is preserved under rotations, which means that the length of the vector is preserved under rotations. 

$ => bold(x')^i bold(x')_i = bold(x)^i bold(x)_i = (x)^2 + (y)^2 $

Another way to define the rotation matrix is to say that it is a linear transformation that preserves the norm of the vector: $bold(x)^i bold(x)_i = delta_(i j) x^i x^j$

#hl[Lorentz transformations work in a similar way, but they preserve the Minkowski norm of a 4-vector, which is given by:] 

$ x^mu x_mu =  (t)^2 - (x)^2 - (y)^2 - (z)^2 $ 

Lorentz transformations, denoted by $Lambda$, are 4x4 matrices that act on 4-vectors and they satisfy the following condition: 

#math-box[$ Lambda^T g Lambda = g_(mu nu) = mat(1, , , ; , -1 , , ; , , -1 ; , , , -1 ) $]

where $g$ is the Minkowski metric. Sometimes we also write the Minkowski metric as $eta$. 

Thus, we can define the Minkowski norm of a 4-vector as: $ x^mu x_mu = g_(mu nu) x^mu x^nu = (t)^2 - (x)^2 - (y)^2 - (z)^2 $

A general Lorentz transformation can be written as a combination of a rotation and a boost. A boost is a transformation that changes the velocity of the reference frame, while a rotation is a transformation that changes the orientation of the reference frame. 

A rotation in the x, y and z axes can be represented by the following matrices: 

$ 
  
  mat( 1, , , ;
    , 1, , ;
    , , cos theta_x, sin theta_x;
    , , -sin theta_x, cos theta_x ),

  mat( 1, , , ;
    , cos theta_y, , -sin theta_y;
    , , 1, ;
    , sin theta_y, , cos theta_y ),

  mat( 1, , , ;
    , cos theta_z, sin theta_z, ;
    , -sin theta_z, cos theta_z, ;
    , , , 1 )
$

and boosts in the $x$, $y$ or $z$ direction:


$ 
  
  mat( cosh beta_x, sinh beta_x, , ;
    sinh beta_x, cosh beta_x, , ;
    , , 1, ;
    , , , 1 ),

  mat( cosh beta_y, , sinh beta_y, ;
    , 1, , ;
    sinh beta_y, , cosh beta_y, ;
    , , , 1 ),

  mat( cosh beta_z, , , sinh beta_z;
    , 1, , ;
    , , 1, ;
    sinh beta_z, , , cosh beta_z )
$

where the $theta_i$ are ordinary angles of rotation around the $i$-th axis with $0 <= theta_i < 2 pi$ and the $beta_i$ are hyperbolic angles, called "rapidity" with $- infinity < beta_i < infinity$.

#theory-box[Note that these matrices do not commute, which means the order in which we apply the rotation and boost matrices matters.]

The rapidities are related to the velocity of the reference frame by the following relation: 

$ cosh beta_i = 1/sqrt(1 - v_i^2) "   " sinh beta_i = v_i/sqrt(1 - v_i^2) $

For small velocities, $beta_i approx v_i$



== Scalars, Vectors and Tensors

#hl[Scalars or scalar-fields] are quantities that are invariant under Lorentz transformations. They have no direction and are described by a single number. Examples of scalars include temperature, mass, and charge. 

#hl[4-Vectors or a vector field], are quantities that have both magnitude and direction in spacetime. They transform under Lorentz transformations according to the rules of special relativity: 

$ V^mu = Lambda^mu _nu V^nu $ 

#theory-box(title: "Some important 4-vectors")[
  
  - The 4-position vector: $ x^mu = (t, x, y, z) $
  - The 4-velocity vector: $ u^mu = (gamma, gamma v_x, gamma v_y, gamma v_z) $ where $gamma = 1/sqrt(1 - v^2)$
  - The 4-momentum vector: $ p^mu = (E, p_x, p_y, p_z) $ where $E$ is the energy and $p_i$ are the components of the momentum.

  - The 4-gradient vector: $ partial_mu = partial/(partial x^mu) = (partial_t, partial_x, partial_y, partial_z) $ where $partial_i$ are the components of the gradient operator.

]

#hl[Tensors] are quantities that have multiple components. 

Just like the contraction of a 4-vector with itself gives a Lorentz invariant quantity, the contraction of two 4-vectors is given by: 

$ V^mu W_mu = V^mu g_(mu nu) W^nu = V^0 W^0 - V^1 W^1 - V^2 W^2 - V^3 W^3 $

Such a contraction is also a Lorentz invariant quantity. So under a Lorentz transformation, we have: 

$ V^mu W_mu = V^mu g_(mu nu) W^nu = (V^omega (Lambda^T)_omega^mu) g_(mu nu) (Lambda_sigma^nu W^sigma) = V^omega [(Lambda^T)_omega^mu g_(mu nu) Lambda_sigma^nu] W^sigma = V^omega g_(omega sigma) W^sigma  \ \ => V^mu W_mu = V^omega W_omega $

We define the #hl[d'Alembertian operator] as: $ square = partial_mu^2 = partial^mu partial_mu = partial_t^2 - partial_x^2 - partial_y^2 - partial_z^2 $

and the laplacian operator as: $ triangle = arrow(nabla)^2 = partial_x^2 + partial_y^2 + partial_z^2 $ 

We say that a vector is a #hl[contravariant vector] if it transforms as $V^mu = Lambda^mu _nu V^nu$ and a vector is a #hl[covariant vector] if it transforms as $V_mu = (Lambda^T)_mu ^nu V_nu$. 

A 4-vector is said to be #hl[time-like] if $V^mu V_mu > 0$, #hl[space-like] if $V^mu V_mu < 0$ and #hl[light-like] if $V^mu V_mu = 0$. 















#pagebreak()

= Introduction 

The present cosmological DM density averaged over the whole universe is: 

$ Omega_"DM" h^2 = 0.12 plus.minus 0.0012 $ 

where $Omega_"DM"$ is defined as density of DM relative to the critical density, $rho_c$: $ Omega_"DM" = rho_"DM"/rho_c "  where  " rho_c = (3H^2)/(8 pi G) $

and $h$ is representative of the Hubble Parameter, whose relation is as follows: $ H_0 = h times 100 " km s"^(-1) "Mpc"^(-1) => h = 0.674 plus.minus 0.005 $


Dark Matter can be described using the following terms: _cold, non-interacting, stable matter_ with _adiabatic_ inhomogeneities: 

+ *Matter*: DM behaves as matter in the cosmological evolution: its density decreases as the volume of the universe increases. This is in contrast to dark energy whose density has no change with the expansion of the universe. 

+ *Cold*: DM behaves as a non-relativistic fluid at the time of matter-radiation equality, when structure formation begins. DM 'particles' move slowly and because they move slowly they attract each other together and cluster. The process of clustering does re-heat the DM fluid, since its constituents gain kinetic energy after collapsing into bound structures. 

+ *Non-interacting: * The interactions of DM with itself or with ordinary matter is negligible and is ignored. This does not however mean that there are no interactions, in fact models describing the production of DM in the early universe require non-zero interactions. Further DM searches rely on these interactions. But it is miniscule in the scale of astrophysical considerations 

+ *dissipation-less*: DM can not easily dissipate its energy by emitting electromagnetic radiation, unlike regular matter. Although this clause is a bit excused for some models 

+ *stable: * DM has existed for a long time ever since the early stages of the universe, showing it doesnt decay easily and is quite stable. 

+ *adiabatic: * on cosmological scales, the composition of the cosmological fluid is the same everywhere. DM has the same primordial density inhomogeneity as the other components: DM is denser where ordinary matter and photons are denser. This happens if all the inhomogeneities have been generated by a single mechanism. The mechanism is believed to be quantum fluctuations of a single inflaton field during cosmological inflation.


== Evidences for Dark Matter

=== Rotating Galaxies 

The velocities of different stars on a galaxy can be measured by looking at the doppler shifts in their spectrum. This allows us to get good velocity estimates at different locations on a galactic plane. 

From Newton's laws, the centripetal acceleration at any point must be equal to the gravitational acceleration: 

$ v^2/r = G M(r)/r^2 => v = sqrt(G M(r) / r) $

where $M(r)$ is the mass within a radius of r and $v$ is the circular velocity at that point $r$. For large enough $r$, the mass roughly remains constant with change in $r$ since most of it is concentrated at the center, so as you move farther and farther away the change in mass is lesser and lesser. So effectively we can replace $M(r)$ with a constant $M$, the mass of the galaxy. 

If $M$ is also constant now, then $ v prop r^(-1 slash 2) "   at large r" $

But observations show that at large r, the v(r) remains almost flat, contradicting the predictions. 

This flatness can be explained if we consider a spherically symmetric mass halo surrounding the galaxy with a density: 

$ epsilon (r) prop 1/r^2 $<2>
$ => M (r) prop epsilon (r) dot V(r) => M(r) prop r^(-2) dot r^3 prop r $

Since $M(r) prop r $, it cancels out the r in the denominator and we get $v(r)$ to be a constant. 

At even larger r, the halo is expected to die off, and so the previous $r^(-1 slash 2)$ depends of v should return again, but typically at these distances its very hard to find tracers to observationally verify this. 


#theory-box(title: "Mass to light ratio")[
  Its the ratio of the invisible to visible mass in a galaxy. For typical galaxies like the milky way and andromeda, this ratio is on the order of 10. 
]




=== Other Galactic evidences

The DM content in dwarf galaxies are predicted to be much higher in proportion. The mass-to-light ratio for these galaxies are on the order of 100, when its 10 for regular spirals for andromeda or milky way. 


Another way to determine the existence of the DM halo is using the lensing effect. Say there is a background galaxy at a distance $d_"source"$ from us and a lens in the line of sight of that galaxy and us, at a distance of $d_"lens"$ with mass $M_"lens"$. Then from GR calculations, the deviation of the light trajectory is given by: 

$ delta theta = 4 G M_"lens" / b $

where $b$ is the impact parameter. If the source and the lens lie on the exact same line of sight, then it is possible to observe an einstein ring or an arc with angular size: 

$ theta_E = sqrt(4 G M_"lens" (1/d_"lens" - 1/d_"source")) $

and if they are not in the same LoS, then there will be multiple images of the source galaxy observed. 

This type of lensing is known as *strong lensing*, when we can observe an einstein arc or ring or multiple images. But for this to happen the conditions need to be just right and its difficult to observe this in nature. On the flip side, we define *weak lensing* when there isnt a clear sign as before but there are distortions to the image of the source galaxy. This can be studied to understand the DM structure in the lensing galaxies. 


#figure(image("images/velocity-distribution-curve.png", width: 70%), caption: [Velocity distribution curve along with the different components of the galaxy])<velocity-distribution-curve.png>

// #figure(image("velocity distribution cuve.png", width: 70%), caption: [])

== Galaxy Clusters


Clusters of galaxies are a good representation of the average universe since they are massive in scales containing thousands of galaxies, and they are the largest gravitationally bound structures in the universe. 

One such cluster, the Coma cluster, was studied by Zwicky in the early 20th century. For his analysis, he considered the virial theorem, which relates the average kinetic energy of a system to the average gravitational potential energy: 

$ chevron.l K chevron.r = -1/2  chevron.l V chevron.r $ 

In a toy system of $N >> 1$ particles, each of mass $m$ at an equal distance $r$ interacting through gravity. We can estimate the total mass $m N$ from the velocity $v$ and size $R$: 

$ N m (v^2)/2 = 1/2 (G(N m)^2)/(2R) => N m = (2 R v^2)/G  $

Another way to estimate the mass (and thus the "invisible" DM mass) from a galaxy cluster based on observed X-ray observations. One can write down an equation relating the gradient of the gas pressure to the gradient of the gravitational potential, from which we can get an estimate for the mass of the cluster. 

#figure(image("images/xray-mass-recon.png", width: 70%), caption: [Bullet Cluster observations: A pair of galaxies that collided is shown here where the colors correspond to the intensity of X-rays and the contours show the estimated mass distribution obtained from weak lensing])<bullet>




Consider the case of the bullet cluster. It was formed 150 Myr ago when two clusters of galaxies collided with each other. The normal visible matter underwent interactions due to collisions and so the hot gas sent shockwaves which resulted in X-ray production, that we can track. However, the DM halos surrounding the two initial clusters did did not interact with each other and rather just flew past  (or through) each other. 

This is obvious when we look at the distribution of the visible matter (probed using the X-ray spectrum) and the dark matter as shown in @bullet. We can see a clear displacement of the DM density from the visible matter further supporting our theory. Using this (and many more observations that followed this), we can actually set limits on the upper bound of DM-DM interactions. 



#theory-box(title: "Cosmic Shears")[
Another way to estimate the dark matter density comes from cosmic shears. These are pheneomena when the light from a very distant galaxy is deflected due to the gravitational effects of foreground mass clumps. These mass clumps are unlike the DM halo that we saw before, and more like giant diffuse filaments and loose structures. 

This effect is even more prominent in the case of the CMB, which is termed *CMB Lensing*. This is when large scale DM structures distort the CMB background and is a major contribution to the noise when analyzing the CMB. This is the ultimate application of weak lensing to DM observation. 
]



== The entire universe (from cosmological effects)

The best evidence for the existence of dark matter comes from us predicting the evolution of the universe based on cosmological models. Without DM our universe wouldn't look the way it did. 

To understand how that comes about, we need to understand how different components evolve with the expansion of the universe. This is determined by the equation of state (@EOS) of the different components and the continuity equation (@continuity), which we have derived before 


#theory-box(title: "Evolution of the universe and the scale factor")[


Substituting the equation of state, $P = w epsilon$, into the continuity equation, $dot(epsilon) + 3H (epsilon + P) = 0$ , we get:

$ dot(epsilon) + 3H (epsilon + w epsilon) = 0 $

Factoring out $epsilon$, we obtain:

$ dot(epsilon) + 3H (1 + w) epsilon = 0 $

Rewriting, we get: 

$ (dot(epsilon))/epsilon = -3 (1 + w) H = - 3 (1 + w) (dot(a))/a  $

Integrating both sides, we get: 

$ log (epsilon/epsilon_0) = -3 (1 + w) log(a) $

$ => epsilon (t) = epsilon_0 a^(-3(1 + w)) $

where $epsilon_0 = epsilon(t_0)$ is the present day energy density of the fluid.

For different values of $w$, we get different evolutions of the energy density with the expansion of the universe:

- *radiation* or *relativistic matter*: $w = 1/3$ $ => epsilon (t) prop 1/a^(4) $
- *non-relativistic matter*: $w = 0$ $ => epsilon (t) prop 1/a^(3) $
- *dark energy*: $w = -1$ $ => epsilon (t) = epsilon_0 a^(0) = epsilon_0 $

]

As we saw before, the energy density of different components of the universe evolve differently with the expansion of the universe. As the universe expands, the energy density of radiation decreases faster than that of matter, and the energy density of matter decreases faster than that of dark energy. #hl[This means in the early early universe (when $a << 1$), the universe was dominated by radiation and relativistic matter (like neutrinos)]. In this period the universe was almost homogeneous and opaque to photons. 

At later stages, as the universe expands and cools down, #hl[the energy density of non-relativistic matter becomes dominant over that of radiation]. This takes place at a time of approximately 50,000 years after the big bang, when the scale factor was $a_(e q) approx 1 slash 3400$. Later at around $t approx 380 "kyr"$ and $a approx 1 slash 1100$, the universe cooled down enough for the electrons and protons to combine to form neutral hydrogen, making the #hl[universe transparent to photons. This is when the CMB was created.] 

That brings us to the present day ($a = 1$), where the universe is dominated by dark energy, which does not dilute with the expansion of the universe. This is why the expansion of the universe is accelerating, since the energy density of dark energy remains constant while that of matter and radiation decreases, making it more and more dominant as time goes on. 

=== Large Scale Structures

#hl[All large-scale structures in the universe arose from small initial density perturbations in the early universe.] 

We can get an understanding of how much structures exist at different scales by looking at the *matter power spectrum*. 

To plot this, we need to define the *density contrast* $ delta (bold(r)) = (epsilon(bold(r)) - overline(epsilon))/overline(epsilon) $ where $epsilon(bold(r))$ is the energy density at a point and $overline(epsilon)$ is the average energy density of the universe. The density contrast essentially gives us a measure of how much the density at a point deviates from the average density, a positive value means at $bold(r)$ there is an over-density, a negative value means there is an under-density, and a value of zero means the density is exactly the average density. 

But instead of looking at the density contrast in real space, we can look at it in Fourier space. This lets us look at the density contrast at different scales themselves instead of looking at the density contrast at different points in space. This can be done by expanding the real-space density contrast in Fourier modes: 

$ delta (bold(r)) = sum_bold(k) delta_bold(k) e^(i bold(k) dot bold(r)) $

where a mode with a small wavenumber $bold(k)$ corresponds to a large scale, and a mode with a large wavenumber $bold(k)$ corresponds to a small scale. So a high power spectrum at small $k$ means there are a lot of large scale structures, and a high power spectrum at large $k$ means there are a lot of small scale structures. 

#figure(image("images/matter-power-spectrum.png", width: 70%), caption: [Matter Power Spectrum. Small scales correspond to high wavenumbers, large scales correspond to low wavenumbers.])<matter-power-spectrum.png>

From @matter-power-spectrum.png, we can see that the power spectrum is dominated by small scales and there is a steep drop at large scales, which tells us that the universe is dominated by large-scale to medium-scale structures. The question then becomes, #hl[how could the tiny primordial inhomogeneities grow from such small amplitudes to the large contrasts that we observe today?] 




















