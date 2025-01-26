clear all
clc
syms Ixx Iyy Izz q1 q2 q3 q4 g1 g2 qd1 qd2 qd3 qd4 real
syms l1 l2 l3 l4 dc1 dc2 dc3 dc4 m1 m2 m3 m4 vx vy real
syms a1 a2 a3 a4 a5 a6 th thd m I rc1x rc2x rc1y rc2y I3 I4 real
syms qdd1 qdd2 qdd3 qdd4 deltaq T l pdx pdy I1 I2 I3 d k tau1 tau2 real
syms Iyy1 Ixx2 Iyy2 Izz2 rdot real
digits(6)
%%
p=[cos(q1+q2+q3)+cos(q1+q2)+cos(q1); %[output:group:992a3c0c] %[output:1aff94e3]
    sin(q1+q2+q3)+sin(q1+q2)+sin(q1)] %[output:group:992a3c0c] %[output:1aff94e3]
j=jacobian(p,[q1,q2,q3]) %[output:4da3085e]
j=subs(j,[q1,q2,q3],[pi/6,pi/6,pi/6]) %[output:10427ff2]
qd=[0;0;0] %[output:711da790]
jdot=diff(j,q1)*qd1+diff(j,q2)*qd2+diff(j,q3)*qd3 %[output:5e35a02b]
pddot=[4;2] %[output:8897fa66]
qdot=simplify(pinv(j)*(pddot-jdot*qd)) %[output:93116713]
q=vpa(subs(qdot,[q1,q2,q3],[pi/6,pi/6,pi/6])) %[output:5058a49a]
pddotnew=pddot-j(:,3)*-4 %[output:65989905]
jnew=j(:,1:2) %[output:16fd57c9]
qddnew=vpa(subs(pinv(jnew)*(pddotnew-jdot(:,1:2)*qd(1:2)),[q1,q2,q3],[pi/6,pi/6,pi/6])) %[output:7cac10fe]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":51.7}
%---
%[output:1aff94e3]
%   data: {"dataType":"symbolic","outputData":{"name":"p","value":"\\left(\\begin{array}{c}\n\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)+\\cos \\left(q_1 \\right)\\\\\n\\sin \\left(q_1 +q_2 +q_3 \\right)+\\sin \\left(q_1 +q_2 \\right)+\\sin \\left(q_1 \\right)\n\\end{array}\\right)"}}
%---
%[output:4da3085e]
%   data: {"dataType":"symbolic","outputData":{"name":"j","value":"\\left(\\begin{array}{ccc}\n-\\sin \\left(q_1 +q_2 +q_3 \\right)-\\sin \\left(q_1 +q_2 \\right)-\\sin \\left(q_1 \\right) & -\\sin \\left(q_1 +q_2 +q_3 \\right)-\\sin \\left(q_1 +q_2 \\right) & -\\sin \\left(q_1 +q_2 +q_3 \\right)\\\\\n\\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right)+\\cos \\left(q_1 \\right) & \\cos \\left(q_1 +q_2 +q_3 \\right)+\\cos \\left(q_1 +q_2 \\right) & \\cos \\left(q_1 +q_2 +q_3 \\right)\n\\end{array}\\right)"}}
%---
%[output:10427ff2]
%   data: {"dataType":"symbolic","outputData":{"name":"j","value":"\\left(\\begin{array}{ccc}\n-\\frac{\\sqrt{3}}{2}-\\frac{3}{2} & -\\frac{\\sqrt{3}}{2}-1 & -1\\\\\n\\frac{\\sqrt{3}}{2}+\\frac{1}{2} & \\frac{1}{2} & 0\n\\end{array}\\right)"}}
%---
%[output:711da790]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"qd","rows":3,"type":"double","value":[["0"],["0"],["0"]]}}
%---
%[output:5e35a02b]
%   data: {"dataType":"symbolic","outputData":{"name":"jdot","value":"\\left(\\begin{array}{ccc}\n0 & 0 & 0\\\\\n0 & 0 & 0\n\\end{array}\\right)"}}
%---
%[output:8897fa66]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"pddot","rows":2,"type":"double","value":[["4"],["2"]]}}
%---
%[output:93116713]
%   data: {"dataType":"symbolic","outputData":{"name":"qdot","value":"\\left(\\begin{array}{c}\n\\frac{18\\,\\sqrt{3}}{11}-\\frac{2}{11}\\\\\n-\\frac{16\\,\\sqrt{3}}{11}-\\frac{8}{11}\\\\\n-\\frac{6\\,\\sqrt{3}}{11}-\\frac{36}{11}\n\\end{array}\\right)"}}
%---
%[output:5058a49a]
%   data: {"dataType":"symbolic","outputData":{"name":"q","value":"\\left(\\begin{array}{c}\n2.65245\\\\\n-3.24662\\\\\n-4.21748\n\\end{array}\\right)"}}
%---
%[output:65989905]
%   data: {"dataType":"symbolic","outputData":{"name":"pddotnew","value":"\\left(\\begin{array}{c}\n0\\\\\n2\n\\end{array}\\right)"}}
%---
%[output:16fd57c9]
%   data: {"dataType":"symbolic","outputData":{"name":"jnew","value":"\\left(\\begin{array}{cc}\n-\\frac{\\sqrt{3}}{2}-\\frac{3}{2} & -\\frac{\\sqrt{3}}{2}-1\\\\\n\\frac{\\sqrt{3}}{2}+\\frac{1}{2} & \\frac{1}{2}\n\\end{array}\\right)"}}
%---
%[output:7cac10fe]
%   data: {"dataType":"symbolic","outputData":{"name":"qddnew","value":"\\left(\\begin{array}{c}\n2.73205\\\\\n-3.4641\n\\end{array}\\right)"}}
%---
