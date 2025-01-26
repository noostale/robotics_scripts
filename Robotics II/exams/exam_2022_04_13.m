%% Exercise #1
% We need to calibrate the link lengths of a planar 2R robot, whose nominal 
% values are l1_hat = l2_hat = 1 [m].
% All other kinematic parameters are assumed to be good enough. 
% At four different Denavit-Hartenberg configurations q, the following 
% data (in [m]) for the position p ∈ R^2 of the robot end-effector are 
% collected by an accurate external measurement system:
%
% qa = (0, 0)       ⇒ pa = (2, 0)
% qb = (π/2, 0)     ⇒ pb = (0, 2)
% qc = (π/4, -π/4)  ⇒ pc = (1.6925, 0.7425)
% qd = (0, π/4)     ⇒ pd = (1.7218, 0.6718)
%
% Provide the best estimate of the actual lengths l1 and l2 of the two 
% robot links, using the above information. 
% Is this calibration problem linear or nonlinear?

% This is a calibration problem, in which we need to estimate the actual
% values of the link lengths l1 and l2 of the robot, given the nominal
% values l1_hat = l2_hat = 1 [m] and the measured positions of the
% end-effector at four different configurations q given the measured
% task-space positions p.

clear; clc;

% Define symbolic variables
syms l1 l2 q1 q2 real

% Nominal link lengths (i.e. given to us, but not the actual lengths)
l1_hat = 1;
l2_hat = 1;

% Define forward kinematics equations
p_hat = [l1*cos(q1) + l2*cos(q1 + q2); 
         l1*sin(q1) + l2*sin(q1 + q2)];
disp('The forward kinematics equations are: ');
disp(p_hat);

% Define the given joint configurations (JOINT SPACE)
q_a = [0, 0];
q_b = [pi/2, 0];
q_c = [pi/4, -pi/4];
q_d = [0, pi/4];

% Measured end-effector positions (TASK SPACE)
p_measured_a = [2, 0];
p_measured_b = [0, 2];
p_measured_c = [1.6925, 0.7425];
p_measured_d = [1.7218, 0.6718];

% Compute the Jacobian matrix (Regressor matrix)
Regressor = jacobian(p_hat, [l1, l2]);
disp('The regressor matrix is: ');
disp(Regressor);

% Compute nominal positions using the given nominal lengths
p_nom_a = double(subs(p_hat, {l1, l2, q1, q2}, {l1_hat, l2_hat, q_a(1), q_a(2)}));
p_nom_b = double(subs(p_hat, {l1, l2, q1, q2}, {l1_hat, l2_hat, q_b(1), q_b(2)}));
p_nom_c = double(subs(p_hat, {l1, l2, q1, q2}, {l1_hat, l2_hat, q_c(1), q_c(2)}));
p_nom_d = double(subs(p_hat, {l1, l2, q1, q2}, {l1_hat, l2_hat, q_d(1), q_d(2)}));

% Stack nominal positions into a matrix
P_nominal = [p_nom_a'; p_nom_b'; p_nom_c'; p_nom_d'];
disp('Nominal positions at different configurations: ');
disp(P_nominal);

% Compute the regressor matrices (evaluating the Jacobian for each configuration)
Phi_a = double(subs(Regressor, {l1, l2, q1, q2}, {l1_hat, l2_hat, q_a(1), q_a(2)}));
Phi_b = double(subs(Regressor, {l1, l2, q1, q2}, {l1_hat, l2_hat, q_b(1), q_b(2)}));
Phi_c = double(subs(Regressor, {l1, l2, q1, q2}, {l1_hat, l2_hat, q_c(1), q_c(2)}));
Phi_d = double(subs(Regressor, {l1, l2, q1, q2}, {l1_hat, l2_hat, q_d(1), q_d(2)}));



% Stack regressor matrices into one final regressor matrix
Phi = [Phi_a; Phi_b; Phi_c; Phi_d];
disp('The final regressor matrix is: ');
disp(Phi);

% Compute the error vector Δp
Delta_p = [p_measured_a(:) - p_nom_a(:);
           p_measured_b(:) - p_nom_b(:);
           p_measured_c(:) - p_nom_c(:);
           p_measured_d(:) - p_nom_d(:)];

disp('Error vector Δp:');
disp(Delta_p);

% Solve for Δl using pseudo-inverse
Delta_l = pinv(Phi) * Delta_p;

% Compute updated link lengths
l1_new = l1_hat + Delta_l(1);
l2_new = l2_hat + Delta_l(2);

% Display results
fprintf('Estimated Link Lengths:\n');
fprintf('l1 = %.5f m\n', l1_new);
fprintf('l2 = %.5f m\n', l2_new);

%% Exercise #2
%
% Consider the spatial 3R robot in Fig. 1. Using the D-H generalized coordinates
% defined therein, compute the robot inertia matrix M(q). Assume that the links
% have their center of mass on x1, y2, and x3, respectively, and that the
% barycentric link inertia matrices are diagonal, i.e.,
%
% I_ci = diag([I_ci,xx, I_ci,yy, I_ci,zz]), for i = 1, 2, 3.
%
% Figure 1: A spatial 3R robot, with D-H frames assigned to each link.


% Define the dh_table from the given figure
% - alpha: Link twist (angle between Zi-1 and Zi about Xi-1) [rad] z_prev to z about x_prev
% - a: Link length (distance between Zi-1 and Zi along Xi-1) [m] z_prev to z along x_prev
% - d: Link offset (distance between Xi-1 and Xi along Zi) [m] x_prev to x along z
% - theta: Joint angle (rotation around Zi) [rad] z to z_next
%  i | alpha    , a      , d      , theta
%  1 |   0      , a_1    , 0      , q_1
%  2 |  pi/2    , a_2    , 0      , q_2
%  3 |   0      , a_3    , 0      , q_3


disp(' ');
disp(' ');

% Define the symbolic variables
syms a1 a2 a3 q1 q2 q3 real
syms m1 m2 m3 real

% Define the DH parameters
dh_table = [0, a1, 0, q1;
            pi/2, a2, 0, q2;
            0, a3, 0, q3];

mass = [m1; m2; m3]; % Masses of the links

% Define the CoM positions for each link
P_CoM = [0, 0, 0; % CoM of link 1 at the origin of frame 1
         0, 0, 0; % CoM of link 2 at the origin of frame 2
         0, 0, 0]; % CoM of link 3 at the origin of frame 3

% Define the inertia matrices for each link
I1 = diag(sym('I1_', [1 3]));
I2 = diag(sym('I2_', [1 3]));
I3 = diag(sym('I3_', [1 3]));
inertia = cat(3, I1, I2, I3); % Inertia matrices for each link

% Compute the inertia matrix M(q)
M = inertia_matrix_from_DH(dh_table, mass, inertia, P_CoM);
disp('The inertia matrix M(q) is:');    
disp(M);
