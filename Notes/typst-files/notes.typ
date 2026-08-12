// 1. Import your custom functions from the template file
#import "template.typ": research-notes, hl, theory-box, math-box, ket, bra, difp, hbar, chapter

// 2. Apply the template
#show: research-notes.with(
  title: "Dark Matter Notes",
  author: "T.Y. Booritth Balaji",
  affiliation: "Indian Institute of Science",
  // supervisor: "Prof. Ranjan Laha"
)

#chapter("Prerequisite Theory")

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

and finally for dark energy, $w = -1$, so its energy density remains constant:

$ epsilon_Lambda = epsilon_(Lambda,0) $

which is consistent with the fact that the energy density of the vacuum does not change with time.


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



==== Radiation only universe<radiation-only-universe>

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
== Big Bang Nucleosynthesis

The big bang introduced the universe to a very hot and dense state, filled with a bunch of different particles. #hl[All these particles were in thermal equilibrium with each other, which means that they were constantly interacting with each other and exchanging energy]. As the universe expanded and cooled, the soup of particles cooled down and interactions between the particles slowed down. 

#hl[Roughly $~1$ second after the big bang, the particle soup only composed of photons, neutrinos, anti-neutrinos, electrons, positrons, protons and neutrons]. The interactions of these particles and their dynamical evolution governed by the expansion of the universe, led to the formation of light nuclei, which is what we call big bang nucleosynthesis. 

#theory-box(title: "Coupling")[
  Two particles are said to be coupled to each other if they are interacting with each other at a rate that is faster than the expansion of the universe. This means that the interaction rate, $Gamma$, is greater than the Hubble parameter, $H$. 

  $ Gamma > H $

  In this scenario, the particles are constantly interacting with each other and exchanging energy, which brings them to a thermal equilibrium where all the particles roughly have the same temperature/energy. 

  If the interaction rate is slower than the expansion of the universe, then the particles are said to be decoupled from each other. This means that the particles are no longer interacting with each other and are free to evolve independently. 

  $ Gamma < H $

  This means that the particles are no longer in thermal equilibrium with each other and can have different temperatures/energies. It also means that the particle's dynamics are governed more by the expansion of the universe than by their interactions with each other, in a way making them "independent" of each other. 

  The time at which two particles decouple from each other is called the decoupling time, $t_"dec"$. This is the time at which the interaction rate becomes equal to the Hubble parameter. 

  $ Gamma(t_"dec") = H(t_"dec") $

  #hl[And this process of decoupling is also called "freeze-out", because the particles are "frozen" in their state at the time of decoupling and are no longer able to interact with each other.]
]
\
=== Neutrons and Protons 

At about $t = 0.1$ seconds after the big bang, all the particles were still very much coupled to each other. This allows neutrons and protons to freely interconvert into each other through the weak interactions: 

$ n + nu_e <-> p + e^- 
\ n + e^+ <-> p + dash(nu)_e
\ n <-> p + e^- + dash(nu)_e $

At thermal and kinetic equilibrium, the ratio of the number densities of protons ($n_p$) and neutrons ($n_n$) is given by: 

$ n_n/n_p = (m_n/m_p)^(3/2) exp(-((m_n - m_p)c^2)/(k_B T)) $

where $m_n$ and $m_p$ are the masses of the neutron and proton respectively, $k_B$ is the Boltzmann constant and $T$ is the temperature of the universe. (The derivation can be found here @rydenIntroductionCosmology2017) 

We approximate the mass ratio as $m_n slash m_p approx 1$, and we define: $(m_n - m_p) c^2 = Q = 1.29$ MeV, giving us: 

$ n_n/n_p = exp(-Q/(k_B T)) = exp(-(1.29 "MeV")/(k_B T)) $

What this equation shows is that at high temperatures (which was the case in the early universe), the ratio of neutrons to protons is roughly 1, meaning that there are roughly equal numbers of neutrons and protons. But as the universe cools down, the ratio of neutrons to protons decreases, meaning that there are fewer neutrons than protons. 

#hl[The equation also suggests that as the temperature keeps lowering, the number of neutrons will keep decreasing (given that the thermal equilibrium is maintained), and eventually there will be no neutrons left]. But this is clearly not the case! 

The reason as to what's missing is hidden behind the need for the neutrons and protons to be in thermal equilibrium with each other. 

They key factor holding up the thermal equilibrium is the weak interaction involving the neutrinos and the nucleons. And as we all know, neutrinos are very weakly interacting particles, which means the interaction rate for the entire interaction depends on the interaction rate of the neutrinos. Thus, the interaction rate for the weak interaction is given by: 

$ Gamma = n_nu sigma v $

where $n_nu$ is the number density of neutrinos, $sigma$ is the cross-section of the interaction and $v$ is the relative velocity of the particles. 

We saw before that in a radiation dominated universe (which it is, again which was discussed in @radiation-only-universe) the relation between the Temperature of the universe and the scale factor/time is given by: 

$ T prop a(t)^(-1) prop t^(-1 slash 2) $

and we also know that the number density and the cross sections have the relationships @rydenIntroductionCosmology2017: 

$ n_nu prop T^3 prop t^(-3 slash 2) "    " sigma prop T^2 prop t^(-1) $

Putting all of it together, we get the interaction rate to be: 

$ Gamma prop t^(-5 slash 2) $

(here we have ignored the relative velocity, $v$, since it is roughly constant and of the order of $c$).

Additionally, the expansion of the universe is governed by the Hubble parameter, which in a radiation dominated universe is given by: 

$ H prop t^(-1) $

Which means that the interaction rate decreases faster than the expansion of the universe, and at some point in time, the interaction rate will become equal to the expansion rate of the universe, and the neutrons and protons will decouple from each other. This is the time when the weak interaction freezes out, and the ratio of neutrons to protons is frozen in at that time. 

The freeze-out temperature, $T_"freeze"$, is experimentally determined to be: 

$ T_"freeze" = 9 times 10^9 "K" "   " => "   "  k_B T_"freeze" = 0.8 "MeV" $

Substituting this back into the equation for the ratio of neutrons to protons, we get: 

#math-box[$ n_n/n_p = exp(-(1.29 "MeV")/(0.8 "MeV")) = 0.20 = 1/5 $]

which tells us that after the decoupling or the freeze-out of the weak interaction, there are 5 protons for every neutron in the universe. 

\
=== Deuterons 

But the stody doesn't end there for the neutrons and protons. Now that neutrons and protons can exist independently without constant interconversion, other reactions can take place. Particularly, the formation of a dueteron, which is a bound state of a proton and a neutron, is of interest to us. The reaction is given by:

$ p + n <-> d + gamma $

where $d$ is the deuteron and $gamma$ is a photon.

This reaction is favoured in the early universe since the other possibilities i.e. a proton-proton or a neutron-neutron bound state are not stable. But the formation of deuterons is not as simple as it seems. 

The deuteron has a binding energy of $B = 2.22$ MeV, which means that a photon with an energy greater than $B$ can break the deuteron back into a proton and a neutron, so effectively there is no net formation of deuterons. And this was the case since the universe was really hot, and the photons had energies greater than $B$. 

So as soon as the universe cooled down to below the binding energy of the deuteron, the formation of deuterons should be favoured, which would have happened even before the freeze-out of the weak interaction! It seems to contradict the events that we have discussed so far, but the reason for this is hidden in the number of photons in the universe. 

The number of photons outnumber the number of baryons in the universe by a factor of approximately $10^9$, which is a loooot of photons. Now as the universe cooled below $2.22$ MeV, the "average" photon energy was less than $2.22$ MeV, but there were still a lot of photons with energies greater than $2.22$ MeV, which could break the deuterons back into protons and neutrons. So eventhough it seems like the formation of deuterons should be favoured, it was not, just because there were too many photons with energies greater than the binding energy of the deuteron. #hl[This is called the "deuterium bottleneck"]. 

Thus the formation of deuterons was not favoured until the universe cooled down to below $0.07$ MeV. 

// #theory-box[
//   The temperature $0.07$ MeV is the temperature at which nuclei (neutrons and protons bound together) starts to become more favourable over free nucleons (neutrons and protons separately). 

//   This temperature is calculated using a general formula which gives us the temperature at which a nucleus with $A$ nucleons and a binding energy of $B_A$ becomes more favourable than free nucleons, which is given by: 

//   $ T_"nuclei" = (B_A slash (A-1))/(ln(eta^(-1)) + 1.5 ln(m_N slash T)) $<Temperature-nuclei>

//   where $eta$ is the baryon-to-photon ratio, $m_N$ is the mass of a nucleon and $T$ is the temperature of the universe. 

//   When we perform this calculation for the deuteron, we get the value of $T_"nuclei" = 0.07$ MeV, which is the temperature at which the formation of deuterons is favoured over free nucleons.

// ]
\
#theory-box[

So recapping the events, we have:

- At $t = 0.1$ seconds, the universe was hot enough for neutrons and protons to interconvert into each other through the weak interaction, and the ratio of neutrons to protons was roughly 1.

- At $t = 1$ second, the temperature reduces to $k_B T = 0.8$ MeV,  the weak interaction froze out, and the ratio of neutrons to protons was frozen in at $n_n slash n_p = 0.20$.

- At $t = 3$ minutes, the universe cooled down to below the binding energy of the deuteron, but the formation of deuterons was not favoured due to the deuterium bottleneck.

- At $t = 5$ minutes, the universe cooled down to below $0.06$ MeV, and the formation of deuterons was finally favoured.

]

Notice from above that there is a time period between the freeze-out of the weak interaction (which happened at $t = 1$ second) and the formation of deuterons (which happened at $t = 5$ minutes). In this time perdiod, the neutrons exist independently as free particles and are not bound to any protons. And since the neutrons are unstable particles, they decay into protons with a half-life of $t_"1/2" = 10.2$ minutes. With this information, we can calculate how much neutrons would have decayed in this time period, and thus how many neutrons would be left to form deuterons. 

The fraction of neutrons that remain after a time $t$ is given by @cookeBigBangNucleosynthesis2024: 

$ n_n (t) ~ exp(-t slash tau) $

where $tau$ is the mean lifetime of the neutron, $tau approx 800 "seconds"$. And so, the fraction of the remaining neutrons would be: 

$ n_n (t) ~ exp(- 300 slash 800) approx 0.7 $

#hl[Which implies that at the beginning of the formation of deuterons, there are only 70% of the neutrons left that were present at the freeze-out of the weak interaction. This means that the ratio of neutrons to protons at the beginning of the formation of deuterons goes down to]: 

$ n_n/n_p = 0.7 dot 0.2 = 0.14 => n_n/n_p approx 1/7 $

Now we are finally ready to form deuterons, so overtime beyond $t = 5$ minutes, the neutrons and protons will combine to form deuterons. 

And all the neutrons will eventually be bound to protons in the form of deuterons or would decay into protons. But the formation of deuterons is not the end of the story, since deuterons can further combine to form helium-3, helium-4 and lithium-7. However this is as far as free neutrons will go in our story. 

\
=== Helium-4 

So, now that our final neutron-to-proton ratio is found to be $n_n slash n_p = 1 slash 7$ and deuteron production has started, we can start to worry about the other nuclear reactions that can take place. 

The most important of this reaction is the formation of helium-4, which is a bound state of 2 protons and 2 neutrons (also known as an alpha particle). There are various reactions that can lead to the formation of helium-4, as discussed in @cookeBigBangNucleosynthesis2024, but we are not going to be discussing those here. 

The important point to discuss here is that the formation of helium-4 opens up more channels for more nucleosynthesis reactions to take place, further forming $"Li"^7$ and $"Be"^7$. But the formation of helium-4 is so favoured because of its high binding energy. 


Now all the neutrons are bound to protons in the form of helium-4, and so the number density of helium-4 is given by:

$ n_"He" = n_n/2 = 1/14 n_p $

(since there are 2 neutrons in each helium-4 nucleus)

And the number density of hydrogen nucleids (which are just formed by the left over protons) is given by: 

$ n_H = n_p - 2 n_"He" = n_p - n_n = 6/7 n_p $

And so, we define primoridal number density of $"He"^4$ to $H^1$ to be: 

$ y_p = n_"He"/n_H = (1 slash 14)/(6 slash 7) = 1/12 = 0.0833 $


The mass fraction of helium-4 is given by: 

#math-box[$ Y_P = (4 n_"He")/(4 n_"He" + n_H) = (4 y_p)/(4 y_p + 1) $]

For $y_p = 0.08$, the mass fraction of helium-4 comes out to be: $Y_P = 0.24$



\
=== Factors affecting the early universe nucleosynthesis 

A multitude of factors affect the nucleosynthesis in the early universe, but out of all of them, the most important one is the *temperature*. In this section, we will see how the temperature affects the nucleosynthesis and discuss the factors that it depends upon. 

As we saw before, the temperature needed for the formation of deuterons is $T_"nuclei" = 0.07$ MeV. The universe must cool below this temperature for the formation of deuterons to be favoured, i.e. $T < T_"nuclei"$

But how is this temperature calculated? It is calculated using a general formula which gives us the temperature at which a nucleus with $A$ nucleons and a binding energy of $B_A$ becomes more favourable than free nucleons, which is given by @turnerUnderstandingBBNPhysics2021: 

