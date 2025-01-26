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
sympref('AbbreviateOutput', false);


% Define the symbolic variables
syms q1 q2 q3 q1_dot q2_dot q3_dot q1_ddot q2_ddot q3_ddot real
syms l real

q0 = [0; 0; pi/2];
q_dot0 = [0.8; 0; -0.8];
p_ddot_d = [2; 1];
l_val = 0.5;


% Define the joint positions, velocities and accelerations
q = [q1; q2; q3];
q_dot = [q1_dot; q2_dot; q3_dot];
q_ddot = [q1_ddot; q2_ddot; q3_ddot];

% Define the end-effector position
p = [l*cos(q1) + l*cos(q1 + q2) + l*cos(q1 + q2 + q3);
     l*sin(q1) + l*sin(q1 + q2) + l*sin(q1 + q2 + q3)];

disp('The end-effector position is:') %[output:2cbdc873]
disp(p) %[output:4d129a1a]

% Compute the Jacobian of the end-effector position
% Jacobian of p with respect to q, 2x3 matrix 
% 2-> dimension of p (x,y)
% 3-> dimension of q (q1,q2,q3)
J = jacobian(p, q); 
J = simplify(J);
disp(['The Jacobian of size ', num2str(size(J)), ' is:']) %[output:9045ad6a]
disp(J) %[output:53873e1f]

% Compute the numerical values of the Jacobian
J_num = subs(J, q, q0);
J_num = subs(J_num, l, l_val);
J_num = double(J_num);
disp('The numerical values of the Jacobian are:') %[output:3f009e78]
disp(J_num) %[output:0896f52d]

% The Jacobian is useful for velocity-level control, but we need the
% to compute the acceleration-level command, so we need the Jacobian
% derivative with respect to time.


p_dot = J*q_dot;

disp('The end-effector velocity is:') %[output:329ac04e]
disp(p_dot) %[output:6e0167c2]

% Compute the Jacobian derivative
J_dot = diff(J, q1)*q1_dot + diff(J, q2)*q2_dot + diff(J, q3)*q3_dot;
J_dot = simplify(J_dot);
disp(['The Jacobian derivative of size ', num2str(size(J_dot)), ' is:']); %[output:048a2b9b]
disp(J_dot); %[output:0b646589]

% Compute the numerical values of the Jacobian derivative
J_dot_num = subs(J_dot, [q, q_dot], [q0, q_dot0]);
J_dot_num = subs(J_dot_num, l, l_val);
J_dot_num = double(J_dot_num);
disp('The numerical values of the Jacobian derivative are:') %[output:43b2fd4c]
disp(J_dot_num) %[output:68a4a381]

p_ddot = J_dot*q_dot + J*q_ddot;
disp('The end-effector acceleration is:') %[output:3a0d71b5]
disp(p_ddot) %[output:451d6dbc]

% Solve the equation for q_ddot
q_ddot = solve(p_ddot == p_ddot_d, q_ddot);
disp('The acceleration command q¨ of minimum norm is:') %[output:8af778d4]
disp(q_ddot) %[output:65d2ec9c]

% Substitute the values q1, q2, q3, q1_dot, q2_dot, q3_dot
q_ddot = subs(q_ddot, [q1, q2, q3, q1_dot, q2_dot, q3_dot], [q0', q_dot0']);
q_ddot = subs(q_ddot, l, l_val);
disp('The acceleration command q¨ of minimum norm is:') %[output:328be4f1]
disp(q_ddot) %[output:02c35c44]

% take the first solution of the struct
q_ddot_1 = q_ddot.q1_ddot;
q_ddot_2 = q_ddot.q2_ddot;
q_ddot_3 = q_ddot.q3_ddot;

q_ddot = [q_ddot_1; q_ddot_2; q_ddot_3];

double(q_ddot) %[output:16044505]

% Check the constraints
Vmax = [1.5; 1.5; 1];
Amax = [10; 10; 10];

% The second constraint is not satisfied




