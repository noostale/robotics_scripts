% Exercise #1
% The end-effector of a 3R planar robot, having equal link lengths l = 0.5 [m],
% is executing a positional trajectory pd(t) ∈ R^2 in the plane, commanded by
% joint accelerations q¨(t) ∈ R^3 that are updated every Tc = 100 ms.
%
% The robot is subject to the following hard bounds on joint velocities and accelerations:
% |q˙i| ≤ Vmax,i, |q¨i| ≤ Amax,i, for i = 1, 2, 3.
%
% Given the limits:
%   Vmax = [1.5; 1.5; 1] [rad/s]
%   Amax = [10; 10; 10] [rad/s²]
%
% The robot starts at the configuration:
%   q = [0; 0; π/2] [rad]
% with initial velocity:
%   q˙ = [0.8; 0; -0.8] [rad/s]
%
% Compute the acceleration command q¨ of minimum norm that realizes
% the desired end-effector acceleration:
%   p¨d = [2; 1] [m/s²]
%
% while ensuring compliance with the velocity and acceleration constraints.

clear; clc;

% Define the symbolic variables
syms q1 q2 q3 q1_dot q2_dot q3_dot q1_ddot q2_ddot q3_ddot real
syms l real

% Define the joint positions, velocities and accelerations
q = [q1; q2; q3];
q_dot = [q1_dot; q2_dot; q3_dot];
q_ddot = [q1_ddot; q2_ddot; q3_ddot];

% Define the end-effector position
p = [l*cos(q1) + l*cos(q1 + q2) + l*cos(q1 + q2 + q3);
     l*sin(q1) + l*sin(q1 + q2) + l*sin(q1 + q2 + q3)];

disp('The end-effector position is:')
disp(p)

% Compute the Jacobian of the end-effector position
J = jacobian(p, q); % Jacobian of p with respect to q

disp('The Jacobian of the end-effector position is:')
disp(J)

% The Jacobian is useful for velocity-level control, but we need the
% to compute the acceleration-level command, so we need the Jacobian
% derivative with respect to time.


p_dot = J*q_dot;

disp('The end-effector velocity is:')
disp(p_dot)

% Compute the Jacobian derivative
% Jacobian derivative, we do not directly compute it with respect to time since there is a relationship between q ant time so that we can use the chain rule
J_dot = jacobian(p_dot, q)*q_dot;
J_dot = simplify(J_dot);
disp('The Jacobian derivative of the end-effector position is:')
disp(J_dot)



%[text] 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