$ T_"nuclei" = (B_A slash (A-1))/(ln(eta^(-1)) + 1.5 ln(m_N slash T)) $<Temperature-nuclei>

where $eta$ is the baryon-to-photon ratio, $m_N$ is the mass of a nucleon and $T$ is the temperature of the universe. When we perform this calculation for the deuteron using our universe's baryon-to-photon ratio ($eta = 6.03 times 10^(-10)$), we get: 

$ T_"nuclei" = 0.07 "MeV" $

Which is the temperature at which the formation of deuterons is favoured over free nucleons.


\
But the story doesn't end there since now the deuterons must come together to form helium-4. This process is more complicated since deuterons are all charged particles. Any nucleosynthesis beyond deuterons (including the formation of helium-4) must involve charged particle on charged particle interactions. But these interactions are suppressed by the Coulomb barrier, which is the energy barrier due to the electrostatic repulsion between the positively charged nuclei. 

The particles must have enough kinetic energy to overcome the Coulomb barrier. This minimum threshold energy is represented by the temperature $T_"Coulomb"$ and for the formation of helium-4, it comes out to be: 

$ T_"Coulomb" = (0.03 "MeV")/(1 + ln (eta_(10)) slash 7)  $

where $eta_(10) = eta times 10^(10)$ 

For our universe's baryon-to-photon ratio, this temperature comes out to be: 
$ T_"Coulomb" = 0.023 "MeV" $

Which implies that the universe must stay above this temperature for the formation of helium-4 (and other heavier nuclei) to be favoured. 

Thus, for the formation of helium-4 to be favoured, the temperature of the universe must satisfy the following condition:

$ T_"Coulomb" < T < T_"nuclei" \ \ \ => 0.023 "MeV" < T < 0.07 "MeV" $





#theory-box(title: "Baryon-to-Photon ratio")[

The baryon-to-photon ratio, $eta$, is a dimensionless quantity that represents the ratio of the number density of baryons (protons and neutrons) to the number density of photons in the universe. 

The baryon-to-photon ratio is an important parameter in cosmology since it affects the nucleosynthesis in the early universe. A higher baryon-to-photon ratio means that there are more baryons in the universe, which leads to a higher rate of nucleosynthesis and a higher abundance of helium-4 and vice-versa. 

#hl[The ratio is in fact constant in time, since the number of baryons and photons are both conserved in the universe.] And for our universe, this value is given by: 

$ eta = n_b/n_gamma = 6.03 times 10^(-10) $ 

Which implies that for every single neutron or proton in the universe, there are nearly a billion photons. This is a very large number, and it is the reason why the formation of deuterons was not favoured until the universe cooled down to below $0.07$ MeV, even though the binding energy of the deuteron is $2.22$ MeV. 

The reason why this ratio is constant in time is because the number density of both baryons and photons scale with the scale factor of the universe in the same way, i.e. $n_b prop a(t)^(-3)$ and $n_gamma prop a(t)^(-3)$. Thus, their ratio is constant in time, and the value of this ratio is determined by the conditions in the early universe.

]

We can plot the variation of $T_"Coulomb"$ and $T_"nuclei"$ with the baryon-to-photon ratio, $eta$, as shown below 

#figure(image("images/nuclei-coulomb-temperature-eta-graph.png", width: 90%), caption: [Variation of ])<nuclei-coulomb-temperature-eta-graph.png>












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



== Second Quantization

The simplest example of a quantum field is the free scalar field, which is described by the *Klein-Gordon equation*: 

$ (square + m^2) phi.alt = 0 $<klein-gordon>

where $phi$ is the scalar field and $m$ is the mass of the scalar field.

Now say the mass of this scalar field is zero, then the Klein-Gordon equation reduces to the *wave equation*: 

$ square phi.alt = (partial_t^2 - arrow(nabla)^2 ) phi.alt =  0 $<wave-equation>

We can substitute a plane wave solution such that only the amplitude of the wave is a function of time, and the spatial part is a plane wave: 

$ phi.alt_p = a_p (t) e^(i arrow(p) dot  arrow(x)) $

Substituing this back into the wave equation, we see that the spatial part cancels out and we are left with: 

$ (partial_t^2 + arrow(p)^2 ) a_p (t) = 0 $

Upon expanding this equation, we see: $ dot.double(a)_p (t) = - omega_p^2 a_p (t) $ 

where $omega_p = |arrow(p)|$. This above equation is nothing but the equation of motion for a simple harmonic oscillator, which has the solution: 

$ a_p (t) = a_p e^(plus.minus i omega_p t) $ 

So the final form for $phi.alt_p$ is: 

$ phi.alt_p = a_p e^(plus.minus i omega_p t) e^(i arrow(p) dot  arrow(x)) = a_p e^(plus.minus i p dot x) $

where $p = (omega_p, arrow(p))$ and $x = (t, arrow(x))$ are the 4-momentum and 4-position vectors respectively.

So a general solution for the massless Klein-Gordon equation (wave equation), can be written as a linear combination of the plane wave solutions: 

$ phi.alt = sum_p phi.alt_p $

which when converted into an integral over the momentum space, we get: 

$ phi.alt = integral (dif^3 p)/(2 pi)^3 [a_p e^(i p dot x) + a_p^* e^(- i p dot x)] $

where $a_p$ and $a_p^*$ are the coefficients of the plane wave solutions.


#theory-box[Not only is $square phi.alt = 0$ the simplest Lorentz invariant field equation, but it is one of the equations that free-massless fields will always satisfy. 

To see this, we study the Electromagnetic field next

The Maxwell's equations describing the electromagnetic field, in empty space, can be written as: 

$ partial_mu F^(mu nu) = 0 "    " partial_mu F^(nu rho) + partial_nu F^(rho mu) + partial_rho F^(mu nu) = 0 $

where $F^(mu nu)$ is the electromagnetic field tensor, which is defined as: 

$ F_(mu nu) = mat(0, E_x, E_y, E_z; -E_x, 0, -B_z, B_y; -E_y, B_z, 0, -B_x; -E_z, -B_y, B_x, 0) $

which can also be written in terms of the 4-potential $A^mu = (phi, A_x, A_y, A_z)$ as: 

$ F_(mu nu) = partial_mu A_nu - partial_nu A_mu $

Further, we can choose the Lorentz gauge condition, which fixes the gauge freedom of the electromagnetic field, as $ partial_mu A^mu = 0$. Then in the Lorentz gauge, the Maxwell's equations reduce to: 

$ partial_mu F^(mu nu) = square A^nu - partial_nu (partial_mu A^mu) = square A^mu = 0  $

#hl[Thus we see that each component of the 4-potential satisfies the massless Klein-Gordon equation]

So similar to $phi.alt$ , we can write the general solution for $A^mu$ as: 

$ A^mu = integral (dif^3 p)/(2 pi)^3 [a_p^mu e^(i p dot x) + a_p^(mu^ *) e^(- i p dot x)] $

]

Now since the field is governed by the wave equation, which is essentially the equation of motion for a simple harmonic oscillator, we can quantize the field in the same way we quantize a simple harmonic oscillator. 

We do this by promoting the coefficients $a_p$ and $a_p^*$ to operators, which we call the annihilation and creation operators, for each wave number $arrow(p)$, respectively. 

We can then write the field and the hamiltonian of the field as: 

$ phi.alt_0 (arrow(x)) = integral (dif^3 p)/(2 pi)^3 1/sqrt(2 omega_p) [a_p e^(i arrow(p) dot  arrow(x)) + a_p^dagger e^(- i arrow(p) dot  arrow(x))] $

$ H_0 = integral (dif^3 p)/(2 pi)^3 omega_p (a_p^dagger a_p + 1/2)  $

where the subscript 0 indicates that this is a free field, i.e. there are no interactions with other fields. 


This was the *second quantization* of the scalar field, and this brings with it two important consequences: 

+ We have many quantum mechanical harmonic oscillators, one for each $arrow(p)$, all at the same time. 

+ We interpret the $n$th excitation of the $arrow(p)$ harmonic oscillator as having $n$ particles.

Along with this, we get the commutation relations for the creation and annihilation operators as: 

$ [a_p, a_q^dagger] = (2 pi)^3 delta^3(arrow(p) - arrow(q)) $

The $a_p^dagger$ creates particles with momentum $arrow(p)$ and $a_p$ annihilates particles with momentum $arrow(p)$. 

$ a_p^dagger |0 ket = 1/sqrt(2 omega_p) |1 arrow(p) ket $

where $|1 arrow(p) ket$ represents a single particle state with momentum $arrow(p)$ and $|0 ket$ is the vacuum state. 

We can perform the following normalization of the single particle state, by setting:

$ bra 0 | 0 ket = 1 $ 

which leads to: 

$ bra arrow(p) | arrow(q) ket = 2 omega_p (2 pi)^3 delta^3(arrow(p) - arrow(q)) $

Upon acting $phi.alt_0$ on the vacuum state, and project out the momentum component, we get: 

$ bra arrow(p) | phi.alt_0 (arrow(x)) | 0 ket = e^(- i arrow(p) dot  arrow(x)) $

#theory-box[This is the same as the projection of the position state one a momentum state in one-particle quantum mechanics: 

$ bra arrow(p) | arrow(x) ket = e^(- i arrow(p) dot  arrow(x)) $ 

]

#hl[This essentially shows us that, $phi.alt_0 (arrow(x))$ when acted on the vacuum state, creates a particle at position $arrow(x)$, which is a superposition of all the momentum states.] 

The discussion up til now was at a fixed time slice. #hl[In QFT we often work with the Heisenberg picture, where the operators evolve with time and the states are fixed.] The creation and annihilation operators evolve with time as: 

$ a_p (t) = a_p e^(-i omega_p t) "     " a_p^dagger (t) = a_p^dagger e^(i omega_p t) $

Then the field operator at any time is given by:

$ phi.alt_0(arrow(x), t) = phi.alt_0(x) = integral difp(p) 1/sqrt(2 omega_p) [a_p e^(-i p dot x) + a_p^dagger e^(i p dot x) ] $

with $p^mu = (omega_p, arrow(p))$ 


In fact, the general solution to general Klein-Gordon equation is given in a similar form: 

#math-box[

  $ (square + m^2) phi.alt_0 = 0 $ 

  $ phi.alt_0 (arrow(x), t) = integral difp(p) 1/sqrt(2 omega_p) [a_p e^(-i p dot x) + a_p^dagger e^(i p dot x)] $

  $ "where" omega_p = sqrt(arrow(p)^2 + m^2) $

]

We actually find the equivalent of the Heisenberg equation for the field, which is given by:

$ i partial_t phi.alt_0 (arrow(x), t) = [phi.alt_0 (arrow(x), t), H_0] $

and the Schrödinger equation for the states, which is given by: 

$ partial_t^2 phi.alt_0 = (arrow(nabla)^2 - m^2) phi.alt_0 $


We can find equal-time commutation relations for the fields at different points in space, which are given by: 

$ [phi.alt_0(arrow(x), t), phi.alt_0(arrow(y), t)] = 0 $

We can define the conjugate momentum of the field as: 

$ pi_0 (arrow(x), t) = partial_t phi.alt_0 (arrow(x), t) $

#math-box[

  $ pi_0 (arrow(x), t) = - i integral difp(p) sqrt(omega_p/2) [a_p e^(-i p dot x) - a_p^dagger e^(i p dot x)] $

]

Then we get the following equal-time commutation relations: 

$ [phi.alt_0(arrow(x), t), pi_0(arrow(y), t)] = i delta^3(arrow(x) - arrow(y)) $

$ [pi_0(arrow(x), t), pi_0(arrow(y), t)] = 0 $


All the commutation relations can be summarized below: 

#math-box[ 

  $ [a_p, a_q^dagger] = (2 pi)^3 delta^3(arrow(p) - arrow(q)) $

  $ [phi.alt_0(arrow(x), t), phi.alt_0(arrow(y), t)] = 0 $

  $ [pi_0(arrow(x), t), pi_0(arrow(y), t)] = 0 $

  $ [phi.alt_0(arrow(x), t), pi_0(arrow(y), t)] = i delta^3(arrow(x) - arrow(y)) $

]




== Classical Field Theory

This chapter lays the foundation for how we actually *do* QFT in practice. The central philosophy is this: instead of specifying equations of motion directly, we encode all the physics into a single object - the *Lagrangian* - and then derive everything from it. This approach has two enormous advantages: it is manifestly Lorentz covariant, and symmetries of the Lagrangian translate directly into conserved quantities.

=== Hamiltonians and Lagrangians

In classical mechanics, you either describe a system through a *Hamiltonian* $H$ or a *Lagrangian* $L$. They are related by a *Legendre transform*:

#math-box[$ H = pi dot(phi) - L "       where       " pi = (partial L)/(partial dot(phi)) $]

For the simplest (and most important) case of a scalar field:

$ L = 1/2 (partial_mu phi)(partial^mu phi) - V[phi] = 1/2 dot(phi)^2 - 1/2 (arrow(nabla) phi)^2 - V[phi] $

$ H = 1/2 dot(phi)^2 + 1/2 (arrow(nabla) phi)^2 + V[phi] $

So the Hamiltonian is the sum of kinetic and potential energy ($H = K + V$), while the Lagrangian is their difference ($L = K - V$).

