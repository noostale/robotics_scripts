---
title: Written Exams of Robotics 2
---


# Written Exams of Robotics 2

[Course Materials](http://www.diag.uniroma1.it/deluca/rob2_en/material_rob2_en.html)

_All materials are in English, unless indicated (oldies are in Italian)._

The following is a complete list of exam sessions with dates, number of exercises, topics, notes, and (when available) solutions or MATLAB code references.

---

## 2025-01-13 (2 exercises)

**Topics:**

- **2R polar robot:**
  - Lagrangian dynamics and linear parametrization.
  - All known regulators and their properties.
  - Inverse dynamics torque on a specific trajectory.
  - Adaptive tracking control design.
- **3P planar robot on a 2D task:**
  - Minimum velocity norm and minimum kinetic energy solutions.
  - Mass distribution for a diagonal Cartesian inertia (if possible).


## 2024-11-07 (3 exercises)

**Topics:**

- Dynamic model of a PPR robot in a vertical plane, linear parametrization, and upper bound on the gravity term.
- Inverse dynamics computation for the PPR planar robot for exact execution of a circular trajectory.
- Hybrid force–motion task definition: writing with a ball pen on a flat sheet.


## 2024-09-19 (5 exercises)

**Topics:**

- Dynamic model of an RP robot with base offset and under gravity, with linear parametrization.
- RP robot: integral of generalized momentum on a special joint trajectory.
- Minimization of (twice) the kinetic energy, under constant momentum components, with application to the RP robot.
- RP robot in contact with a compliant wall: hybrid force–position control with linear and decoupled dynamics (using modified impedance scheme).
- RP robot without gravity: inverse dynamics problem and minimum motion time under torque bound.

*Solutions provided.*


## 2024-07-08 (4 exercises)

**Topics:**

- Dynamic model of a spatial PRR robot and its minimal linear parametrization  
  _[was part of 7 Jan 2020, without solution]_
- Redundancy resolution at acceleration level for a 2R planar robot in a one–dimensional task  
  _[modified from 24 Mar 2023, without solution]_
- Dynamic model of a two–mass system with a damped elastic joint under gravity, with design of a stabilizing feedback for regulation and of inverse dynamics torque for trajectory execution  
  _[modified from 19 Oct 2021, without solution]_
- Forced equilibria and local asymptotic stabilization of an underactuated 2R planar robot under gravity (Pendubot).

*Solutions provided.*


## 2024-06-12 (4 exercises)

**Topics:**

- Kinetic energy and inertia matrix of a 3R robot given only via a DH table with linear factorization of inertial terms.
- Redundancy resolution for a 4R planar robot in relative pointing task (nominal or with error) with joint range optimization.
- Proof of global asymptotic stability of a PD motor regulation law for a robot with _n_ elastic joints without gravity.
- Fault detection and identification of a single actuation fault acting on the first joint of a PR robot under gravity.

*Solutions provided.*


## 2024-04-24 (Midterm Test, 4 exercises)

**Topics:**

- **3R planar robot:**
  1. Projected Gradient method at velocity level, with maximization of clearance from an obstacle (*).
  2. Reformulation with Task Priority method (two variants, *).
- **2R spatial robot under gravity:**
  1. Dynamic model and factorization of velocity terms (*).
  2. Linear parametrization with a minimal set of dynamic coefficients (*).
  3. Torque for an inverse dynamics example (*).
  4. Equilibrium configurations.
  5. Mechanical parameters needed to balance the robot under gravity (*).
  6. End–effector acceleration in response to a tip force (*).
- Two computational uses of the recursive Newton–Euler algorithm.
- Maximum instantaneous reduction of the total robot energy under bounded torques:
  - In a generic state with non–zero joint velocity.
  - In a state with *g(q) ≠ 0* and zero joint velocity.

*Solutions provided; MATLAB codes included.*


## 2024-02-16 (4 exercises)

**Topics:**

- Analysis of torque and acceleration limits related to the inertia matrix, with a skewed 2P planar robot example.
- Dynamic model of a (skewed) PPR planar robot, with linear parametrization and feedback linearization for trajectory tracking.
- Sphere–in–hole task description and related hybrid force–velocity control diagram.
- Redundancy resolution for a (skewed) PPR robot commanded in joint velocity, with minimization of the robot kinetic energy.


## 2024-01-24 (3 exercises)

**Topics:**

- State–space equations from the dynamic model, using coordinates *q* and generalized momentum *p* as state variables.
- State–space equations with *x = (q, p)* for the dynamics of an RP planar robot with friction and under gravity (symbolic and numeric).
- Questionnaire with 4 questions.


## 2023-09-11 (1 exam with 6 parts)

**Topics:**

- **4P planar robot in vertical plane:**
  - Dynamic model in joint space.
  - Cartesian inertia.
  - Joint–space regulation with PD+ and analysis.
  - Non–zero joint torque producing no task acceleration.
- Also included:
  - Minimum norm joint torque for a desired task acceleration.
  - Linear parametrization and adaptive control.


## 2023-07-10 (3 exercises)

**Topics:**

- Two proofs on redundant robot dynamics: dynamically consistent decomposition of joint torques and expression of the task dynamics.
- For a RPR planar robot:
  - Inertia matrix, gravity vector, and equilibria.
  - Linear parametrization of the gravity vector.
  - Bound on the gradient of *g(q)*.
- Sphere–in–Hole with natural and artificial constraints, selection matrices, and handling of inconsistent measurements.


## 2023-06-12 (4 exercises)

**Topics:**

- Inertia matrix for a 4R planar robot in absolute coordinates (plus some manipulation and extension).
- Five redundancy resolution schemes for a 4R planar robot with one or two 2–dimensional tasks (possibly with priority).
- Analysis of a PD + gravity compensation law for a PRR robot with balanced third link.
- Reduced dynamics and inversion–based motion and constraining force control of a closed kinematic chain for payload elevation.

*Solutions provided.*


## 2023-04-19 (Midterm Test, 6 exercises)

**Topics:**

- SNS redundancy optimization for a 3R planar robot commanded in acceleration with joint velocity and acceleration bounds.
- Mass and center–of–mass distribution for achieving a structured gravity term in a 3R planar arm.
- Minimization of kinetic energy or joint velocity norm for a 4P planar robot in a redundant task.
- Inertia matrix of a RPR spatial robot (with assigned DH frames and coordinates).
- Symbolic computation of Coriolis and centrifugal terms, with three factorizations for skew–symmetry (or not), and the regressor for a linear parametrization of a 3–dof (RPR) robot with an assigned inertia matrix.
- Minimum–time motion on a rest–to–rest cubic joint trajectory for a vertical PR robot under force/torque input bounds.

*Solutions provided.*


## 2023-03-24 (3 exercises)

**Topics:**

- Dynamic redundancy resolution for a 2R planar robot in a one–dimensional task (symbolic and numeric solutions).
- Adaptive trajectory tracking control of a 2R planar robot, with uniform link mass distribution (as thin rods), uncertain but equal link lengths, and unknown but equal link masses.
- Definition of natural and artificial constraints for a hybrid force–motion task, with a choice of suitable references for the controlled variables.

*Solutions provided.*


## 2023-02-13 (3 exercises)

**Topics:**

- Three dynamic schemes of redundancy resolution for a planar 3R robot with uniform links.
- Minimum–time swing–up for a 1–DOF pendulum along a cubic rest–to–rest trajectory under torque bounds.
- Study of the position regulation of a system with two masses and an intermediate spring, each controlled by a PD or PD+feedforward law.

*Solutions provided.*


## 2023-01-25 (2 exercises)

**Topics:**

- **Planar 2R robot with balanced second link:**
  - Dynamic model with friction and under gravity, with linear parametrization.
  - Minimum gains for regulation under PD+gravity compensation.
  - Adaptive control for trajectory tracking.
  - Minimum–time rest–to–rest transfer under torque bounds keeping the second link fixed (no gravity nor friction).
- Hybrid force–velocity control task of a Cartesian robot in contact with a compliant linear surface.

*Solutions provided.*


## 2022-10-21 (6 exercises)

**Topics:**

_All exercises are related to a PR robot under gravity:_

- Dynamic model.
- Minimal linear parametrization.
- Regulation with PD + constant gravity compensation.
- Computation of the associated initial acceleration.
- Inverse dynamics command along a desired joint trajectory.
- Minimum–time motion under torque bounds along a special prescribed joint path.

*Solutions provided.*


## 2022-09-09 (3 exercises)

**Topics:**

- Constrained minimization of a joint range function for a planar 3R robot (*).
- Task control for a planar 2R robot at the torque level, with specified transients for the errors along tangential/normal directions to the linear path (*).
- Dynamic modeling and design of PID and iterative learning control laws for a two–mass system under gravity (plus dynamic modeling with a flexible cable).

*Solutions provided; MATLAB codes available.*


## 2022-07-08 (3 exercises)

**Topics:**

- Change of coordinates in the dynamic model of a generic 3R robot so as to match the work of the actuating torques (*).
- Reduced dynamics and control problem for a generic robot with the first joint variable constrained (*, with *q₁ = k*).
- Minimum–time rest–to–rest motion of a Cartesian PP robot under gravity and with bounded input forces (*).

*Solutions provided; MATLAB codes available.*


## 2022-06-10 (4 exercises)

**Topics:**

- Adaptive control of a PR robot on the horizontal plane with regressor *Y*, given *M(q)* (*).
- Algorithmic singularities for a planar 4R micro–macro robot performing two tasks, and its task–priority solution (*).
- Natural impedance control for elastic joint robots under preliminary joint elastic torque feedback.
- Minimum–time rest–to–rest motion of an actuated pendulum with bounded torque and bang–bang acceleration profile.

*Solutions provided; MATLAB codes available.*


## 2022-04-13 (Midterm Test, 6 exercises)

**Topics:**

- Calibration of link lengths with data for a planar 2R robot.
- Discrete–time redundancy acceleration control minimizing the norm of the next velocity.
- Inertia matrix of a 3R spatial robot (polar robot mounted on a rotating base).
- Projected gradient at velocity level for a planar 3R robot minimizing *H_range* (with joint limits and task scaling).

*Solutions provided.*


### Additional topics (not tied to a specific date):

- Minimum and weighted norm of torques for a PR robot on a 1–dimensional task.
- Gravity term for a vertical PR robot, with a bound on the norm of its gradient.


## 2022-02-03 (3 exercises)

**Topics:**

- Cartesian regulation of a RPR robot under gravity, with minimal factorization of the gravity term and analysis of a singular situation for the control law.
- Minimization of the acceleration norm with a null–space velocity damping in a 4R planar robot, with a 2–dimensional then 3–dimensional augmented task.
- Reduced dynamic model of a constrained planar 2R robot under gravity with only one torque (mimicking an elevator along the y–axis), with inverse dynamics for a static condition and a rest–to–rest motion trajectory.

*Solutions provided.*


## 2022-01-11 (3 exercises)

**Topics:**

- Minimization of kinetic energy and additional obstacle avoidance for a planar RPR robot.
- Joint torque control to smoothly stop a robot (at equilibrium) in time *T* and uniform scaling in the presence of additional acceleration bounds.
- Reduced dynamic model and control of a planar PR robot with its end–effector constrained on a line segment.

*Solutions provided.*


## 2021-10-19 (2 exercises)

**Topics:**

- Robust redundancy resolution for the two–arm DLR Justin robot, for independent or coordinated tasks of the two end–effectors, at the velocity or acceleration level.
- Lagrangian dynamic model of a visco–elastic robot joint, with the design of a stabilizing feedback for regulation and inverse dynamics for trajectory execution.  
  _[Updated version from 23 March 2007]_


## 2021-09-10 (3 exercises)

**Topics:**

- Deceleration control for a planar 3R redundant robot under input bounds (*).
- Cartesian inertia matrix for the same planar 3R redundant robot (*).
- Impedance control design for a 2–dof Cartesian robot without force/torque sensing.

*Solutions provided; MATLAB codes available.*


## 2021-07-12 (3 exercises)

**Topics:**

- Acceleration control problems for a planar 3R robot under input bounds.
- Modeling and analysis of an incipient blocking actuator fault in a robot.
- Dynamic modeling and adaptive control of a planar RPR robot, with partially known dynamic parameters.

*Solutions provided.*


## 2021-06-11 (5 exercises)

**Topics:**

- Weighted pseudoinverse using MATLAB’s `pinv` function (*).
- Dynamic model of an elastically suspended link and two related dynamic problems.
- Guessing a robotic structure from inertial and gravity terms (a 3P portal robot).
- Transformation of generalized forces in two systems of coordinates (planar 3R).
- Trajectory tracking using feedback linearization along a circle, with transient behaviors specified in a time–varying task frame.

*Solutions provided; MATLAB code available.*


## 2021-04-14 (Remote Midterm Test, 3 exercises)

**Topics:**

- Dynamics of a planar 2R robot under gravity whose links have a nonsymmetric center of mass, with its linear parametrization.
- Comparative methods of redundancy resolution at the velocity level in a planar 3R robot performing two tasks (possibly with priority): pseudoinversion of the Extended Jacobian, damped least squares on the Extended Jacobian, and task–priority method.
- Minimum–time motion under bounded inputs for a PR robot tracing a circular path.

*Solutions provided.*


## 2021-02-04 (Remote, 4 exercises)

**Topics:**

- Inertia and gravity terms of an RRPR robot, with their linear parametrization.
- Minimum–time motion on a linear path for two cooperating Cartesian robots under motor torque bounds.
- Dynamic self–motion task for a 3R robot with null–space projection or joint–space decomposition.
- 1–dof force regulation with zero error (using PI control) for a rigid robot and a rigid environment.

*Solutions provided.*


## 2021-01-12 (Remote, 5 exercises)

**Topics:**

- Kinematic control in a self–motion task for a redundant planar 3R robot so as to minimize the potential energy due to gravity.
- Torque control for the same planar 3R robot and self–motion task.
- Dynamic model of a polar RR robot.
- Two dynamic problems for the same polar RR robot: analysis of a steady–state condition and minimal linear parametrization.
- Collision detection, isolation, and identification for a PPR robot in the horizontal plane.

*Solutions provided.*


## 2020-10-23 (Remote, 4 exercises)

**Topics:**

- Regressor for adaptive control of a PR robot moving on a horizontal plane.
- Minimum weighted torque solutions for a 1–dimensional task of the same PR robot.
- Sufficient conditions for asymptotic stability of a PD plus gravity compensation law on the same PR robot in the vertical plane.
- Definition of a force–motion hybrid task for a sphere rolling on a plane while following a desired trajectory of the contact point.

*Solutions provided.*


## 2020-09-11 (Remote, 5 exercises)

**Topics:**

- Control formulation for the simultaneous trajectory execution and obstacle avoidance of a planar 3R robot arm.
- Interaction matrix for the geometric barycenter of three point–features in IBVS, with null–space computation.
- Cartesian inertia matrix of an RP robot, with tip acceleration in response to a force.
- Reduced dynamics for a planar 3R robot under Cartesian constraints on its last link.
- Comparison of torques between feedback linearization and global Lyapunov–based trajectory tracking control laws.

*Solutions provided.*


## 2020-07-15 (Remote, 5 exercises)

**Topics:**

- Inertia matrix of a 4–dof (PRRR) planar robot using absolute coordinates.
- Task–augmented Jacobian for two tasks (on the same 4–dof robot) with minimum norm solutions and analysis of algorithmic singularity.
- Natural and artificial constraints for a hybrid task of moving a cylinder on a plane.
- Uniform time scaling to recover torque feasibility for a 2R robot under gravity.
- Three questions on regulation controllers with specified asymptotic or exponential transients for the errors.

*Solutions provided.*


## 2020-06-05 (Remote, 5 exercises)

**Topics:**

- SNS algorithm under velocity bounds for a 3R robot.
- Analysis of physical conditions for a 2–dof dynamic model.
- Bound on the gradient of the gravity term for an RP robot under gravity with a limited range of the prismatic joint.
- Dynamic modeling and adaptive control for a 2P robot in the vertical plane with joint friction and payload.
- Natural and artificial constraints for the hybrid task of closing a door.

*Solutions provided.*


## 2020-04-15 (Remote Midterm Test)

- **Q10:** Questionnaire with 10 questions, with replies to be elaborated.  
- MATLAB codes (for Q2 to Q9).

*Solutions provided.*


## 2020-02-12 (3 exercises)

**Topics:**

- Dynamic model of a planar RPR robot under gravity, linear parametrization of the gravity vector, and a bound on its gradient.
- Two redundancy resolution problems for the same robot (assuming joint velocity as input).
- A 1–dof force control problem with combinations of P, I, and feedforward laws.


## 2020-01-07 (2 exercises)

**Topics:**

- Dynamic model of a spatial PRR robot, with linear parametrization and adaptive control design.
- Questionnaire with 4 questions.


## 2019-09-11 (3 exercises)

**Topics:**

- Control law to assign a desired dynamic behavior to the robot kinetic energy in the closed–loop system, with application to a 3R robot moving on the horizontal plane.
- Minimum–time motion under joint torque/force bounds for an RP planar arm moving its end–effector along a circular path.
- Impact of two masses, with conservation of kinetic energy and total momentum.

*Solutions provided.*


## 2019-07-11 (3 exercises)

**Topics:**

- Task–priority control of a 3R planar robot for two tasks, with analysis of their compatibility (*).
- Residual vector computation for collision detection and isolation in an RP planar robot.
- Minimum–time motion under torque bound for an actuated pendulum under gravity on a special class of trajectories with bang–coast–bang acceleration profile (*).

*Solutions provided; MATLAB codes available.*


## 2019-06-17 (6 exercises)

**Topics:**

- Gravity term in the dynamic model of the 6–dof Kawasaki S030 robot (with simplified assumptions).
- Check for a 3×3 matrix to be an inertia matrix.
- Comparison of Jacobian pseudoinverse and Jacobian transpose velocity commands in redundant robots.
- Assignment of a linear and decoupled Cartesian error dynamics to a 2R robot in a regulation task.
- Natural and artificial constraints in a hybrid force–velocity control task formulation.

*Solutions provided.*


## 2019-04-29 (Midterm Test, 5 exercises)

**Topics:**

- Check for 2×2 matrices to be inertia matrices.
- Dynamic model of a PRP planar robot and its linear parametrization.
- Gravity term in the dynamic model of an _nR_ planar robot, with equilibrium and balancing conditions.
- Factorizations of the Coriolis/centrifugal terms of a 2–dof robot and a 3–dof robot.

*Solutions provided.*


### Additional topics:

- Execution of a one–dimensional task with a 2R robot, with minimization of its kinetic energy.
- Acceleration resolution for a redundant 3R planar robot under hard joint acceleration constraints.


## 2018-07-11 (4 exercises)

**Topics:**

- Inertia matrix and its linear parametrization for a 2R planar robot with elastic joints.
- Saturated solution for a 4R planar robot executing a Cartesian acceleration under joint acceleration bounds (variant of the SNS algorithm).
- Interaction matrix for the average position of *n* point features.
- Reduced dynamics of a robot under the geometric constraint that a subset of coordinates is constant.

*Solutions provided.*


## 2018-06-11 (3 exercises)

**Topics:**

- Explicit expression of the dynamic terms in the residual vector for collision detection and isolation in an RP robot moving in the vertical plane, and analysis of possible issues in detection/isolation.
- Adaptive control law for a 1–dof actuated pendulum when the current-to-torque drive gain is unknown.
- Feedback/feedforward control schemes for force regulation of a mass in contact through a load cell with a stiff environment: equilibria and stability analyses.

*Solutions provided.*


## 2018-04-26 (Midterm Test, 4 exercises)

**Topics:**

- Dynamic model of a 2P2R planar robot under gravity and its linear parametrization (*).
- Factorizations of the Coriolis/centrifugal terms in a planar 2R robot plus an inverse dynamics problem for the same robot (*).
- General derivation of the Hamiltonian model equations of a robot manipulator, using generalized coordinates *q* and generalized momentum *p* as state variables.
- Minimum–norm velocity solution for a (redundant) PPR planar robot with the associated unit–inconsistency problem, and use of a weighted pseudoinversion to resolve the issue (*).

*Solutions provided; MATLAB codes available.*


## 2018-03-27 (2 exercises)

**Topics:**

- Dynamic model, linear parametrization, approximate linearization, and partial feedback–linearization control of a 2–dof automated crane (with passive swinging link/payload).
- PPR planar robot with end–effector in contact with a linear, frictionless surface: nominal commands for a hybrid force/velocity dynamic task addressing also robot redundancy.

*Solutions provided.*


## 2018-02-05 (3 exercises)

**Topics:**

- Formulation of the task Jacobian and the related kinematic control problem when the task function is the norm of the task error, with application to a visual servoing problem with two point–features.
- Dynamic model of a PRP (cylindrical–like) robot with a horizontal first prismatic axis, and adaptive trajectory tracking control design.
- Iterative learning control of an actuated pendulum (single–link under gravity), with convergence analysis of the PD feedback plus (updated) feedforward law.

*Solutions provided.*


## 2018-01-11 (3 exercises)

**Topics:**

- Redundancy resolution schemes for a planar RP robot in a one–dimensional task.
- Lagrangian dynamics, analysis, and nonlinear control of a Boulton–Watt centrifugal regulator.
- Impedance and force control design alternatives for a single mass subject to an external force.

*Solutions provided.*


## 2016-10-28 (2 exercises)

**Topics:**

- Inertia matrix and gravity vector (with equilibrium configurations) of an RP robot in a vertical plane, with the second prismatic joint axis skewed.
- Dynamic modeling, determination of unforced equilibrium states and steady–state conditions under constant input force, and regulation control for a mechanical system of three masses interconnected by springs with viscous friction.

*Solutions provided.*


## 2016-09-12 (2 exercises)

**Topics:**

- Inertia matrix and gravity vector (with equilibrium configurations) of an RPR robot in a vertical plane.
- Dynamic modeling and determination of the equilibrium states for a mechanical system of two masses interconnected by a nonlinear spring.

*Solutions provided.*


## 2016-07-11 (3 exercises)

**Topics:**

- Dynamic model of a planar 2R robot in absolute coordinates and input torque transformation.
- Task frame and natural/virtual constraints definition for a square peg–in–hole insertion.
- Compliance and force control laws in one contact direction, with robustness analysis.

*Solutions provided.*


## 2016-06-06 (2 exercises)

**Topics:**

- Dynamic modeling of a polar 2R robot and its adaptive trajectory tracking control law.
- All possible regulation control laws for this robot, with their design conditions and stability properties.

  _Only solution provided for Exercise #1._


## 2016-06-01 (Final Test, 1 exercise with 4 parts)

**Topics:**

- Planar 2R robot subject to a single holonomic constraint: reduced dynamic model and its features.
- Equilibrium torques (and associated constraint force).
- Simulation set–up for the reduced model.
- Hybrid force/motion control task.

*Solution provided.*


## 2016-04-13 (Midterm Test, 3 exercises)

**Topics:**

- Inertia matrix and Coriolis/centrifugal terms of a planar PRR robot.
- Gravity vector, its linear parametrization, equilibria, and mechanical balance of a planar 4R robot.
- Singularities of a planar 4R robot for position/orientation tasks, and a joint velocity solution minimizing the distance from the joint range midpoints.

*Solutions provided.*


## 2015-04-15 (2 exercises)

**Topics:**

- Equilibrium configurations, approximate linearization, and regulation control of an RP robot.
- Motion of a planar 3R robot using redundancy to avoid Cartesian obstacles.  
  _[Modified from 2006-07-13, in Italian]_


## 2014-10-27 (2 exercises)

**Topics:**

- Expression of the residual for collision detection and isolation in a planar PRR.
- Maximum contact force (in norm) applied at the tip of a planar PRR robot that can be balanced in the presence of hard bounds on the actuator torques.

*Solutions provided.*


## 2014-09-22 (2 exercises)

**Topics:**

- Dynamic model of a DC motor with elastic transmission, planning of a rest–to–rest trajectory, and its inverse dynamics solution.
- Use of the recursive Newton–Euler algorithm for computing end–effector differential kinematic quantities.


## 2014-07-15 (1 exercise)

**Topics:**

- Analysis of gravity terms and unforced equilibrium configurations for a KUKA LWR with the last three joints frozen.


## 2014-06-10 (2 exercises)

**Topics:**

- Redundancy resolution for a planar 3R robot at the velocity level in the presence of an obstacle.
- Dynamic modeling and control of a two–mass system under gravity and with an elastic transmission.


## 2014-04-02 (2 exercises)

**Topics:**

- Definition of kinematic controllers for the two–arm Justin robot.
- Acceleration analysis for a planar 3R robot subject to an end–effector force.


## 2013-09-19 (1 exercise)

**Topics:**

- Inertia matrix and acceleration analysis for a planar RPPR robot.


## 2013-07-15 (1 exercise)

**Topics:**

- Analysis and estimation of a contact force in three different cases for a planar 3R robot.

*Solution provided.*


## 2013-06-10 (1 exercise)

**Topics:**

- Kinetic energy using the recursive algorithm with moving frames, inertia matrix, and its linear parametrization for a 4–dof robot for which only the DH table is given.


## 2013-02-06 (1 exercise)

**Topics:**

- Reduced dynamic model for a planar RP arm, with its end–effector constrained on a line, and the associated hybrid force/motion regulation law.

*Solution provided.*


## 2013-01-09 (2 exercises)

**Topics:**

- Jacobians for two tasks, algorithmic singularities, and task–priority solution for a planar 3R arm.
- Constrained dynamic model for a planar RP arm, with its end–effector constrained on a line.

*Solutions provided.*


## 2012-07-05 (1 exercise: 2 parts + bonus)

**Topics:**

- Dynamics of a 3–dof portal robot for the aeronautical industry.
- Controller for a regulation task.
- *(Bonus)* Generalized coordinates for the closed kinematic loop.

*Solution provided.*


## 2012-06-11 (2 exercises)

**Topics:**

- Null space of the visual interaction matrix for a point feature  
  _[MATLAB code included]_
- Regulation task for a planar 3R robot subject to a contact force.

*Solutions provided.*


## 2011-09-12 (1 exercise)

**Topics:**

- Gravity balance and PD + constant gravity compensation of a 2R robot in the vertical plane with an additional payload.

*Solution provided.*


## 2011-07-04 (1 exercise)

**Topics:**

- Dynamic modeling and feedback/feedforward force regulation of a two–mass, two–spring system.


## 2011-06-17 (1 exercise)

**Topics:**

- Collision reaction for a 2R planar robot and use of the residual solution.


## 2010-09-15 (1 exercise)

**Topics:**

- Inertia matrix and its minimal linear parametrization for a planar RPR robot.

*Solution provided.*


## 2010-07-07 (1 exercise)

**Topics:**

- Dynamic model of a two–mass/spring/damper system and analysis of a contact force loop.

*Solution provided.*


## 2010-06-15 (1 exercise)

**Topics:**

- Dynamic model of an RP robot under gravity and minimum torque solution for a one–dimensional acceleration task.

*Solution provided.*


## 2009-09-10 (2 exercises)

**Topics:**

- Dynamic control of a linear Cartesian trajectory with decoupled error along the tangential and normal directions to the path.
- Uniform scaling of an unfeasible trajectory with respect to torque constraints (without gravity)  
  _(in Italian)_

*Solutions provided (in Italian).*


## 2009-07-10 (2 exercises)

**Topics:**

- Feasible acceleration region for a 2R planar robot with torque constraints.
- Definition of natural and artificial constraints for a hybrid task and its realizability with a SCARA robot  
  _(in Italian)_

*Solutions provided (in Italian).*


## 2009-06-10 (2 exercises)

**Topics:**

- Inertia matrix of a planar PRP robot.
- Solution with minimum weighted norm of the torque and dynamic control in the task space for redundant robots  
  _(in Italian)_

*Solutions provided (in Italian).*


## 2008-09-11 (1 exercise)

**Topics:**

- Adaptive control of a planar 2R robot with payload and minimal parameterization  
  _(in Italian)_  
  _Sketch of solution provided (in Italian)._


## 2008-03-20 (1 exercise)

**Topics:**

- Dynamic model of a planar PRR robot under gravity and linear parametrization  
  _(in Italian)._


## 2007-09-13 (2 exercises)

**Topics:**

- General structure of the minimal parameterization of the gravity term for planar _nR_ robots.
- Hybrid task of surface finishing on a sphere with a 3P or 3R robot  
  _(in Italian)._


## 2007-04-19 (2 exercises)

**Topics:**

- Dynamic model of a PRP robot under gravity.
- Robot regulation control with assignment of linear error dynamics  
  _(in Italian).*

*Solutions provided (in Italian).*


## 2007-03-23 (2 exercises)

**Topics:**

- Redundancy resolution for the two–arm DLR Justin robot.
- Lagrangian dynamic model of a visco–elastic robot joint  
  _(in Italian)._


## 2006-09-11 (1 exercise)

**Topics:**

- Planar 3R robot: inertia matrix, optimization of manipulability, and minimum–norm joint velocity computation  
  _(in Italian)._


## 2006-07-13 (2 exercises)

**Topics:**

- Equilibrium configurations and approximate linearization of an RP robot.
- Motion of a planar 3R robot among obstacles with Cartesian artificial potentials  
  _(in Italian)._


## 2006-06-30 (2 exercises)

**Topics:**

- End–effector forces and torque at the second joint that produce zero acceleration at the joints of a planar 3R robot under gravity.
- Voronoi diagram  
  _(in Italian)._

  _Only solution provided to Exercise #2 (in Italian)._


## 2005-09-22 (1 exercise)

**Topics:**

- Kinematic control of a mobile manipulator (unicycle + single–link arm)  
  _(in Italian)._


## 2005-04-14 (1 exercise – two parts)

**Topics:**

- Dynamic model of a polar 2R robot; regulation with PD plus constant gravity compensation law  
  _(in Italian)._


## 2005-04-05 (2 exercises)

**Topics:**

- Dynamic model of a planar RP robot, equilibrium configurations under gravity, minimal parameterization, and adaptive control.
- Stabilization of a linear mass in the presence of limited motion range using artificial potentials (Lyapunov proof)  
  _(in Italian)._

*Solutions provided (in Italian).*


## 2004-04-06 (1 exercise)

**Topics:**

- Motion planning with approximate cell decomposition  
  _(in Italian)._

*Solution provided (in Italian).*


## 2004-03-25 (1 exercise)

**Topics:**

- Dynamic model of an offset RP robot under gravity, adaptive control, and partial feedback–linearization of the first joint dynamics when the second joint is passive (or vice versa)  
  _(in Italian)._

*Solution provided (in Italian).*


**Note:** For the problems marked with an asterisk (*) or where MATLAB codes are mentioned, the MATLAB code for computing solutions and/or for graphics is either embedded in the solution text or available to students upon request. Please contact [deluca@diag.uniroma1.it](mailto:deluca@diag.uniroma1.it) for further information.

