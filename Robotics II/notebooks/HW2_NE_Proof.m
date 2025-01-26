clear all;
clc; 

syms q1 q2 q3 l1 l2 l3 m1 m2 m3 dc1 dc2 dc3 real 
digits(4);

g0 = 9.81; 
g = [g0; 0; 0];
rc1 = [-l1+dc1;0;0];
rc2 = [-l2+dc2;0;0];
rc3 = [-l3+dc3;0;0];

DH = [0 l1 0 q1; 0 l2 0 q2; 0 l3 0 q3]  %[output:2c25c4d3]

zero_A1 = DHMatrix(DH(1,:));
zero_R1 = zero_A1(1:3,1:3);
zero_A2 = DHMatrix(DH(1:2,:));
zero_R2 = zero_A2(1:3,1:3);
zero_A3 = DHMatrix(DH);
zero_R3 = zero_A3(1:3,1:3);

one_A2 = DHMatrix(DH(2,:));
one_R2 = one_A2(1:3,1:3);
two_A3 = DHMatrix(DH(3,:));
two_R3 = two_A3(1:3,1:3);

% Forces f3, f2, f1
f3 = vpa(simplify(-m3*zero_R3.'*g))  %[output:8e38d7c8]
f2 = vpa(simplify(two_R3*f3 -m2*zero_R2.'*g)) %[output:1261b418]
f1 = vpa(simplify(one_R2*f2 -m1*zero_R1.'*g)) %[output:16c44b7e]

% Tau3 
three_r23 = [l3;0;0];
tau3 = vpa(simplify(cross(-f3,(three_r23+rc3)))) %[output:956b6e92]

% Tau2
two_r12 = [l2;0;0];
first_tau2 = vpa(simplify(two_R3*tau3));
second_tau2 = vpa(simplify(cross(two_R3*f3,rc2)));
third_tau2 = vpa(simplify(cross(-f2,(two_r12+rc2))));
tau2 = vpa(simplify(first_tau2+second_tau2+third_tau2)) %[output:2f483444]

% Tau1
one_r01 = [l1;0;0];
first_tau1 = vpa(simplify(one_R2*tau2));
second_tau1 = vpa(simplify(cross(one_R2*f2,rc1)));
third_tau1 = vpa(simplify(-cross(f1,(one_r01+rc1))));
tau1 = vpa(simplify(first_tau1 + second_tau1 + third_tau1)) %[output:1b5f612d]

% u3 
three_z2 = vpa(simplify(two_R3.'*[0;0;1]));
u3 = vpa(simplify(tau3.'*three_z2)) %[output:7e7c52da]

% u2 
two_z1 = vpa(simplify(one_R2.'*[0;0;1]));
u2 = vpa(simplify(tau2.'*two_z1)) %[output:76feba54]

% u1
one_z0 = vpa(simplify(zero_R1.'*[0;0;1]));
u1 = vpa(simplify(tau1.'*one_z0)) %[output:504fd2ad]







%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":51.7}
%---
%[output:2c25c4d3]
%   data: {"dataType":"symbolic","outputData":{"name":"DH","value":"\\left(\\begin{array}{cccc}\n0 & l_1  & 0 & q_1 \\\\\n0 & l_2  & 0 & q_2 \\\\\n0 & l_3  & 0 & q_3 \n\\end{array}\\right)"}}
%---
%[output:8e38d7c8]
%   data: {"dataType":"symbolic","outputData":{"name":"f3","value":"\\left(\\begin{array}{c}\n-9.81\\,m_3 \\,\\cos \\left(q_1 +q_2 +q_3 \\right)\\\\\n9.81\\,m_3 \\,\\sin \\left(q_1 +q_2 +q_3 \\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:1261b418]
%   data: {"dataType":"symbolic","outputData":{"name":"f2","value":"\\left(\\begin{array}{c}\n-9.81\\,\\cos \\left(q_1 +q_2 \\right)\\,{\\left(m_2 +m_3 \\right)}\\\\\n9.81\\,\\sin \\left(q_1 +q_2 \\right)\\,{\\left(m_2 +m_3 \\right)}\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:16c44b7e]
%   data: {"dataType":"symbolic","outputData":{"name":"f1","value":"\\left(\\begin{array}{c}\n-9.81\\,\\cos \\left(q_1 \\right)\\,{\\left(m_1 +m_2 +m_3 \\right)}\\\\\n9.81\\,\\sin \\left(q_1 \\right)\\,{\\left(m_1 +m_2 +m_3 \\right)}\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:956b6e92]
%   data: {"dataType":"symbolic","outputData":{"name":"tau3","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n9.81\\,{\\textrm{dc}}_3 \\,m_3 \\,\\sin \\left(q_1 +q_2 +q_3 \\right)\n\\end{array}\\right)"}}
%---
%[output:2f483444]
%   data: {"dataType":"symbolic","outputData":{"name":"tau2","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n9.81\\,{\\textrm{dc}}_3 \\,m_3 \\,\\sin \\left(q_1 +q_2 +q_3 \\right)+9.81\\,{\\textrm{dc}}_2 \\,m_2 \\,\\sin \\left(q_1 +q_2 \\right)+9.81\\,l_2 \\,m_3 \\,\\sin \\left(q_1 +q_2 \\right)\n\\end{array}\\right)"}}
%---
%[output:1b5f612d]
%   data: {"dataType":"symbolic","outputData":{"name":"tau1","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n9.81\\,{\\textrm{dc}}_1 \\,\\sin \\left(q_1 \\right)\\,{\\left(m_1 +m_2 +m_3 \\right)}+9.81\\,{\\textrm{dc}}_3 \\,m_3 \\,\\sin \\left(q_1 +q_2 +q_3 \\right)-1.0\\,\\sin \\left(q_1 \\right)\\,{\\left(9.81\\,m_2 +9.81\\,m_3 \\right)}\\,{\\left({\\textrm{dc}}_1 -1.0\\,l_1 \\right)}+9.81\\,{\\textrm{dc}}_2 \\,m_2 \\,\\sin \\left(q_1 +q_2 \\right)+9.81\\,l_2 \\,m_3 \\,\\sin \\left(q_1 +q_2 \\right)\n\\end{array}\\right)"}}
%---
%[output:7e7c52da]
%   data: {"dataType":"symbolic","outputData":{"name":"u3","value":"9.81\\,{\\textrm{dc}}_3 \\,m_3 \\,\\sin \\left(q_1 +q_2 +q_3 \\right)"}}
%---
%[output:76feba54]
%   data: {"dataType":"symbolic","outputData":{"name":"u2","value":"9.81\\,{\\textrm{dc}}_3 \\,m_3 \\,\\sin \\left(q_1 +q_2 +q_3 \\right)+9.81\\,{\\textrm{dc}}_2 \\,m_2 \\,\\sin \\left(q_1 +q_2 \\right)+9.81\\,l_2 \\,m_3 \\,\\sin \\left(q_1 +q_2 \\right)"}}
%---
%[output:504fd2ad]
%   data: {"dataType":"symbolic","outputData":{"name":"u1","value":"9.81\\,{\\textrm{dc}}_1 \\,\\sin \\left(q_1 \\right)\\,{\\left(m_1 +m_2 +m_3 \\right)}+9.81\\,{\\textrm{dc}}_3 \\,m_3 \\,\\sin \\left(q_1 +q_2 +q_3 \\right)-1.0\\,\\sin \\left(q_1 \\right)\\,{\\left(9.81\\,m_2 +9.81\\,m_3 \\right)}\\,{\\left({\\textrm{dc}}_1 -1.0\\,l_1 \\right)}+9.81\\,{\\textrm{dc}}_2 \\,m_2 \\,\\sin \\left(q_1 +q_2 \\right)+9.81\\,l_2 \\,m_3 \\,\\sin \\left(q_1 +q_2 \\right)"}}
%---