#theory-box(title: "Why We Prefer Lagrangians in QFT")[
  The Hamiltonian picks out a preferred time direction (it is the energy, the $0$-component of the 4-momentum $P^mu = (H, arrow(P))$), so it is *not* manifestly Lorentz invariant. 

  The Lagrangian density $cal(L)(x)$, on the other hand, is a Lorentz scalar — if you boost or rotate, it transforms the same as any other scalar field. This makes it the natural language for relativistic field theory.

  That is why in QFT, the Hamiltonian is mostly used for conceptual understanding (energy, particle number, etc.), while *all actual calculations* use Lagrangians.
]

==== Kinetic terms vs. Interactions

It is standard in QFT to distinguish the two structural parts of a Lagrangian:

- *Kinetic terms*: bilinear in the fields (which means exactly two fields), they govern free propagation. Examples: $ 1/2 phi square phi "      " -1/4 F_(mu nu)^2 "      " 1/2 m^2 phi^2 $
  
- *Interaction terms*: three or more fields, they encode how particles interact. Examples: $ lambda phi^3 "     " g^2 A_mu^2 A_nu^2 "     " ... $

#hl[The kinetic terms tell you everything about the free-field behavior — how particles propagate in empty space. Interactions are perturbations on top of that free theory.]

=== The Euler-Lagrange Equations

The equations of motion follow from the *principle of least action*. The action is:

$ S = integral d^4 x space cal(L)[phi, partial_mu phi] $

Varying the field $phi -> phi + delta phi$ and demanding $delta S = 0$ for any variation that vanishes at the boundary gives the *Euler-Lagrange equations*:

#math-box[$ (partial cal(L))/(partial phi) - partial_mu (partial cal(L))/(partial (partial_mu phi)) = 0 $<euler-lagrange>]

This is the covariant equation of motion for any field. Let us verify on the scalar Lagrangian:

$ cal(L) = 1/2 (partial_mu phi)(partial^mu phi) - 1/2 m^2 phi^2 $

Plugging into @euler-lagrange gives:

$ -m^2 phi - partial_mu (partial^mu phi) = 0 \ \ ==> (square + m^2) phi = 0 $

which is exactly the *Klein-Gordon equation* from Chapter 2 — confirming that our Lagrangian approach is consistent.

#theory-box(title: "Why Only First Derivatives?")[
  We restrict to Lagrangians of the form $cal(L)[phi, partial_mu phi]$ (no $partial_mu partial_nu phi$ etc.) for the following reasons:

  - In classical mechanics, specifying initial position and velocity (first derivative) fully determines the future evolution — this matches Newton's laws. Higher-order kinetic terms would require specifying higher-order initial data.

  - In the quantum theory, Lagrangians with kinetic terms involving more than two derivatives generically lead to catastrophic consequences: states with negative energy ("ghosts") or negative norm. This would allow the vacuum to spontaneously decay, which is unphysical.
  
  Interactions *can* have multiple derivatives (and must in effective field theories), but the kinetic terms should always be at most second order in derivatives.
]

=== Noether's Theorem

This is arguably one of the most beautiful and practically useful results in all of theoretical physics.

#theory-box(title: "Noether's Theorem")[
  *If a Lagrangian has a continuous symmetry, then there exists a conserved current associated with that symmetry — one that is conserved when the equations of motion are satisfied (i.e., on-shell).*

  Mathematically: if $cal(L)$ is invariant under $phi -> phi + alpha delta phi$ for continuous parameter $alpha$, then the current:

  $ J^mu = sum_n (partial cal(L))/(partial (partial_mu phi_n)) (delta phi_n)/(delta alpha) $

  satisfies: $ partial_mu J^mu = 0 $

  This implies the *conserved charge*: $ Q = integral d^3 x space J^0 $ satisfies $partial_t Q = 0$.
]

The physical implication is profound: #hl[every continuous symmetry of nature corresponds to a conservation law. Time translation symmetry gives energy conservation. Space translation gives momentum conservation. Rotational symmetry gives angular momentum conservation. This is not a coincidence — it is a mathematical theorem.]

A few important caveats:
- The symmetry must be *continuous* (e.g., $phi -> e^(-i alpha) phi$). Discrete symmetries like $phi -> -phi$ do not apply.
- The current is only conserved *on-shell*, i.e., when the field satisfies its equations of motion.
- It applies to *global* symmetries (constant $alpha$), not just local gauge symmetries.

==== Example: $U(1)$ symmetry and charge conservation

Consider a complex scalar field $phi$ with Lagrangian:

$ cal(L) = (partial_mu phi)(partial^mu phi^*) - m^2 phi phi^* $

This is invariant under $phi -> e^(-i alpha) phi$ for any constant $alpha in RR$. Taking the infinitesimal variation:

$ (delta phi)/(delta alpha) = -i phi "        " (delta phi^*)/(delta alpha) = +i phi^* $

The Noether current is:

#math-box[$ J^mu = -i [phi^* partial^mu phi - phi partial^mu phi^*] $]

This is precisely the electromagnetic current that a charged scalar particle carries. The conserved charge $Q = integral d^3 x space J^0$ is the total electric charge — so $U(1)$ symmetry is the symmetry that guarantees charge conservation.

==== Energy-Momentum Tensor

The most important application of Noether's theorem is *spacetime translation symmetry*. If physics is the same everywhere and at all times (which it is, by the cosmological principle), then the Lagrangian must be invariant under $x^mu -> x^mu + xi^mu$ for constant $xi^mu$.

Under this translation, fields transform as $phi(x) -> phi(x + xi) approx phi(x) + xi^nu partial_nu phi(x)$, giving $(delta phi)/(delta xi^nu) = partial_nu phi$.

Applying Noether's theorem for each component of $xi^nu$ produces *four* conserved currents — one for each spacetime direction. These are organized into the *energy-momentum tensor*:

#math-box[$ T^(mu nu) = sum_n (partial cal(L))/(partial (partial_mu phi_n)) partial^nu phi_n - g^(mu nu) cal(L) $<energy-momentum>]

with conservation law $partial_mu T^(mu nu) = 0$.

The four conserved charges are:

$ Q^nu = integral d^3 x space T^(0 nu) = (H, arrow(P)) = P^mu $

That is: $T^(00)$ integrated over space gives the total *energy*, and $T^(0 i)$ gives the total *momentum*. The energy-momentum tensor literally encodes all the energy and momentum in the field.

For the scalar field, the energy density is:

$ T^(00) = sum_n (partial cal(L))/(partial dot(phi)_n) dot(phi)_n - cal(L) = pi dot(phi) - cal(L) = cal(H) $

This is just the Hamiltonian density — perfectly consistent with $T^(00)$ being the energy density.

#theory-box[The energy-momentum tensor defined via @energy-momentum is called the *canonical energy-momentum tensor*. It is not always symmetric in its indices. In general relativity, there is another definition where one varies the action with respect to the metric — this one is automatically symmetric and is often called the *Belinfante-Rosenfeld* or *metric* energy-momentum tensor. The two agree for symmetric cases, but differ in general. For electromagnetism, one needs to symmetrize the canonical one by hand (this is Problem 3.3 in Schwartz).]

==== Currents — a general concept

The word "current" in QFT has a broader meaning than just the Noether current. Currents appear in many roles:

1. *Noether currents*: Associated with a symmetry, automatically conserved on-shell.

2. *External currents*: A background configuration, like the charge density $rho(arrow(x))$ of a wire. They are *not* dynamical — they do not have their own kinetic terms:
   $ J^0(x) = rho(x) "     " J^i(x) = v^i(x) $

3. *Sources in Lagrangians*: A current $J^mu$ can appear as a source for a gauge field: $ cal(L) supset - A_mu J^mu $. This is how charged matter *sources* the electromagnetic field.

4. *Placeholder notation*: Currents can package interaction terms for cleaner writing. For instance, $A_mu J^mu$ could represent $A_mu bar(psi) gamma^mu psi$ if $J^mu = bar(psi) gamma^mu psi$. This separation lets us study how the source produces the field and how the field then affects other things, independently.

#hl[The key rule: a current is *never* dynamical — it never has its own kinetic term in the Lagrangian. The dynamical fields are things like $phi$ and $A^mu$; currents $J^mu$ are either external inputs or bookkeeping labels for interaction terms.]

=== Coulomb's Law from Classical Field Theory

This is a beautiful concrete calculation that shows how the field theory framework directly reproduces classical electrostatics, and introduces the crucial concept of *propagators*.

Start with a point charge $e$ at the origin, represented as an external current:

$ J^0(x) = e delta^3(arrow(x)) "          " J^i(x) = 0 $

The Lagrangian for the electromagnetic field coupled to this source is:

$ cal(L) = -1/4 F_(mu nu)^2 - A_mu J^mu $

Applying the Euler-Lagrange equations to this Lagrangian yields *Maxwell's equations in the presence of a source*:

$ partial_mu F^(mu nu) = J^nu $

Expanding $F_(mu nu) = partial_mu A_nu - partial_nu A_mu$ and choosing the *Lorenz gauge* $partial_mu A^mu = 0$:

$ square A^nu (x) = J^nu(x) $

This has the formal solution:

#math-box[$ A^nu (x) = 1/square J^nu (x) $]

where $1/square$ is shorthand for the inverse of the d'Alembertian — defined precisely below. For our static point charge ($J^i = 0$, $J^0 = e delta^3(arrow(x))$), only $A^0$ is non-zero.

==== Fourier Transform and the Propagator

To actually compute $1/square$, we go to momentum space. The key identity is:

$ square <-> -k^2 $

More precisely, in Fourier space:

$ [square^n f] (k) = (-k^2)^n tilde(f)(k) $

So the operator $1/square$ becomes $-1/k^2$ in momentum space. Using this:

$ A^0(x) = e/square delta^3(arrow(x)) = integral (d^3 k)/((2pi)^3) e/(arrow(k)^2) e^(i arrow(k) dot arrow(x)) $

Evaluating this integral using contour integration gives:

#math-box[$ A^0(x) = e/(4 pi r) $<coulomb-potential>]

This is exactly the *Coulomb potential*! The field theory approach has reproduced the classical $1/r$ potential from first principles, purely from the Lagrangian and gauge invariance.

=== Green's Functions and Propagators

The Coulomb calculation reveals something much more general. In almost every QFT calculation, we will encounter:

$ A^nu (x) = 1/square J^nu (x) $

The inverse of the d'Alembertian is the *propagator* (or *Green's function*):

#math-box[$ Pi(x, y) = -1/square "     defined as     " square_x Pi(x, y) = -delta^4(x - y) $]

Its explicit form in momentum space is:

$ Pi(x, y) = integral (d^4 k)/((2pi)^4) (e^(i k(x-y)))/k^2 $

And then the field sourced by a current $J$ is:

$ phi(x) = -integral d^4 y space Pi(x, y) J(y) $

#hl[The propagator $Pi(x,y)$ encodes how disturbances in the field travel from point $y$ to point $x$. It depends *only on the kinetic terms* of the Lagrangian — it has nothing to do with the source. The source just tells you where to start; the propagator tells you how the influence spreads.]

==== Perturbative Expansion and Feynman Diagrams

The true power of the Green's function approach is in handling *interacting* theories. Consider a self-interacting field (like a simplified model of gravity where the graviton self-interacts):

$ cal(L) = -1/2 h square h + lambda/3 h^3 + J h $

The equation of motion is: $ square h - lambda h^2 - J = 0 $

We cannot solve this exactly, but we can solve it *perturbatively in* $lambda$:

- *Zeroth order* ($lambda = 0$): $h_0 = 1/square J$

- *First order correction*: $square h_1 = lambda h_0^2$, so $h_1 = lambda/square (h_0 h_0) = lambda/square (1/square J dot 1/square J)$

- *Full solution to order $lambda$*:
$ h = 1/square J + lambda/square [1/square J dot 1/square J] + cal(O)(lambda^2) $

This expansion has a beautiful pictorial representation — these are *Feynman diagrams*. The rules are:

1. Draw a point $x$ and a line from $x$ to a new point.
2. Either cap the line at a source $J$ (a "leaf"), or let it branch into two lines at a vertex, adding a factor of $lambda$.
3. Each line is a *propagator* $Pi(x_i, x_j)$.
4. Integrate over all internal points.

#theory-box(title: "The Deep Insight: Feynman Diagrams from Field Theory")[
  These Feynman diagrams are not just a convenient notation — they encode the exact perturbative solution to the classical equations of motion. Each diagram corresponds to a specific term in the perturbative expansion of $h(x)$, with:
  - Lines $<->$ propagators $Pi(x_i, x_j)$
  - Vertices $<->$ factors of $lambda$
  - Endpoints $<->$ sources $J(x_i)$, integrated over

  In quantum field theory (Chapter 7 and onward), the same Feynman rules appear — the only new ingredient is that lines can now *close in on themselves* (forming loops) because of quantum fluctuations. The quantum propagator is essentially the same $1/k^2$ object, with a specific $i epsilon$ prescription for handling the poles.
  
  #hl[The structure of perturbation theory in QFT — Feynman diagrams, propagators, vertices — is already fully visible at the classical level. Quantum mechanics "just" adds loops.]
]

For the concrete case of the Sun-Mercury gravitational interaction: the first diagram (linear in $1/J$) gives *Newton's potential*, and the second diagram (with one self-interaction vertex, proportional to $lambda ~ sqrt(G_N)$) gives the first *general relativistic correction* to Mercury's orbit.












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















