%[text] 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":47.3}
%---
%[output:2cbdc873]
%   data: {"dataType":"text","outputData":{"text":"The end-effector position is:\n","truncated":false}}
%---
%[output:4d129a1a]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\nl\\,\\cos \\left(q_1 +q_2 \\right)+l\\,\\cos \\left(q_1 \\right)+l\\,\\cos \\left(q_1 +q_2 +q_3 \\right)\\\\\nl\\,\\sin \\left(q_1 +q_2 \\right)+l\\,\\sin \\left(q_1 \\right)+l\\,\\sin \\left(q_1 +q_2 +q_3 \\right)\n\\end{array}\\right)"}}
%---
%[output:9045ad6a]
%   data: {"dataType":"text","outputData":{"text":"The Jacobian of size 2  3 is:\n","truncated":false}}
%---
%[output:53873e1f]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{ccc}\n-l\\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)+\\sin \\left(q_1 \\right)\\right)} & -l\\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)} & -l\\,\\sin \\left(q_1 +q_2 +q_3 \\right)\\\\\nl\\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)+\\cos \\left(q_1 \\right)\\right)} & l\\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)} & l\\,\\cos \\left(q_1 +q_2 +q_3 \\right)\n\\end{array}\\right)"}}
%---
%[output:3f009e78]
%   data: {"dataType":"text","outputData":{"text":"The numerical values of the Jacobian are:\n","truncated":false}}
%---
%[output:0896f52d]
%   data: {"dataType":"text","outputData":{"text":"  -0.500000000000000  -0.500000000000000  -0.500000000000000\n   1.000000000000000   0.500000000000000                   0\n\n","truncated":false}}
%---
%[output:329ac04e]
%   data: {"dataType":"text","outputData":{"text":"The end-effector velocity is:\n","truncated":false}}
%---
%[output:6e0167c2]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n-l\\,q_{\\dot{1} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)+\\sin \\left(q_1 \\right)\\right)}-l\\,q_{\\dot{3} } \\,\\sin \\left(q_1 +q_2 +q_3 \\right)-l\\,q_{\\dot{2} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)}\\\\\nl\\,q_{\\dot{1} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)+\\cos \\left(q_1 \\right)\\right)}+l\\,q_{\\dot{3} } \\,\\cos \\left(q_1 +q_2 +q_3 \\right)+l\\,q_{\\dot{2} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)}\n\\end{array}\\right)"}}
%---
%[output:048a2b9b]
%   data: {"dataType":"text","outputData":{"text":"The Jacobian derivative of size 2  3 is:\n","truncated":false}}
%---
%[output:0b646589]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{ccc}\n-l\\,q_{\\dot{1} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)+\\cos \\left(q_1 \\right)\\right)}-l\\,q_{\\dot{3} } \\,\\cos \\left(q_1 +q_2 +q_3 \\right)-l\\,q_{\\dot{2} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)} & -l\\,q_{\\dot{3} } \\,\\cos \\left(q_1 +q_2 +q_3 \\right)-l\\,q_{\\dot{1} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)}-l\\,q_{\\dot{2} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)} & -l\\,\\cos \\left(q_1 +q_2 +q_3 \\right)\\,{\\left(q_{\\dot{1} } +q_{\\dot{2} } +q_{\\dot{3} } \\right)}\\\\\n-l\\,q_{\\dot{1} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)+\\sin \\left(q_1 \\right)\\right)}-l\\,q_{\\dot{3} } \\,\\sin \\left(q_1 +q_2 +q_3 \\right)-l\\,q_{\\dot{2} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)} & -l\\,q_{\\dot{3} } \\,\\sin \\left(q_1 +q_2 +q_3 \\right)-l\\,q_{\\dot{1} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)}-l\\,q_{\\dot{2} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)} & -l\\,\\sin \\left(q_1 +q_2 +q_3 \\right)\\,{\\left(q_{\\dot{1} } +q_{\\dot{2} } +q_{\\dot{3} } \\right)}\n\\end{array}\\right)"}}
%---
%[output:43b2fd4c]
%   data: {"dataType":"text","outputData":{"text":"The numerical values of the Jacobian derivative are:\n","truncated":false}}
%---
%[output:68a4a381]
%   data: {"dataType":"text","outputData":{"text":"  -0.800000000000000  -0.400000000000000                   0\n                   0                   0                   0\n\n","truncated":false}}
%---
%[output:3a0d71b5]
%   data: {"dataType":"text","outputData":{"text":"The end-effector acceleration is:\n","truncated":false}}
%---
%[output:451d6dbc]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n-q_{\\dot{1} } \\,{\\left(l\\,q_{\\dot{1} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)+\\cos \\left(q_1 \\right)\\right)}+l\\,q_{\\dot{3} } \\,\\cos \\left(q_1 +q_2 +q_3 \\right)+l\\,q_{\\dot{2} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)}\\right)}-q_{\\dot{2} } \\,{\\left(l\\,q_{\\dot{3} } \\,\\cos \\left(q_1 +q_2 +q_3 \\right)+l\\,q_{\\dot{1} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)}+l\\,q_{\\dot{2} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)}\\right)}-l\\,q_{\\ddot{1} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)+\\sin \\left(q_1 \\right)\\right)}-l\\,q_{\\ddot{3} } \\,\\sin \\left(q_1 +q_2 +q_3 \\right)-l\\,q_{\\ddot{2} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)}-l\\,q_{\\dot{3} } \\,\\cos \\left(q_1 +q_2 +q_3 \\right)\\,{\\left(q_{\\dot{1} } +q_{\\dot{2} } +q_{\\dot{3} } \\right)}\\\\\nl\\,q_{\\ddot{1} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)+\\cos \\left(q_1 \\right)\\right)}-q_{\\dot{2} } \\,{\\left(l\\,q_{\\dot{3} } \\,\\sin \\left(q_1 +q_2 +q_3 \\right)+l\\,q_{\\dot{1} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)}+l\\,q_{\\dot{2} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)}\\right)}-q_{\\dot{1} } \\,{\\left(l\\,q_{\\dot{1} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)+\\sin \\left(q_1 \\right)\\right)}+l\\,q_{\\dot{3} } \\,\\sin \\left(q_1 +q_2 +q_3 \\right)+l\\,q_{\\dot{2} } \\,{\\left(\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)\\right)}\\right)}+l\\,q_{\\ddot{3} } \\,\\cos \\left(q_1 +q_2 +q_3 \\right)+l\\,q_{\\ddot{2} } \\,{\\left(\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)\\right)}-l\\,q_{\\dot{3} } \\,\\sin \\left(q_1 +q_2 +q_3 \\right)\\,{\\left(q_{\\dot{1} } +q_{\\dot{2} } +q_{\\dot{3} } \\right)}\n\\end{array}\\right)"}}
%---
%[output:8af778d4]
%   data: {"dataType":"text","outputData":{"text":"The acceleration command q¨ of minimum norm is:\n","truncated":false}}
%---
%[output:65d2ec9c]
%   data: {"dataType":"text","outputData":{"text":"    q1_ddot: -(2*cos(q1 + q2 + q3) + sin(q1 + q2 + q3) + 2*cos(q1 + q2) + sin(q1 + q2) + l*q1_dot^2*cos(q1 + q2 + q3)^2 + l*q2_dot^2*cos(q1 + q2 + q3)^2 + l*q3_dot^2*cos(q1 + q2 + q3)^2 + l*q1_dot^2*sin(q1 + q2 + q3)^2 + l*q2_dot^2*sin(q1 + q2 + q3)^2…\n    q2_ddot: (2*cos(q1 + q2 + q3) + sin(q1 + q2 + q3) + 2*cos(q1 + q2) + sin(q1 + q2) + 2*cos(q1) + sin(q1) + l*q1_dot^2*cos(q1 + q2 + q3)^2 + l*q2_dot^2*cos(q1 + q2 + q3)^2 + l*q3_dot^2*cos(q1 + q2 + q3)^2 + l*q1_dot^2*sin(q1 + q2 + q3)^2 + l*q2_dot^…\n    q3_ddot: 0\n\n","truncated":false}}
%---
%[output:328be4f1]
%   data: {"dataType":"text","outputData":{"text":"The acceleration command q¨ of minimum norm is:\n","truncated":false}}
%---
%[output:02c35c44]
%   data: {"dataType":"text","outputData":{"text":"    q1_ddot: 182\/25\n    q2_ddot: -314\/25\n    q3_ddot: 0\n\n","truncated":false}}
%---
%[output:16044505]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"ans","rows":3,"type":"double","value":[["7.280000000000000"],["-12.560000000000000"],["0"]]}}
%---
