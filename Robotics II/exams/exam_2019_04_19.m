%% Exercise 1
% 
% Determine which of the following four 2×2 matrices can be, under the 
% stated conditions, the inertia matrix associated to a real 2-dof robot 
% with coordinates q1 and q2, and which not (and why):
%
% M_A = [ a1 + a2*q1^2,  a2;
%         a2,            a2 ];
% % where a1 > a2 > 0
%
% M_B = [ a1,              a3*cos(q2 - q1);
%         a3*cos(q2 - q1), a2 ];
% % where a1 > 0, a1*a2 > a3^2 > 0
%
% M_C = [ a1 + 2*a2*cos(q2),  a1 + a2*cos(q2);
%         a1 + a2*cos(q2),    a1 ];
% % where a1 > 2*a2 > 0
%
% M_D = [ m1 + m2,   -0.5*m2;
%        -0.5*m2,     m2 ];
% % where m1 > 0, m2 > 0
%
% For each case that is feasible, sketch the possible structure of the associated robot.


clc; clear; close all;

disp('Matrix A:')
syms q1 real
syms a1 a2 positive
M_A = [ a1 + a2*q1^2,  a2;
        a2,            a2 ];
is_inertia_matrix(M_A);


disp('Matrix B:')
syms q1 q2 real
syms a1 a2 a3 positive
M_B = [ a1,              a3*cos(q2 - q1);
        a3*cos(q2 - q1), a2 ];
is_inertia_matrix(M_B)
determinant = a1*a2 - a3^2*cos(q1 - q2)^2;