#pagebreak()
= A1: Notes on no-nonsense quantum field theory


_Hi, so this sections is dedicated to some topics that I have been learning on the side. For now it is based on this book called "No-nonsense quantum field theory" by Jakob Schwichtenberg. This is an amazing book, and I wish I had read this while I learnt QFT. But it is never too late, so I am planning on re-learning the entirety of QFT from this book, and I will be taking notes here._ 


== Fields

=== Scalar Fields 

These are as simple as things can get. #hl[They are essentially just functions that take in a space-time point and return a number.] 

A simple example is the inner product of two 4-vectors:  $x^mu y_mu$ 

The number that is returned is a scalar, and it is invariant under Lorentz transformations. And this number is also given the name *field strength*, since it describes the strength of the field at that spacetime point. 

A real world example of a scalar field would be the temperature distribution in a room. 

=== Vector Fields 

We all know what vector fields are, they are essentially just functions that take in a space-time point and return a 4-vector. 

So the output 4-vector can in fact be written as two parts, one for describing the strength of the field and one for describing the direction of the field. So we can write a vector field as: 

$ A_mu (x_mu) = epsilon_mu  times f(x_mu) $

where $epsilon_mu$ describes the direction of the field and $f(x_mu)$ describes the strength of the field. This is quite similar to how we describe a vector in 3D space, where we can write it as a unit vector in the direction of the vector multiplied by the magnitude of the vector. 

And similar to how the unit vector is normalized to 1, we can also normalize the direction vector $epsilon_mu$ to 1, or rather -1 since it is a 4-vector: 

$ epsilon_mu epsilon^mu = -1 $

And also similar to 3D space, we can represent the unit vector $epsilon_mu$ as a linear combination of basis vectors $epsilon_mu^lambda$, a simple example is: 

$ epsilon_mu^0 = mat(i ; 0; 0 ; 0) "  " epsilon_mu^1 = mat(0 ; 1 ; 0 ; 0) "  " epsilon_mu^2 = mat(0 ; 0 ; 1 ; 0) "  " epsilon_mu^3 = mat(0 ; 0 ; 0 ; 1) $

#hl[The $epsilon_mu$ is defined as the *polarization*]

We can check that the basis vectors also satisfy the normalization condition, $epsilon_mu^lambda (epsilon^mu)^lambda = -1$

\
#theory-box(title: "Polarization of Gauge Fields")[
  This brings us to an important point here. 

  All polarizations that we can cook up mathematically don't have to physically exist. Only the polarizations that are consistent with the equations of motion of the field are physically relevant. 

  This is important because often in physics, we are interested in *gauge fields*, which are special kinds of fields. (How are they special? This we will see in the later sections, but for now they are just some special vector fields). 

  There are two types of gauge fields, massless and massive, and here is where polarization comes into the picture. 

  - For *massive* gauge fields, there are only *3 independent polarizations*, so we only need 3 basis vectors to describe the direction of the field. 

  - For *massless* gauge fields, there are only *2 independent polarizations*, so we only need 2 basis vectors to describe the direction of the field. 

    This also means that an excitation of a massless gauge field can never be polarized in the direction of its movement.  

]


=== Spinors 

The key takeaway in the way we define scalars and vectors are that: 

#math-box[ Scalars and vectors are mathematical objects that are defined by their behaviour under a coordinate transformation.]

So similar to scalars and vectors, we can define new quantities that are also defined by their own transformation rules. 

One such quantity is called a *spinor*, which lie somewhere in between a scalar (which is invariant under a transformation) and a vector (which transforms like a 4-vector). 

Specifically, we define the *Weyl spinors*, which are objects with 2 dimensions. This also implies that all the transformations are carried out using 2x2 matrices. 

#hl[There are two kinds of *Weyl spinors*, the left-handed and the right-handed spinors. ] 

The *left handed spinors*, represented by $psi_L$, transform under rotation (around the x-axis) as: 

$ psi_L -> psi^'_L = R_(L, x) psi_L  $

where $ R_(L, x) = mat(cos(theta slash 2), i sin(theta slash 2); i sin(theta slash 2), cos(theta slash 2)) $

(Here $R_(L, x)$ is the rotation matrix for left-handed spinors around the x-axis) 

Further, any boost along the z-axis can be represented as: 

$ psi_L -> psi^'_L = B_(L, z) psi_L  $

where $ B_(L, z) = mat(e^(phi/2), 0; 0, e^(-phi/2)) $ 

and $phi$ denotes the rapidity, which is defined as: $tanh(phi) = v slash c$ 

Similarly for the *right handed spinors*, represented by $psi_R$, transform under rotation (around the x-axis) as: 

$ psi_R -> psi^'_R = R_(R, x) psi_R  $

where $ R_(R, x) = mat(cos(theta slash 2), i sin(theta slash 2); i sin(theta slash 2), cos(theta slash 2)) $

which if you notice is the same as the left-handed spinor rotation matrix, $R_(L, x) = R_(R, x)$ 

Coming to boosts along the z-axis, the right-handed spinors transform as: 

$ psi_R -> psi^'_R = B_(R, z) psi_R  $

where $ B_(R, z) = mat(e^(-phi/2), 0; 0, e^(phi/2)) $

which is actually different from the left-handed spinor boost matrix. 

#hl[What we see is that the rotation matrices are the same for both left-handed and right-handed spinors, but the boost matrices are different, with swapped minus signs in the exponents.]

We now introduce a new kind of transformation here, one which is discrete and not continuous like rotations and boosts. This is called the *parity transformation*, which is essentially a mirror reflection of the coordinates: $ arrow(x) -> -arrow(x) $

Now notice this. The way we define the left and the right handed spinors come down to how their respective boosts, $B_(R, z)$ and $B_(L, z)$, are defined. But under a parity transformation, positive $z$ becomes negative $z$, and vice versa, which also flips the sign of the rapidity $phi$. 

#hl[This essentially means that under a parity transformation, the left-handed spinor becomes a right-handed spinor and vice versa. A direct consequence of this is that the left-handed spinor also becomes a right-handed spinor and vice versa under a parity transformation, since the spinors are themselved defined on how their boosts are defined.] 

$ psi_L -> psi_R " and " psi_R -> psi_L " under a parity transformation " $

This motivates us to define a new kind of spinor, called the *Dirac spinor*, which is nothing but the combination of a left-handed and a right-handed spinor:

$ psi = mat(psi_L ; psi_R) $

And under a parity transformation, the Dirac spinor transforms as: 

$ psi = mat(psi_L ; psi_R) -> mat(psi_R ; psi_L) $

Although the dirac spinor has 4 components, it is not a 4-vector. It is a new mathematical object that transforms in its own way under coordinate transformations. 

We next define how we perform the inner product of two spinors. Before we get into that, we quickly see that the inner product of two vectors are defined as: 

$ A_mu B^mu = eta_(mu nu) A^nu  B^mu = A^0 B^0 - A^1 B^1 - A^2 B^2 - A^3 B^3 $

where $eta_(mu nu)$ is the Minkowski metric and is the primary way to lower and raise indices of vectors. 

Similarly, we define the *spinor metric* $epsilon_(a b)$, which is a 2x2 matrix that is used to lower and raise indices of spinors. It is defined as: 

$ epsilon_(a b) = mat(0, 1; -1, 0) $

which helps us define the inner product between two weyl spinors to be: 

$ chi_a chi^a = epsilon_(a b) chi^b chi^a $

This gives us a scalar quantity between two spinors. 

Now what would happen if we were to take the inner product of a left-handed spinor and a right-handed spinor? Well, we can define the inner product between a left-handed spinor and a right-handed spinor as: 

$ psi_L^dagger psi_R = (psi_L^dagger)^a (psi_R)_a = epsilon^(a b) (psi_L^dagger)_b (psi_R)_a $

Similarly, $ psi_R^dagger psi_L = (psi_R^dagger)^a (psi_L)_a = epsilon^(a b) (psi_R^dagger)_b (psi_L)_a $

#hl[The product of a left-handed spinor and a right-handed spinor can only be done when one of them is complex transposed.]


\
==== The "spin" in spinors 

Spin is an intrinsic property of particles, similar to how mass and charge are intrinsic properties of particles. Similar to how different particles have different charges, they also have different spins. 

- *Spin 0*: These particles are also called *scalar particles*, because they are described by scalar fields. The Higgs boson is the only example of a fundamental scalar particle that we know of, and this guys is responsible for giving mass to all the other particles. 

- *Spin 1/2*: These particles are also called *fermions*, because they are described by spinor fields. All the matter particles (like electrons, neutrinos, quarks) are fermions. 

- *Spin 1*: These particles are also called *vector bosons*, because they are described by vector fields. The photon, gluon, W and Z bosons are all examples of vector bosons.


Now consider for example a spin 1/2 particle, like an electron. The spin of the electron can be either "up" or "down", which is a binary choice, and can never be zero. #hl[This means that no matter along which axis we choose to measure the spin of the electron, we will always get either "up" or "down".] Thus every state of the particle must either be spin up or spin down. 

The up and down states are represented in Weyl spinors as: 

$ "up: " mat(1; 0) "    " "down: " mat(0; 1) $

And the general form of the Weyl spinor can be written as a linear combination of the up and down states: 

$ mat(a ; b) = a mat(1;0) + b mat(0;1) $

where $a$ and $b$ are related to the probabilities of measuring the spin to be up or down respectively. 

==== Why two kinds of spinors? 

As we saw before, we have two kinds of Weyl spinors, the left-handed and the right-handed spinors. The question is, why do we need two kinds of spinors? 

The answer lies in the fact that Nature has a favourite child. The weak interaction, which is responsible for radioactive decay, is a chiral interaction. #hl[This means that the weak interactions only occur with left-handed particles, described by left-handed spinors. ]

The reason why this happens is not exactly known. We just know from observations that this is true and we have built a model around that. 

== Gauge Fields 

_(This entire section is better understood with examples and analogies, so I am adding a continued example starting from here till the end of this section. This would be within the blue boxes.)_

=== Field Spaces

Before we understand what gauge fields are, we first look at something called *field spaces*. Instead of defining them, its easier to understand them by looking at an example. 


#theory-box(title: "Temperature Field Space")[
  So as we saw before, we can consider the temperature to be a scalar field, which is a function that takes in a space-time point and returns a number, which is the temperature at that point in our case. 

  Now instead of imagining the temperature at a point to be a number, we can instead imagine a "ghost" number line floating at that point with the temperature value marked on the line, similar to say a thermometer. 

  We can then assign this "ghost" number line to every point in space-time, and all these lines together form the *field space*. The field space is not a ghost, but we think of them to be an extra or "hidden" dimension that is attached to every point in space-time. 

  #figure(image("images/temperature-field-space.png", width: 40%), caption: [A representation of a 1D field space existing over a 2D space-time])<temperature-field-space.png> 
]

The fun part about field spaces is that since in a way they are abstract quantities, we can layer multiple field spaces over the same space-time. For example, we can have a temperature field space and a pressure field space existing over the same space-time. 

And these field spaces are typically disconnected from the space-time, meaning disturbances or waves in the field space only affect the field strength at that point in space-time, and not the space-time itself. 

=== Local Coordinate Systems

Now that we understand what field spaces are, next we look at the coordinate systems in these field spaces. 

#theory-box[
  Going back to our analogy of the temperature field space, we can imagine a thermometer at every point in space-time. Each thermometer in the field space has its zero point. The zero point is essentially the origin of the coordinate system in the field space.

  Now there are two possibilities here: 

  + The zero point and scale of the thermometer is the same for all points in space-time. This means that the coordinate system in the field space is the same for all points in space-time. 
  
   It really does not matter what the zero point exactly is, because all we care about is the difference in temperature between two points in space-time (similar to how we only care about the difference in potential between two points in space, not the actual value of the potential).

    So when we change the origin of our coordinate system by some value, then every thermometer in the field space also changes its zero point by the same value. This is called a *global transformation*, since the transformation is applied to all points in space-time. 

    #figure(image("images/global-shift.png", width: 70%), caption: [Global Shift])<global-shift.png>


  + The other possibility is that the zero point is different for different thermometers. So the origins of the coordinate systems in the field space are different for different points in space-time. 

   And similar to how we performed a global transformation, we can also perform a *local transformation*, where we change the origin of the coordinate system in the field space at each point in space-time by a different value. 

   #figure(image("images/local-shift.png", width: 70%), caption: [local shift])<local-shift.png>


  #hl[A simple analogy to seal the deal: ]

  _so say you and your friend are in the same room but at two different places. Both of you have a thermometer that you are measuring temperature from._


  _Now normally both your thermometers would maybe start from a least temperature of 0 C and from there you get say 25 C and your friend measures some 30 C so then you can easily just subtract the two values and find the difference in temperature between the two points._


  _But this is only that simple coz both of your origin (i.e. starting point) is at 0 C, but what if it wasnt the same? _


  _Now say you actually walk over to your friend's spot and measure the temp there with your thermometer. And say your friend's thermometer is showing 0 C but your thermometer is actually showing 10 C. That means his 10 C is actually corresponding to your 0 C, so both your starting points are not the same right, your friend according to you is clearly having 10 C more, say coz his thermometer is malfunctioning and the base value is shifted by 10 C. _


  _So how would find the actual difference in temperature? Your friend's thermometer is ahead of yours by 10C so then whatever value he tells, you subtract 10 from that and the result value you can compare with your thermometer value and that would be the actual temperature difference between the two points. So in our example your thermometer says 25 C, your friend tells you his thermomeeter reading to be 30 C but you subtract 10 from it so it is actually 20 C. So the final answer is that your friend's spot is cooler by 5 C._
]

#hl[Be it a global or a local coordinate system/transformation, the physics of the system should not change, since the field strength is what determines the physical behavior.] This is called *gauge invariance * and it is a fundamental principle in physics.

Using local coordinates is confusing since our origins are not the same for all points in space-time. So we need a way to first check how the origins are changing from point to point in space-time. This is done using a *connection*, which is a mathematical object that tells us how the origins of the coordinate systems are changing from point to point in space-time. 

To understand how we can use these connections practically, let's look at a simple example. 

#figure(image("images/connection-relations.png", width: 100%), caption: [Connection Relations ])<connection-relations.png>

Consider two points in spacetime, described by the coordinates $arrow(n)$ and $arrow(n) + arrow(e)_1$, where $arrow(e)_1$ is the basis vector along the x-axis (essentially we are taking two points that are right next to each other). 

Now we define the field strength at point $arrow(n)$ with respect to the local coordinate system at that point as $phi.alt_(arrow(n)) (arrow(n))$. And similarly, we define the field strength at point $arrow(n) + arrow(e)_1$ with respect to the local coordinate system at that point as $phi.alt_(arrow(n) + arrow(e)_1) (arrow(n) + arrow(e)_1)$. These are represented by the yellow arrows in @connection-relations.png.

As a general rule the subscripts denote whose local coordinate system we are using to define the field strength, and the brackets denote the point in space-time at which we are measuring the field strength. So for example, the value $phi.alt_(arrow(n)) (arrow(n) + arrow(e)_1)$ denotes the field strength at point $arrow(n) + arrow(e)_1$ with respect to the local coordinate system at point $arrow(n)$, and vice-versa. These are represented by the red arrows in @connection-relations.png.

The shift between the two local coordinate systems is denoted by $A_(arrow(n)) (arrow(n) + arrow(e)_1)$, which is the connection between the two points. Particularly it represents how much the coordinate system at $arrow(n) + arrow(e)_1$ is shifted with respect to the coordinate system at $arrow(n)$. This is represented by the blue dashed line in @connection-relations.png.

In such a scenario, say we are interested in the true difference in field strength between the two points, $d_1$, represented by the white arrow in @connection-relations.png. To calculate this, we must first shift all the field strengths to the same local coordinate system, and then take the difference. So we can write: 

$ d_1 = phi.alt_(arrow(n)) (arrow(n)) - phi.alt_(arrow(n)) (arrow(n) + arrow(e)_1) $

From @connection-relations.png we can write $ phi.alt_(arrow(n)) (arrow(n) + arrow(e)_1)$ as: 

$ phi.alt_(arrow(n)) (arrow(n) + arrow(e)_1) = phi.alt_(arrow(n) + arrow(e)_1) (arrow(n) + arrow(e)_1) + A_(arrow(n)) (arrow(n) + arrow(e)_1) $

Then we can write the difference in field strength between the two points as: 

$ d_1 = phi.alt_(arrow(n)) (arrow(n)) - phi.alt_(arrow(n) + arrow(e)_1) (arrow(n) + arrow(e)_1) - A_(arrow(n)) (arrow(n) + arrow(e)_1) $

This was just in the x-direction, but we can do the same for any direction, so as a generalization we have: 

$ d_i = phi.alt_(arrow(n)) (arrow(n)) - phi.alt_(arrow(n) + arrow(e)_i) (arrow(n) + arrow(e)_i) - A_(arrow(n)) (arrow(n) + arrow(e)_i) $

Now taking the continuous limit, we can write the difference in field strength between two points as: 

$ D_i (arrow(x)) = partial_i phi.alt - A_i (arrow(x)) $

which generalized to the 4-dimensional space that we usually work with, we get: 

#math-box[$ D_mu (x) = partial_mu phi.alt - A_mu (x) $]

This here is called the *covariant derivative*.#hl[ This is an important quantity that we would frequently use since $partial_mu$ compares the field strengths directly without taking into account the local coordinate systems, while $D_mu$ takes into account the local coordinate systems and gives us the true difference in field strength between two points.]

#theory-box(title: "A simple example on how we use the covariant derivative")[

  For a simple example on how we actually incorporate the covariant derivative in our calculations, consider the lagrangian of a fermionic field: 

  $ cal(L) = dash(psi)(x) [i gamma^mu partial_mu - m ] psi(x) $

  Now if we peform a global transformation on the field, $psi -> psi^' = e^(i alpha) psi$, then on substituting this into the lagrangian we find that the lagrangian remains unchanged, $cal(L) = cal(L)^'$. This was only possible since the transformation was global, i.e. the value of $alpha$ was the same for all points in space-time. 

  But now say $alpha$ depends on the point in space-time, $alpha = alpha(x)$. Then the transformation is local, and on substituting this into the lagrangian we find that the lagrangian changes, $cal(L) != cal(L)^'$. 

  To fix this, we can replace the $partial_mu$ with the covariant derivative $D_mu$, by setting $ A_mu (x) = partial_mu alpha(x) $ 
  
  With this, the lagrangian remains unchanged under a local transformation, $ cal(L) = cal(L)^' = dash(psi)(x) [i gamma^mu D_mu - m ] psi(x) $

]

=== Imperfect connections 

As the name suggests, the next idea we will be dealing with is that maybe the connections between the local coordinate systems are not perfect. #hl[This means that if we were to go from one point in space-time to another, and then back to the original point, the local coordinate system at the original point may have changed.] To understand this, let's look at a small example. 

#theory-box[
   Ok so continuing with our previous example about temperatures in room.


Now every point in that room would have a temperature right. Few spots in the room, like closer to the AC or something, would have a lower temperature while other spots will have a higher temperature.


You have your trust thermometer with you in hand which you know for a fact is not faulty, unlike the one your friend had. So you plan to go around measuring the temperature at different points in the room. You start off at say point A and you measure say 20 C and you go around the room in a loop, measuring temperature at different points. At the end you come back to A and measure the temperature there again, but to your surprise you see that your thermometer now reads 25 C, there is a 5 C increase!


Now you know for sure that your thermometer is not acting up, that thing is doing its job perfectly. But then what could explain this increase in temperature at A?


The answer lies in the observation that maybe the 0 C point of your own thermometer increased somehow while you travelled in that path, and that led to a 5 C increase displaying by your thermometer. But the important point to note here is that its not the fault of your thermometer, it is actually the fault of the space itself thats around you.


To actually better understand how the space itself affects things, you build a new device. This device, call it zero-measurer, measures the starting 0 C at each point in space (we'll call the value output by the zero-measurer the zero-point for convenience). So for example, if you take the zero-measurer and stand at the point where your friend was standing then it would read 10 C, because as you previously noted your friend's thermometer was shifted by 10 C higher. The thermometers were not the ones at fault, it's the space itself!


So now what you do is stand at point A again and calibrate the zero-measurer to be 0 here. Now you go around that same loop that you had taken before and once you come back to A you see that the zero-measurer indeed says 5 C, which matches the 5 C increase that you had seen when you used your thermometer. So your zero-measure initially was 0 and then it went to 5 C after you completed a loop and came back to the same place.


So the thing is like how temperature is itself a field (which is just a fancy way of telling that it has some value at every point in space), your zero-measure is also a field. It also has a value in every point in space and depending on what path you take through space the value outputted by the zero-measurer changes, like you had previously experienced.


This in itself is a strange property, how is the zero-measure changing its value depending on what path you take and come back? The answer lies in that the space here is not actually flat. Put it simply, the existence of temperature values at different points in that room actually ends up curving the space around there, so when you actually measure the temperature or the zero-point at some point in the room, and then come back to that point again and do the same measurements, they are not the same since the space itself is curved in a weird way (which actually is curved in the first place due to the existence of temperature in the room, so it becomes an infinite cycle of sorts).


So as physicists the best way to study say the temperature field is by first studying the zero-measure field and how that interacts with the space around and how it evolves with time. Once we fully understand how the zero-measure works, then we can start worrying about temperature since the temperature measurement itself is very much dependent on the zero-point value at that point in space. So our goal is to first understand this zero-point thingy then understand how temperature works.


And this zero-point field is called the gauge field. 
]

Okay so to see this in action, let's look at some calculation. 

If we want to describe the field strength at point $arrow(n)$ with respect to the local coordinate system at a nearby space-time point, we can write: 

$ phi.alt_(arrow(n) + arrow(e_i)) (arrow(n)) = phi.alt_(arrow(n)) - A_(arrow(n)) (arrow(n) + arrow(e_i)) $

So if I go from the coordinate system at $arrow(n)$ to $arrow(n) + arrow(e)_1$ then I need to subtract $A_(arrow(n)) (arrow(n) + arrow(e)_1)$. Similarly if I want to go from the coordinate system at $arrow(n) + arrow(e)_1$ to $arrow(n)$ then I need to add $A_(arrow(n)) (arrow(n) + arrow(e)_1)$.

So say I start with the field strength at point $arrow(n)$ with respect to the local coordinate system at that point, $phi.alt_(arrow(n)) (arrow(n))$, and I describe this in the coordinate system at point $arrow(n) + arrow(e_1)$, then I come back to my original coordinate system at point $arrow(n)$. This cycle can be represented as: 

$ phi.alt_(arrow(n)) (arrow(n)) -> phi.alt_(arrow(n) + arrow(e)_1) (arrow(n)) -> phi.alt_(arrow(n)) (arrow(n)) $

$ => phi.alt_(arrow(n)) (arrow(n)) -> phi.alt(arrow(n)) - A_(arrow(n)) (arrow(n) + arrow(e)_1) -> [phi.alt(arrow(n)) - A_(arrow(n)) (arrow(n) + arrow(e)_1)] + A_(arrow(n)) (arrow(n) + arrow(e)_1) = phi.alt(arrow(n))  $

So we see here that the field strength at point $arrow(n)$ with respect to the local coordinate system at that point remains unchanged after going through a cycle. 

But now say, we do this in 2 dimensions. 

So we go from point $arrow(n)$ to $arrow(n) + arrow(e)_1$, then to $arrow(n) + arrow(e)_1 + arrow(e)_2$, then to $arrow(n) + arrow(e)_2$, and finally back to $arrow(n)$. This cycle can be represented as: 

$ phi.alt_(arrow(n)) (arrow(n)) -> phi.alt_(arrow(n) + arrow(e)_1) (arrow(n)) -> phi.alt_(arrow(n) + arrow(e)_1 + arrow(e)_2) (arrow(n)) -> phi.alt_(arrow(n) + arrow(e)_2) (arrow(n)) -> phi.alt_(arrow(n)) (arrow(n)) $


We can expand this using connections as: 

$ phi.alt_(arrow(n) + arrow(e)_1) (arrow(n)) =  phi.alt_(arrow(n)) (arrow(n)) - A_(arrow(n)) (arrow(n) + arrow(e)_1) $

$ phi.alt_(arrow(n) + arrow(e)_1 + arrow(e)_2) (arrow(n)) =  phi.alt_(arrow(n) + arrow(e)_1) (arrow(n)) - A_(arrow(n) + arrow(e)_1) (arrow(n) + arrow(e)_1 + arrow(e)_2) $

$ phi.alt_(arrow(n) + arrow(e)_2) (arrow(n)) =  phi.alt_(arrow(n) + arrow(e)_1 + arrow(e)_2) (arrow(n)) - A_(arrow(n) + arrow(e)_1 + arrow(e)_2) (arrow(n) + arrow(e)_2) $ 

Combining all these, the final field strength at point $arrow(n)$ after the loop can be written as: 

$ phi.alt_(arrow(n)) (arrow(n)) - A_(arrow(n)) (arrow(n) + arrow(e)_1) - A_(arrow(n) + arrow(e)_1) (arrow(n) + arrow(e)_1 + arrow(e)_2) - A_(arrow(n) + arrow(e)_1 + arrow(e)_2) (arrow(n) + arrow(e)_2) - A_(arrow(n) + arrow(e)_2) (arrow(n)) $

Now we can use an obvious property that: 

$ A_(arrow(n)) (arrow(n) + arrow(e)_1) = - A_(arrow(n) + arrow(e)_1) (arrow(n)) $

using which the above comes to: 

$ phi.alt_(arrow(n)) (arrow(n)) - A_(arrow(n)) (arrow(n) + arrow(e)_1) - A_(arrow(n) + arrow(e)_1) (arrow(n) + arrow(e)_1 + arrow(e)_2) + A_(arrow(n) + arrow(e)_2) (arrow(n) + arrow(e)_1 + arrow(e)_2) + A_(arrow(n)) (arrow(n) + arrow(e)_2) $

$ phi.alt_(arrow(n)) (arrow(n)) - [  (A_(arrow(n) + arrow(e)_1) (arrow(n) + arrow(e)_1 + arrow(e)_2) - A_(arrow(n)) (arrow(n) + arrow(e)_2)) - (A_(arrow(n) + arrow(e)_2) (arrow(n) + arrow(e)_1 + arrow(e)_2) - A_(arrow(n)) (arrow(n) + arrow(e)_1) ) ] $

We define the terms inside the square brackets with a new quantity: 

$ F_(1 2)(arrow(n)) =   (A_(arrow(n) + arrow(e)_1) (arrow(n) + arrow(e)_1 + arrow(e)_2) - A_(arrow(n)) (arrow(n) + arrow(e)_2)) - (A_(arrow(n) + arrow(e)_2) (arrow(n) + arrow(e)_1 + arrow(e)_2) - A_(arrow(n)) (arrow(n) + arrow(e)_1) ) $

Then, the final field strength at point $arrow(n)$ after the loop can be written as:

$ phi.alt_(arrow(n)) (arrow(n)) - F_(1 2)(arrow(n)) $

Now if the connections were perfect, then $F_(1 2)(arrow(n)) = 0$, and the final field strength would be equal to the initial value. But if this isn't the case then $F_(1 2)(arrow(n)) != 0$.

So if $F_(1 2)(arrow(n)) > 0$ then the final field strength will be lesser than the initial value, and if $F_(1 2)(arrow(n)) < 0$ then the final field strength will be greater than the initial value. 

This can be generalized into the 4-dimensional continuous space-time, to get: 

#math-box[$ F_(mu nu)(x) = partial_mu A_nu (x) - partial_nu A_mu (x) $]



=== Finally, Gauge Fields

In the last step, we promote the connections to be actual fields, which are called *gauge fields*. We can imagine these gauge fields to provide a "background" to the field space, on top of which the field strength is defined and evolves. 

Further we can promote these fields into fully fledged physics objects by letting the gauge fields themselves evolve dynamically. This means we can write down equations of motion for the gauge fields themselves, and they can have their own dynamics independent of the field strength.

#hl[It actually turns out that the reason we have a non-zero gauge field (i.e. why the connections are imperfect) is because of the existence of a field strength in the first place! When fields have a non-zero value, it automatically curves the field space, which leads to imperfect connections and hence a non-zero gauge field. ]

This was just the beginning to gauge fields. In further sections we will see how gauge fields are related to the fundamental forces of nature, and how they are responsible for the interactions between particles.


== Waves, waves, waves! 

We love waves! If not, we need to learn to love them, coz they're everywhere. So this is a short chapter on wave mechanics and dynamics, which would be foundational when we start talking about field dynamics since a lot of that also occurs through waves. 

It turns out that when we input energy into our fields, the structures that emerge are wave-like, giving an almost membrane like properties for our fields. 

=== The classical wave equation 

Any time we come across an equation of the form similar to $ (partial_t^2 - c^2 partial_x^2) phi = 0  $ then we are working with waves. This above equation is the *wave equation*. 

To solve the wave equation we can consider solutions of the form: 

$ phi(x, t) = cos (omega t - k x) "  or  " phi(x, t) = sin (omega t - k x) $

where $omega$ is the angular frequency and $k$ is the wavenumber defined by $k = 2 pi slash lambda$ 

We can combine both the cosine and sine solutions together and write them in terms of the exponential: 

$ e^(i (omega t - k x)) = cos(omega t - k x) + i sin (omega t - k x) $

And so we can instead use the exponential for easier calculations. If we need the cosine solutions we can just take the real part and for the sine solutions we can just consider the imaginary part, 

$ phi(x, t) = e^(i (omega t - k x)) $

#hl[Solutions of these form describe plane waves, which are essentially waves that have the same amplitude and stretch out to infinity in both space and time.]

Upon substituing these solutions into the wave equation, we find a relation that must be satisfied: 

$ omega = c k $

which is called the *dispersion relation*. 

The solutions to this classical wave equation are of the form of *plane waves*, which are defined as waves whose amplitude is constant as the wave propagates through space. 

#figure(image("images/plane-waves-1.png", width: 70%), caption: [Initial position of a plane wave])<plane-waves-1.png> 

#figure(image("images/plane-waves-2.png", width: 70%), caption: [The plane wave at a later time, has moved to the right])<plane-waves-2.png>

The speed with which the wave propagates (i.e. a point on the wave moves to the right) is called the *phase velocity*, and is given by: 

$ v_p = omega / k = c $

#theory-box[
  Note that the phase velocity is the same for no matter what wave, i.e. it is independent of the frequency or wavelength of the wave. This means all waves described by the classical wave equation propagate at the same speed, $c$. 
]

=== Dispersed waves 

We can add another term to the wave equation, which we kindly call the *mass* or *dispersion* term, which gives us the *dispersed wave equation*: 

$ (partial_t^2 - c^2 partial_x^2 + m^2) phi = 0  $

We use the same ansatz as before,  $ phi(x, t) = e^(i (omega t - k x)) $

Upon substituting this into the dispersed wave equation, we find a new dispersion relation that must be satisfied: 

$ omega^2 = c^2 k^2 + m^2 $

Now if we calculate the phase velocity, we find: 

$ v_p = omega / k = sqrt(c^2 + m^2 / k^2) $

Here we see that #hl[the phase velocity is no longer independent of the frequency or wavelength of the wave, and depends on the wavenumber $k$. This means that different waves with different frequencies and wavelengths will propagate at different speeds.] 


=== Wave Packets 

Now, an important thing to note is that multiple plane-wave solutions of the wave equation that we have seen before can be added together to form a new solution. This comes directly from the property that the wave equation is linear, and so any linear combination of solutions is also a solution. 

Using this, we can construct a new kind of wave, called a *wave packet*, which is essentially a superposition of multiple plane waves. We work with wave packets because they are more localized in space, unlike plane waves which are spread out to infinity. And so in a  way can be a better representation of particles. 

So if particles are represented by wave packets, then instead of dealing with a complicated solution of the wave equation, we can instead decompose it into a superposition of plane waves, and then work with the plane waves instead, which is much easier to handle. 

So to study the evolution of a wave-packet, we can decompose it into plane waves, study the evolution of each plane wave, and then combine them back together to get the evolution of the wave-packet. This applies to how the waveform moves and transforms over time. 

Suppose we consider a wave-packet that is a superposition of plane waves solutions of the dispersed wave equation, then we know from before that each plane wave will have a different phase velocity. This leads to the phenomenon of *dispersion*, where the wave-packet spreads out over time, since different plane waves move at different speeds, which can be seen in the following figures.

#figure(image("images/wave-packet-1.png", width: 100%), caption: [The waveform at $t = 0$])<wave-packet-1.png>

#figure(image("images/wave-packet-2.png", width: 100%), caption: [The waveform at $t = 1$, the wave-packet is lot more dispersed as compared to its initial state])<wave-packet-2.png>

So along with the movement of a wave-packet, we also have the spreading of the wave-packet over time. 

*Note* here that the spreading of the wave-packet does not occur in the classical wave equation, since all plane waves move at the same speed. But in the dispersed wave equation, the spreading occurs since different plane waves move at different speeds.

#theory-box[In the context of modern field theory, the dispersion term is known as the mass term. From there it follows that if we represent a particle as a wave-packet, then we have two kinds of partilces based on whether the wave equation defining the particle has a mass term or not. If the wave equation does not have the mass term, then it is a massless particle (like a photon), and these do not disperse over time since all the component plane waves move at the same speed. If the wave equation has a mass term, then it is a massive particle (like an electron), and these disperse over time since different component plane waves move at different speeds. And in this context, the dispersion of the particle wave-packet corresponds to decay of the particle over time. Additionally the more massive the particle is, the more quickly it disperses, and hence the faster it decays.] 

With the basics of waves out of the way, we can now move on to the lagrangians that describe the dynamics of different fields, and how we can use the wave mechanics to understand their solutions. 


== Free Fields

In this section, we will be discussing four important fields: 

- Free Scalar Field governed by the Klein-Gordon equation 
- Free Spinor Field governed by the Dirac equation
- Free Massive Gauge Field governed by the Proca equation 
- Free Massless Gauge Field governed by the Maxwell equation

which is also diagrammatically described below.
 

#figure(image("images/free-fields-flowchart.png", width: 100%), caption: [Free Fields discussed in this chapter])<free-fields-flowchart.png>


#theory-box[
  Additionally, 

  - The Dirac equation will tell us how left and right chiral spinors constantly oscillate into each other.
  - The Proca equation will tell us that a massive gauge field has only 3 independent degrees of freedom i.e. polarizations.
  - The Maxwell equation will tell us that a massless gauge field has only 2 independent polarizations.
]

#pagebreak()

=== Free Scalar Field

The free scalar field is described by the lagrangian: 

#math-box[$ cal(L) = 1/2 (partial_mu phi)(partial^mu phi) - 1/2 m^2 phi^2 $]

where the first term is called the *kinetic term* and the second term is called the *mass term*.

Using the Euler-Lagrange equations, we can derive the equation of motion for the free scalar field, which is called the *Klein-Gordon equation*: 

#math-box[$ (partial_mu partial^mu + m^2) phi = 0 $]

We can draw an analogy between the free scalar field and a system of coupled harmonic oscillators. #hl[We imagine that at every point in space, there is a harmonic oscillator that can oscillate up and down. The oscillators at different points in space are coupled to each other, so that when one oscillator moves, it affects the neighboring oscillators.] The field strength at each point in space is analogous to the displacement of the harmonic oscillator at that point. 

#theory-box(title:"The mass and mattress analogy")[

Another important aspect of the Klein-Gordon Lagrangian is the meaning of the parameter $m$. In our oscillator picture, the parameter $m$ is directly related to the harmonic restoring force of the spring at each point. Therefore, if we set $m = 0$ we assume that there is no such restoring force and thus no spring at each point. #hl[In other words, if we plug] $m = 0$ #hl[into our Lagrangian, we are dealing with a system of mass points that are connected to their neighbors, while for] $m != 0$ #hl[we describe a system of connected mass points that are pulled back to their equilibrium position through a harmonic force.]

In the continuum limit, our one-dimensional system of coupled mass points becomes a string. For $m = 0$ this string can wiggle freely, while for $m != 0$ there is a restoring force at each point. But note that for $m = 0$ the mass points at each location are eventually also pulled down as a result of their connection to their neighbors, i.e. through string tension.

In intuitive terms, we can imagine that a field with a large mass parameter $m$ is analogous to a hard mattress, while a field with a small mass parameter $m$ is analogous to a soft mattress. This follows because from the oscillator chain perspective, the parameter $m$ is proportional to the stiffness $k$ of the spring at each location.

Moreover, we will learn later that in quantum field theory, the parameter $m$ encodes, in some sense, a lower energy threshold. If too little energy is available, there will be no noticeable excitation in the field. In other words, for fields with a large mass parameter $m$ it is much harder to cause any noticeable field excitation, while a field with small $m$ can be excited quite easily. If there is not enough energy available to excite a field with large $m$, the energy will go into fields with a small mass parameter. Using our mattress picture once again, we can imagine that we need much more energy to cause any noticeable disturbance of a hard mattress, while it is easy to disturb a soft mattress.

]

We can also modify the lagrangian by adding more terms to it, which adds more dynamics to the system, and in most cases it only gives us a small improvement in accuracy. But in high energies, these small improvements can lead to large differences in the dynamics of the system. For example, we can add a term $lambda phi^4$ to the lagrangian, which gives us: 

$ cal(L) = 1/2 (partial_mu phi)(partial^mu phi) - 1/2 m^2 phi^2 - lambda/4! phi^4 $

which actually is the lagrangian related to a process known as spontaneous symmetry breaking, which we will be looking at soon. 

\ 

That brings us to the solutions of the Klein-Gordon equation. We see that the Klein-Gordon equation is just a dispersed wave equation in 4D space-time, and so we can use the same ansatz as before, $ phi(x, t) = e^(i (omega t - k x)) $

and we get the same dispersion relation as before: 

$ omega^2 =  k^2 + m^2 $

Now, we can infact introduce a new 4-vector, the $k^mu$ vector defined by: 

$ k^mu = (omega, arrow(k)) $

This gives us a convenient form where we can write the dispersion relation as: 

$ k_mu k^mu = m^2 $

and also the solution to the Klein-Gordon equation as:

$ phi(x) = e^(plus.minus i k_mu x^mu) $

#theory-box[Since the solutions are complex, we say that the field is complex, i.e. it takes in a 4D space-time point and it spits out a complex number (instead of a normal real number)]

Thus, the general solution to the Klein-Gordon equation can be written as a sum of plane waves, which is a superposition of the solutions we have seen before: 

$ phi(x) = integral (dif^4 k)/ (2 pi)^4 [a(k^mu) e^(i k_mu x^mu) + b(k^mu) e^(-i k_mu x^mu)] $

where $a(k^mu)$ and $b(k^mu)$ are the coefficients that determine the contribution of each plane wave to the overall solution.

Now if we were working with a *real* scalar field, then we would need to enforce the condition that $phi(x)$ is real, which is done by setting: 

$ phi^dagger (x) = phi(x) $

And in doing that, we get: 

$ phi(x) = integral (dif^4 k)/ (2 pi)^4 [a(k^mu) e^(i k_mu x^mu) + a^dagger (k^mu) e^(-i k_mu x^mu)] $

Further, if we are only interested in the positive frequency solutions, we can further simplify this to get the final form of the general solution to the Klein-Gordon equation for a real scalar field:

#math-box[$ phi(x) = integral difp(k) 1/sqrt(2 omega_k) [a(arrow(k)) e^(-i k_mu x^mu) + a^dagger (arrow(k)) e^(i k_mu x^mu)] $]

Note that, $a(arrow(k)) = a(k^mu) slash sqrt(2 omega_k)$

Similarly, for *complex* scalar fields, we can write the general solution as:

#math-box[$ phi(x) = integral difp(k) 1/sqrt(2 omega_k) [a(arrow(k)) e^(-i k_mu x^mu) + b^dagger (arrow(k)) e^(i k_mu x^mu)] $]


\

=== Free Spinor Field

The lagrangian density describing a free spinor field is given by:

$ cal(L) = dash(psi)(x) [i gamma^mu partial_mu - m ] psi(x) $

where $psi(x)$ is the Dirac spinor field, $dash(psi)(x)$ is the conjugated spinor field, $gamma^mu$ are the Dirac gamma matrices, which are all defined below: 


$ dash(psi) (x) = psi^dagger (x) gamma^0 $

#figure(image("images/gamma-matrices.png", width: 60%))<gamma-matrices.png>

and $m$ is the mass of the spinor field.

Based on the gamma matrices, we define the gamma 4-vector as $gamma^mu = (gamma^0, gamma^1, gamma^2, gamma^3)$

Further, the most important property of the gamma matrices is that they satisfy the *Clifford algebra*, which is given by the following *anti-commutation relation*:

#math-box[$ {gamma^mu, gamma^nu} = gamma^mu gamma^nu + gamma^nu gamma^mu = 2 eta^(mu nu) I_(4 times 4) $]

where $eta^(mu nu)$ is the Minkowski metric and $I_(4 times 4)$ is the $4 times 4$ identity matrix.

#theory-box(title: "Dirac basis")[

  Something interesting to note here is that the gamma matrices are not unique, and there are multiple representations of the gamma matrices that satisfy the Clifford algebra. The representation we have used here is called the *Weyl basis* or *chiral basis*, but there is another another basis that we can work with called the *Dirac basis*. 

  Suppose we make a change of basis using a unitary transformation $U$, (i.e. $U^dagger U = I$) then our spinor field transforms as: 

$ psi(x) -> psi^'(x) = U psi(x) "    " dash(psi)(x) -> dash(psi)^'(x) = dash(psi)(x) U^dagger $ 

Substituting this into our lagrangian, we get: 

$ cal(L) = dash(psi)^'(x) [i U^dagger gamma^mu  U partial_mu - m ] psi^'(x) $

Here we can define a new set of gamma matrices as: 

$ gamma^mu^' = U^dagger gamma^mu  U $

which gives us the lagrangian in the new basis as: 

$ cal(L) = dash(psi)^'(x) [i gamma^mu^' partial_mu - m ] psi^'(x) $

When the unitary transformation is chosen as: 

$ U = 1/2 mat(1, 0, 1, 0; 
              0, 1, 0, 1;
              1, 0, -1, 0;
              0, 1, 0, -1) $

Then the basis we are working with is called the *Dirac basis* or the *mass basis*, also often written as the standard representation. In this basis, the gamma matrices are given by: 

$ gamma_0^"dirac" = mat(1, 0, 0, 0; 
                        0, 1, 0, 0;
                        0, 0, -1, 0;
                        0, 0, 0, -1) "   "

  gamma_1^"dirac" = mat(0, 0, 0, 1; 
                        0, 0, 1, 0;
                        0, -1, 0, 0;
                        -1, 0, 0, 0) \ 

  gamma_2^"dirac" = mat(0, 0, 0, -i; 
                        0, 0, i, 0;
                        0, i, 0, 0;
                        -i, 0, 0, 0) "   "

  gamma_3^"dirac" = mat(0, 0, 1, 0; 
                        0, 0, 0, -1;
                        -1, 0, 0, 0;
                        0, 1, 0, 0)                         
$

This is particularly convenient to work with since in the Dirac basis, the gamma matrices can be written as: 

$ gamma^0_"dirac" = mat(I_(2 times 2), 0; 
                        0, -I_(2 times 2)) "   "

  gamma^i_"dirac" = mat(0, sigma^i; 
                        -sigma^i, 0) \ 

$

where $sigma^i$ are the Pauli matrices:

$
sigma^1 = mat(0, 1; 1, 0) "    "
sigma^2 = mat(0, -i; i, 0) "    "
sigma^3 = mat(1, 0; 0, -1)
$

Because of its convenience, *we will be working with the Dirac basis for the rest of this discussion*

]

Going through a similar process, we feed the lagrangian into the Euler-Lagrange equations to get the equation of motion for the spinor field, which is called the *Dirac equation*:

\
#math-box[$ (i gamma^mu partial_mu - m) psi(x) = 0 $]

 \ \
Our next step is to understand the solutions to the Dirac equation. 

#theory-box[
  Before we get into the actual solutions, there is something neat that happens when we play around a little with the Dirac equation. 

  Say we define a new operator defined as $hat(D) = i gamma^mu partial_mu - m $ then the Dirac equation can be written as: 

  $ hat(D) psi(x) = 0 $

  Now, we multiply both sides of the equation by the conjugate operator $hat(D)^dagger = - i gamma^mu partial_mu - m $ to get: 

  $ hat(D)^dagger hat(D) psi(x) = 0 $

  It turns out that on solving this, we end up getting: 

  $ (partial_mu partial^mu + m^2) psi(x) = 0 $

  which is nothing but the Klein-Gordon equation! 
  
  #hl[This is a very important result, since it tells us that the solutions to the Dirac equation are also solutions to the Klein-Gordon equation.]

  And because the Klein-Gordon equation is a dispersed wave equation, the solutions to the Dirac equations must also be in the form of plane waves.
]

We take the ansatz: 

$ psi(x) = psi  e^(-i k_mu x^mu) $

which when we plug into the Dirac equation gives us: 

$ (gamma^mu k_mu - m) psi = 0 $

Substituting the gamma matrices in the Dirac basis, and simplifying, we get: 

$ mat((k_0 - m) I_(2 times 2), - arrow(sigma) dot arrow(k); 
     arrow(sigma) dot arrow(k), (-k_0 - m) I_(2 times 2)) psi = 0 $

where $arrow(sigma) = (sigma^1, sigma^2, sigma^3)$ is the pauli vector. 

Now we substitute that $ psi = mat(chi ; xi) $ where $chi$ is the left chiral spinor and $xi$ is the right chiral spinor, and we get two equations:

$ (arrow(sigma) dot arrow(k)) xi = (k_0 - m) chi \ 
(arrow(sigma) dot arrow(k)) chi = (k_0 + m) xi $

$ => chi = (arrow(sigma) dot arrow(k)) / (k_0 - m) xi  \
=> xi = (arrow(sigma) dot arrow(k)) / (k_0 + m) chi  $

We can further expand $arrow(sigma) dot arrow(k)$ in the Dirac basis to get: 

$ arrow(sigma) dot arrow(k) = mat(k_3, k_1 - i k_2; k_1 + i k_2, -k_3) $

And so our equations then become: 

$ chi = 1/(k_0 - m) mat(k_3, k_1 - i k_2; k_1 + i k_2, -k_3) xi  \
 xi = 1/(k_0 + m) mat(k_3, k_1 - i k_2; k_1 + i k_2, -k_3) chi  $<chi-xi-solns-eqns>

Both the equations are equivalent, and so for obtaining the basis we just consider the second equation. 

Now we saw before that a general weyl spinor can be written as: 

$ chi = a mat(1; 0) + b mat(0; 1) $

where $a$ and $b$ are complex numbers. Then our right chiral spinor can be written as:

$ xi = 1/(k_0 + m) mat(k_3, k_1 - i k_2; k_1 + i k_2, -k_3) (a mat(1; 0) + b mat(0; 1)) $

Simplifying this, we get: 

$ xi = a/(k_0 + m) mat(k_3 ; k_1 + i k_2 ) +  b/(k_0 + m) mat(k_1 - i k_2 ; -k_3) $

Thus our general solution to the Dirac equation can be written as: 

$ psi(x) = mat(chi ; xi) e^(-i k_mu x^mu) = mat(a; b;  (a k_3 + b(k_1 - i k_2))/(k_0 + m) ; (a (k_1 + i k_2) - b k_3)/(k_0 + m)) e^(-i k_mu x^mu) $

Instead of writing it as one big matrix, we can split it and write it as: 

$ psi(x) = a mat(1; 0; k_3/(k_0 + m); (k_1 + i k_2)/(k_0 + m)) e^(-i k_mu x^mu) + b mat(0; 1; (k_1 - i k_2)/(k_0 + m); -k_3/(k_0 + m)) e^(-i k_mu x^mu) $

Here we make a small change in the variables, $a -> c_1$ and $b -> c_2$ and we define the following two spinors: 

$ u_1(k^mu) = mat(1; 0; k_3/(k_0 + m); (k_1 + i k_2)/(k_0 + m)) "   "
u_2(k^mu) = mat(0; 1; (k_1 - i k_2)/(k_0 + m); -k_3/(k_0 + m)) $

Then the general solution to the Dirac equation can be written as: 

$ psi(x) = c_1 u_1(k^mu) e^(-i k_mu x^mu) + c_2 u_2(k^mu) e^(-i k_mu x^mu) = sum_(r=1)^2 c_r u_r (k^mu) e^(-i k_mu x^mu) $


Additionally, we can consider the general plane wave solution to be of the form: 

$ psi(x) = psi e^(i k_mu x^mu) $ 

(here the phase is positive instead of negative) and we can go through the same process to get the general solution as:

$ psi(x) = d_1 mat(k_3/(k_0 + m); (k_1 + i k_2)/(k_0 + m); 1; 0) e^(i k_mu x^mu) + d_2 mat((k_1 - i k_2)/(k_0 + m); -k_3/(k_0 + m); 0; 1) e^(i k_mu x^mu) $

where we write the two spinors: 

$ v_1(k^mu) = mat(k_3/(k_0 + m); (k_1 + i k_2)/(k_0 + m); 1; 0) "   "
v_2(k^mu) = mat((k_1 - i k_2)/(k_0 + m); -k_3/(k_0 + m); 0; 1) $

and our general solution can be written as:

$ psi(x) = d_1 v_1(k^mu) e^(i k_mu x^mu) + d_2 v_2(k^mu) e^(i k_mu x^mu) = sum_(r=1)^2 d_r v_r (k^mu) e^(i k_mu x^mu) $

So our true general solution is a combination of both the positive and negative phase solutions, which can be written as: 

$ psi(x) = sum_(r=1)^2 c_r u_r (k^mu) e^(-i k_mu x^mu) + d_r v_r (k^mu) e^(i k_mu x^mu) $

We convert this into an integral over all possible momenta, and we get the final form of the general solution to the Dirac equation: 

#math-box[$ psi(x) = integral difp(k) 1/sqrt(2 omega_k) sum_(r=1)^2 [c_r (arrow(k)) u_r (k^mu) e^(-i k_mu x^mu) + d_r (arrow(k)) v_r (k^mu) e^(i k_mu x^mu)] $]

Next we look at how a left chiral spinor oscillates into a right chiral spinor and vice versa. 

#theory-box(title:"Chiral Oscillations")[
 
  Consider a particle who is at rest (or we are in the rest frame of the particle). Then the basis spinors in the dirac basis are given by: 

$ u_1(k^mu) = mat(1; 0; 0; 0) "   " u_2(k^mu) = mat(0; 1; 0; 0) "   " v_1(k^mu) = mat(0; 0; 1; 0) "   " v_2(k^mu) = mat(0; 0; 0; 1) $ 

We can convert these into the Weyl basis using the unitary transformation $U$ defined before, and we get: 

$ u_1(k^mu) = 1/2 mat(1; 0; 1; 0) "  " u_2(k^mu) = 1/2 mat(0; 1; 0; 1) "  " v_1(k^mu) = 1/2 mat(1; 0; -1; 0) "  " v_2(k^mu) = 1/2 mat(0; 1; 0; -1) $

Now consider a left chiral spinor having spin-up at time $t = 0$, which can be written as: 

$ psi(0) = mat(1; 0; 0; 0) = 1/2 mat(1; 0; 1; 0) + 1/2 mat(1; 0; -1; 0) = 1/2 u_1(k^mu) + 1/2 v_1(k^mu) $

Then the time evolution of this spinor is given by: 

$ psi(t) = 1/2 u_1(k^mu) e^(-i m t) + 1/2 v_1(k^mu) e^(i m t) = 1/2 mat(1; 0; 1; 0) e^(-i m t) + 1/2 mat(1; 0; -1; 0) e^(i m t) \ = mat(cos(m t); 0; -i sin(m t); 0) $

Which implies, at time $t = pi/(2 m)$, the spinor becomes: 

$ psi(pi/(2 m)) = mat(0; 0; -i; 0) = -i mat(0; 0; 1; 0) $

which is a right chiral spinor with spin-up. 

#hl[This shows that a left chiral up spinor oscillated into a right chiral up spinor]. Given enough time, at $t = pi slash m$ the spinor oscillates back into a left chiral up spinor, and this oscillation continues indefinitely.

At times in between, the spinor is a superposition of left and right chiral spinors. The amount of time it takes for these oscillations depends on the mass $m$ of the spinor. So a massless spinor would never oscillate while something with a large mass would oscillate very quickly. 

This can also be understood via the interactions of the particle with the Higgs field, which is responsible for giving mass to particles. Every time a particle interacts with the Higgs field, it oscillates between left and right chiral spinors, and the heavier the particle is, the more it interacts with the Higgs field, and hence the faster it oscillates. 

#figure(image("images/left-right-oscillations-light.png", width: 70%), caption: [Oscillations from left to right chiral spinors when interacting with the Higgs field])<left-right-oscillations-light.png>

]

\ \

=== Free Gauge Fields

Now, as established from the chapter on gauge fields, we treat the connections (which provide us information on how the "zero-point" or the base coordinate system changes between two neighbouring points) as its own field, which is the *gauge field*. 

Now as we establish the gauge field to be its own thing, we can describe its own dynamics using a lagrangian, which is given by: 

$ cal(L) = -1/2 F_(mu nu) F^(mu nu) + m^2 A_mu A^mu \ 
= -1/2 (partial^mu A^nu partial_mu A_nu - partial^mu A^nu partial_nu A_mu) + m^2 A_mu A^mu $

where $F_(mu nu) = partial_mu A_nu - partial_nu A_mu$ is the field strength tensor, and $A_mu$ is the gauge field.

#theory-box[Do not worry about what the physical meaning of the gauge field is, we will get to that soon. For now just treat the field as a mathematical object that has its own dynamics, and we will see later how it relates to the physical world. And at this point you don't need to think about how the gauge field is related to the connections, we will get to that later as well.]




























#pagebreak()
= Relation between the Gauge Field and electromagnetism

Consider the dirac lagrangian for a free spinor field, which describes the dynamics of particles like electrons: 

$ cal(L) = dash(psi)(x) [i gamma^mu partial_mu - m ] psi(x) $

Now, we see if $psi(x)$ has global phase symmetry, that is if $psi(x) -> e^(i alpha) psi(x)$ then do we observe its effects? (Its called a global phase symmetry because we are introducing a phase shift and the amount of the shift is the same across all points in space-time). 



/////////////////////////////// Research Diary /////////////////////////


#chapter("Research Diary")

= Recreating the light element abundances from BBN 

The first task in my research work is to recreate the light element abundances from Big Bang Nucleosynthesis (BBN). This would set up the foundation for the rest of my work, since I would be doing BBN calculations later on. 

#theory-box[
This entire thing was based on the BBN-simple paper @meador-woodruffBBNsimpleHowBake2024 which also has a lot of the derivations. Here I have just provided the minimal amount, and these notes are more for noting down the steps I took to recreate the results in the paper and the things I learnt along the way.
]

\
*Conversion between quantities in natural units: *

We will be working with natural units, where $c = hbar = k_B = 1$, for a lot of the remaining calculations. So it is worthwhile to note down the conversion between quantities in natural units and SI units. 

$ "Temperature:  " 1 "K" = 8.619 times 10^(-5) "eV" 
\ "Mass:  " 1 "kg" = 5.6096 times 10^(35) "eV" = 5.609 times 10^(26) "GeV"
\ m_p = 1.672 times 10^(-27) "kg" = 0.938 "GeV" 
\ m_e = 9.109 times 10^(-31) "kg" = 0.511 "MeV"
\ m_"Planck" = G^(-1 slash 2) = 1.22 times 10^(19) "GeV"
\ "Time: " 1 "s" = 1.519 times 10^(15) " eV"^(-1)
 $


== Time-Temperature relation in the early universe 

To derive the relationship between time and temperature in the early universe, we start with the previously derived continuity equation (@continuity), which is given by:


$ dot(rho) + 3 H (rho + P) = 0 $

where $rho$ is the energy density (but since we are working in natural units, it is also the mass density), $P$ is the pressure, and $H$ is the Hubble parameter. 

Now, we can write: 

$ (dif T)/(dif t) = (dif T)/(dif rho) dot (dif rho)/(dif t) $

into which we can substitute the continuity equation. 

When $T >> 1$ MeV, all the particles in the universe are relativistic, and so we can write $P = rho slash 3$. So as long as we find $rho$ we are good to go. Moreover, we can write the total energy density as: 

$ rho = sum_i rho_i = pi^2/30 g_* T^4 $

where $g_*$ is the effective number of relativistic degrees of freedom, which for our purposes we take to be $ g_* approx 9 $

Substituting and solving for the temperature, we get: 


$ (T/"MeV")^2 approx 2.42 dot  g_*^(-1slash 2) (t/"1s")^(-1) $


== Photon and Neutrino Temperatures 

We saw before that the neutrinos decouple from the rest of the universe at a temperature of $T approx 1$ MeV. 

Up until that point, i.e. $T >> 1$ MeV, the neutrinos are in thermal equilibrium with the rest of the universe, and so they have the same temperature as the photons. #hl[But as and when the neutrinos decouple (when the temperature starts to drop below $T approx 1$ MeV), the neutrinos are no longer in thermal equilibrium (i.e. they are no longer interacting with the rest of the universe), and so their temperature evolution from then is independent of the photons.] 

Now another important event happens when the temperature drops below 1 MeV, which is the electron-positron annihilation. 

The rest mass of an electron/positron is $m_e = 0.511$ MeV, and so the energy required for a photon to create an electron-positron pair is $E = 2 m_e = 1.022$ MeV. Now when the temperature of the universe is greater than 1 MeV, the photons have enough energy to create electron-positron pairs, and so the photons are in thermal equilibrium with the electrons and positrons, meaning there is no net creation or annihilation of electron-positron pairs (both processes are happening at the same rate). 

But when the temperature drops below 1 MeV, the photons no longer have enough energy to create electron-positron pairs. #hl[And so suddenly there is no more creation of the pairs, just the annihilation of the existing pairs. This leads to a sudden increase in the number of photons, and hence the photon temperature increases.] 

But remember, the neutrinos by this point have already decoupled, so this rise in temperature only shows up in the photons, and not in the neutrinos. 

After some calculations that are detailed in @meador-woodruffBBNsimpleHowBake2024, we get the relationship between the photon and neutrino temperatures as: 

$ (T_gamma)/(T_nu) = (11/4 dot (rho_gamma + P_gamma)/(rho_r + P_r))^(1 slash 3) $

where $rho_r = rho_gamma + rho_(e^-) + rho_(e^+)$ and $P_r = P_gamma + P_(e^-) + P_(e^+)$ 

The above equation has an asymptotic limit of $ (T_gamma)/(T_nu) = (11/4)^(1 slash 3) approx 1.40102 $

But if we were to find the exact evolution of the photon and neutrino temperatures, we would need to solve the equation numerically. 

To do that, we would require the energy density and pressure of the photons and electrons/positrons, as a function of temperature (since we previously derived the relationship between temperature and time, those two can be used interchangable now). The formulae for these relations are taken from @meador-woodruffBBNsimpleHowBake2024 and are provided below: 


$ rho_gamma = pi^2/15 T_gamma^4  "     " P_gamma = 1/3 rho_gamma = pi^2/45 T_gamma^4 $

$ rho_(e^-) + rho_(e^+) = 2/pi^2 T_gamma^4 integral_0^infinity (x^2 sqrt(x^2 + y^2))/(exp(sqrt(x^2 + y^2)) + 1) dif x $

$ P_(e^-) + P_(e^+) = 2/(3pi^2) T_gamma^4 integral_0^infinity (x^4 )/(sqrt(x^2 + y^2)[exp(sqrt(x^2 + y^2)) + 1]) dif x $

where $x = p slash T_gamma$ and $y = m_e slash T_gamma$

We need to employ numerical methods to solve the above integrals. Particularly, we will be using the *Gauss-Laguerre quadrature* method to solve the integrals. 


#theory-box(title:"Gauss-Laguerre Quadrature")[
The Gauss-Laguerre quadrature is a numerical integration method that is particularly useful for integrals of the form: 

$ integral_0^infinity f(x) e^(-x) dif x $

in which case, the integral can be approximated as: 

$ integral_0^infinity f(x) e^(-x) dif x approx sum_(i=1)^n w_i f(x_i) $

where $x_i$ are the roots of the Laguerre polynomial $L_n(x)$ and $w_i$ are the corresponding weights, which are given by: 

$ w_i = x_i / ((n + 1)^2 (L_(n+1)(x_i))^2) $

Here, $n$ is the number of points we want to use for the approximation. The larger the value of $n$, the more accurate the approximation will be but it will also take more time to compute.

Further, if we consider a general integral of the form: 

$ integral_0^infinity f(x) dif x $ 

Clearly, this isn't in the form of the Gauss-Laguerre quadrature, but we can convert it into that form by multiplying and dividing by $e^(-x)$, which gives us: 

$ integral_0^infinity f(x) dif x = integral_0^infinity f(x) e^(x) e^(-x)  dif x = integral_0^infinity [f(x) e^(x)] e^(-x) dif x $

Defining the terms in the brackets as $g(x) = f(x) e^(x)$, we can write the integral as: 

$ integral_0^infinity f(x) dif x = integral_0^infinity g(x) e^(-x) dif x $

]

Using the Gauss-Laguerre quadrature, we can approximate the integrals for the energy density and pressure of the electrons/positrons as: 

$ integral_0^infinity (x^2 sqrt(x^2 + y^2))/(exp(sqrt(x^2 + y^2)) + 1) dif x approx sum_(i=1)^n w_i (x_i^2 sqrt(x_i^2 + y^2))/(exp(sqrt(x_i^2 + y^2)) + 1) e^(x_i) $

$ integral_0^infinity (x^2 )/(sqrt(x^2 + y^2)[exp(sqrt(x^2 + y^2)) + 1]) dif x approx sum_(i=1)^n w_i (x_i^2 )/(sqrt(x_i^2 + y^2)[exp(sqrt(x_i^2 + y^2)) + 1]) e^(x_i) $

where the $x_i$ and $w_i$ are the roots and weights of the Laguerre polynomial $L_n(x)$ respectively. Further an exponential factor of $e^(x_i)$ is multiplied to the integrand to account for the $e^(-x)$ factor in the Gauss-Laguerre quadrature.


=== Time evolution of the photon and neutrino temperatures 

Now that we have the expressions for the energy densities and the pressures of all the components involved (and we know how to calculate them numerically), we can now solve the time evolution of the photon and neutrino temperatures. 

#hl[Here on out we take the photon temperature, $T_gamma$, to be the actual temperature of the universe i.e. $ T = T_gamma $ This is because the photons are in thermal equilibrium with the rest of the universe, and so they are a good representation of the temperature of the universe.] 

Now, we need: 

$ (dif T)/(dif t) = (dif T)/(dif rho) (dif rho)/(dif t) $

Using the continuity equation, we can write: 

$ (dif T)/(dif t) = -3 H (rho + P) (dif T)/(dif rho) $

where $rho = rho_gamma + rho_(e^-) + rho_(e^+)$ and $P = P_gamma + P_(e^-) + P_(e^+)$

So to find this, we need to find $dif T slash dif rho$. Now we can write: 

$ (dif rho)/(dif T) = (dif)/(dif T) (rho_gamma + rho_(e^-) + rho_(e^+)) = (dif rho_gamma)/(dif T) + (dif (rho_(e^-) + rho_(e^+)))/(dif T) $


We know that, 

$ rho_gamma = pi^2/15 T^4 " " => " " (dif rho_gamma)/(dif T) = 4 pi^2/15 T^3 = 4/(T) rho_gamma $

$ rho_(e^-) + rho_(e^+) = 2/pi^2 integral_0^infinity (E(p) dot p^2)/(exp(E(p) slash T) + 1) dif p $

these formulae were taken from @meador-woodruffBBNsimpleHowBake2024, eqn 15 


Further, 

$ dif/(dif T) (rho_(e^-) + rho_(e^+)) = 2/pi^2 integral_0^infinity (E^2(p) dot p^2)/(exp(E(p) slash T) + 1)^2  (exp(E(p) slash T))/(T^2) dif p $

when we apply the change of variables $x = p slash T$ and $y = m_e slash T$, we get: 

$ dif/(dif T) (rho_(e^-) + rho_(e^+)) = 2/pi^2 T^3 integral_0^infinity ((x^2 + y^2) dot x^2)/(exp(sqrt(x^2 + y^2)) + 1)^2  exp(sqrt(x^2 + y^2)) dif x $

which can be solved numerically using the previously discussed Gauss-Laguerre quadrature method. 

Now that we have the expressions constituting $dif rho slash dif T$, we can write the time evolution of the temperature as: 

$ (dif T)/(dif t) = -3 H (rho + P) ((dif rho)/(dif T))^(-1) $ 


Further, we also need a relation between the photon and neutrino temperatures, which is given by:

$ (dif T_nu)/(dif T) = (T_nu)/(3 (rho + P)) ((dif rho)/(dif T)) $

#hl[Solving these two equations simultaneously, we can get the time evolution of the photon and neutrino temperatures.] 

#theory-box[NOTE: I need to check how that neutrino temperature derivative formula came about, where did it come from?]

Performing these calculations, we get the following results for the time evolution of the photon and neutrino temperatures: 

#figure(image("images/photon-neutrino-temp-time-dep.png", width: 80%), caption: [Evolution of Photon and Neutrino temperatures with time])<photon-neutrino-temp-time-dep.png>



///////////////////////////// Bibiography ///////////////////////
#pagebreak()
#bibliography("DM_refs.bib")