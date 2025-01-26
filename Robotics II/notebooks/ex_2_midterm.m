clear all
clc
syms Ixx Iyy Izz q1 q2 q3 q4 g1 g2 qd1 qd2 qd3 qd4 real
syms l1 l2 l3 l4 dc1 dc2 dc3 dc4 m1 m2 m3 m4 vx vy real
syms qdd1 qdd2 qdd3 qdd4 deltaq T l pdx pdy I1 I2 I3 d k tau1 tau2 real
syms rc1x rc1y rc1z rc2x real
syms a1 a2 a3 a4 a5 real;
syms I1xx I1xy I1xz I1yx I1yy I1yz I1zx I1zy I1zz I2xx I2yy I2zz real
digits(4)
%%
DH=[-pi/2,0,l1,q1; %[output:group:4a28c1ed] %[output:7d52e5e4]
    0,l2,0,q2] %[output:group:4a28c1ed] %[output:7d52e5e4]
r=[[0;-l1;0],[l2;0;0]] %[output:7f1bbe40]
rc=[[rc1x;rc1y;rc1z],[rc2x;0;0]] %[output:019008bb]
m=[m1;m2] %[output:5c17c626]
qd=[qd1;qd2] %[output:9aa24452]
I1=[I1xx,I1xy,I1xz; %[output:group:7b42871c] %[output:07716c46]
    I1yx,I1yy,I1yz; %[output:07716c46]
    I1zx,I1zy,I1zz] %[output:group:7b42871c] %[output:07716c46]
I2=[I2xx,0,0; %[output:group:4c9ea22a] %[output:0ea94655]
    0,I2yy,0; %[output:0ea94655]
    0,0,I2zz] %[output:group:4c9ea22a] %[output:0ea94655]
I=[I1,I2] %[output:826d8a2b]
[w,v,vc,T]=moving_frames_algorithm(2,DH,qd,m,r,rc,[],I) %[output:13e66c68] %[output:3a5712a6] %[output:4abfbfd9] %[output:047c41ba] %[output:60e2950d] %[output:673500f8] %[output:6230fbd5] %[output:9a0b4eec] %[output:2214ffac] %[output:868be7b1] %[output:0c62fd31] %[output:19d87079] %[output:0b087c36] %[output:55c2588d] %[output:04df5d49] %[output:8c632340] %[output:6f7364fb] %[output:93cb18fa] %[output:7cf2086e] %[output:6aa6f7fe] %[output:288b7797] %[output:7c915952] %[output:22fcf113] %[output:5ffab47f] %[output:86c8643d] %[output:705cccfd] %[output:1de6478c] %[output:682db448]
%%
T=T{1}+T{2} %[output:41b069de]
M=simplify(inertia_matrix_from_kinetic_energy(T,qd)) %[output:0c5723ea]
%%

M=[a1+a2*cos(q2)^2+a3*sin(q2)^2,0; %[output:group:22d56e54] %[output:3b981f46]
0,a4] %[output:group:22d56e54] %[output:3b981f46]
[c,C]=inertia_matrix_to_coriolis(M,[q1,q2],[qd1;qd2]) %[output:9a50bef3] %[output:2c0ab5dc] %[output:9a824ff8] %[output:5771ed3c] %[output:2121da18] %[output:9311aaf3] %[output:0559bc52] %[output:0f986e3d] %[output:6549f239] %[output:7c8b4694]
U1=m1*[-9.81;0;0]'*[rc1x;rc1y;rc1z] %[output:6d082688]
U2=m2*([cos(q2),-sin(q2),0; sin(q2),cos(q2),0;0,0,1]'*[-9.81;0;0])'*[rc2x;0;0] %[output:208d56d8]
U=U1+U2 %[output:446436d5]
g=[diff(U,q1);diff(U,q2)] %[output:21032b45]
%%
S1=qd'*C{1} %[output:6f50d20c]
S2=qd'*C{2} %[output:8f9eb833]
S=[S1;S2] %[output:4a07cefc]
Mdot=diff(M,q1)*qd1+diff(M,q2)*qd2 %[output:075eb1a2]
skewsymm=Mdot-2*S %[output:54b40f24]
g=[0;a5*sin(q2)] %[output:070fa81c]
tau=M*[qdd1;qdd2]+c+g %[output:4fd6cb0a]
Y=regressor_matrix(tau,[a1;a2;a3;a4;a5]) %[output:81201573] %[output:7df04ae3]
syms qdd1 qdd2 t real
tau=subs(tau,[q1,q2,qd1,qd2,qdd1,qdd2],[2*t,pi/4,2,0,0,0]) %[output:5b7e3f01]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":49.2}
%---
%[output:7d52e5e4]
%   data: {"dataType":"symbolic","outputData":{"name":"DH","value":"\\left(\\begin{array}{cccc}\n-\\frac{\\pi }{2} & 0 & l_1  & q_1 \\\\\n0 & l_2  & 0 & q_2 \n\\end{array}\\right)"}}
%---
%[output:7f1bbe40]
%   data: {"dataType":"symbolic","outputData":{"name":"r","value":"\\left(\\begin{array}{cc}\n0 & l_2 \\\\\n-l_1  & 0\\\\\n0 & 0\n\\end{array}\\right)"}}
%---
%[output:019008bb]
%   data: {"dataType":"symbolic","outputData":{"name":"rc","value":"\\left(\\begin{array}{cc}\n\\mathrm{rc1x} & \\mathrm{rc2x}\\\\\n\\mathrm{rc1y} & 0\\\\\n\\mathrm{rc1z} & 0\n\\end{array}\\right)"}}
%---
%[output:5c17c626]
%   data: {"dataType":"symbolic","outputData":{"name":"m","value":"\\left(\\begin{array}{c}\nm_1 \\\\\nm_2 \n\\end{array}\\right)"}}
%---
%[output:9aa24452]
%   data: {"dataType":"symbolic","outputData":{"name":"qd","value":"\\left(\\begin{array}{c}\n{\\textrm{qd}}_1 \\\\\n{\\textrm{qd}}_2 \n\\end{array}\\right)"}}
%---
%[output:07716c46]
%   data: {"dataType":"symbolic","outputData":{"name":"I1","value":"\\left(\\begin{array}{ccc}\n\\mathrm{I1xx} & \\mathrm{I1xy} & \\mathrm{I1xz}\\\\\n\\mathrm{I1yx} & \\mathrm{I1yy} & \\mathrm{I1yz}\\\\\n\\mathrm{I1zx} & \\mathrm{I1zy} & \\mathrm{I1zz}\n\\end{array}\\right)"}}
%---
%[output:0ea94655]
%   data: {"dataType":"symbolic","outputData":{"name":"I2","value":"\\left(\\begin{array}{ccc}\n\\mathrm{I2xx} & 0 & 0\\\\\n0 & \\mathrm{I2yy} & 0\\\\\n0 & 0 & \\mathrm{I2zz}\n\\end{array}\\right)"}}
%---
%[output:826d8a2b]
%   data: {"dataType":"symbolic","outputData":{"name":"I","value":"\\left(\\begin{array}{cccccc}\n\\mathrm{I1xx} & \\mathrm{I1xy} & \\mathrm{I1xz} & \\mathrm{I2xx} & 0 & 0\\\\\n\\mathrm{I1yx} & \\mathrm{I1yy} & \\mathrm{I1yz} & 0 & \\mathrm{I2yy} & 0\\\\\n\\mathrm{I1zx} & \\mathrm{I1zy} & \\mathrm{I1zz} & 0 & 0 & \\mathrm{I2zz}\n\\end{array}\\right)"}}
%---
%[output:13e66c68]
%   data: {"dataType":"text","outputData":{"text":"Number of joints: 2\n","truncated":false}}
%---
%[output:3a5712a6]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"v00","rows":3,"type":"double","value":[["0"],["0"],["0"]]}}
%---
%[output:4abfbfd9]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"w00","rows":3,"type":"double","value":[["0"],["0"],["0"]]}}
%---
%[output:047c41ba]
%   data: {"dataType":"symbolic","outputData":{"name":"In","value":"\\left(\\begin{array}{ccc}\n\\mathrm{I1xx} & \\mathrm{I1xy} & \\mathrm{I1xz}\\\\\n\\mathrm{I1yx} & \\mathrm{I1yy} & \\mathrm{I1yz}\\\\\n\\mathrm{I1zx} & \\mathrm{I1zy} & \\mathrm{I1zz}\n\\end{array}\\right)"}}
%---
%[output:60e2950d]
%   data: {"dataType":"symbolic","outputData":{"name":"R","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(q_1 \\right) & 0 & -\\sin \\left(q_1 \\right)\\\\\n\\sin \\left(q_1 \\right) & 0 & \\cos \\left(q_1 \\right)\\\\\n0 & -1 & 0\n\\end{array}\\right)"}}
%---
%[output:673500f8]
%   data: {"dataType":"text","outputData":{"text":"the value of w_1 is:","truncated":false}}
%---
%[output:6230fbd5]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n-{\\textrm{qd}}_1 \\\\\n0\n\\end{array}\\right)"}}
%---
%[output:9a0b4eec]
%   data: {"dataType":"text","outputData":{"text":"The value of v_1 is:","truncated":false}}
%---
%[output:2214ffac]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:868be7b1]
%   data: {"dataType":"text","outputData":{"text":"The value of vc_1 is:","truncated":false}}
%---
%[output:0c62fd31]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n-{\\textrm{qd}}_1 \\,\\mathrm{rc1z}\\\\\n0\\\\\n{\\textrm{qd}}_1 \\,\\mathrm{rc1x}\n\\end{array}\\right)"}}
%---
%[output:19d87079]
%   data: {"dataType":"text","outputData":{"text":"The value of T_1 is:","truncated":false}}
%---
%[output:0b087c36]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\frac{{{\\textrm{qd}}_1 }^2 \\,{\\left(m_1 \\,{\\mathrm{rc1x}}^2 +m_1 \\,{\\mathrm{rc1z}}^2 +\\mathrm{I1yy}\\right)}}{2}"}}
%---
%[output:55c2588d]
%   data: {"dataType":"symbolic","outputData":{"name":"In","value":"\\left(\\begin{array}{ccc}\n\\mathrm{I2xx} & 0 & 0\\\\\n0 & \\mathrm{I2yy} & 0\\\\\n0 & 0 & \\mathrm{I2zz}\n\\end{array}\\right)"}}
%---
%[output:04df5d49]
%   data: {"dataType":"symbolic","outputData":{"name":"R","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(q_2 \\right) & -\\sin \\left(q_2 \\right) & 0\\\\\n\\sin \\left(q_2 \\right) & \\cos \\left(q_2 \\right) & 0\\\\\n0 & 0 & 1\n\\end{array}\\right)"}}
%---
%[output:8c632340]
%   data: {"dataType":"symbolic","outputData":{"name":"w_prev","value":"\\left(\\begin{array}{c}\n0\\\\\n-{\\textrm{qd}}_1 \\\\\n0\n\\end{array}\\right)"}}
%---
%[output:6f7364fb]
%   data: {"dataType":"text","outputData":{"text":"the value of w_2 is:","truncated":false}}
%---
%[output:93cb18fa]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n-{\\textrm{qd}}_1 \\,\\sin \\left(q_2 \\right)\\\\\n-{\\textrm{qd}}_1 \\,\\cos \\left(q_2 \\right)\\\\\n{\\textrm{qd}}_2 \n\\end{array}\\right)"}}
%---
%[output:7cf2086e]
%   data: {"dataType":"text","outputData":{"text":"The value of v_2 is:","truncated":false}}
%---
%[output:6aa6f7fe]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\nl_2 \\,{\\textrm{qd}}_2 \\\\\nl_2 \\,{\\textrm{qd}}_1 \\,\\cos \\left(q_2 \\right)\n\\end{array}\\right)"}}
%---
%[output:288b7797]
%   data: {"dataType":"text","outputData":{"text":"The value of vc_2 is:","truncated":false}}
%---
%[output:7c915952]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n{\\textrm{qd}}_2 \\,{\\left(l_2 +\\mathrm{rc2x}\\right)}\\\\\n{\\textrm{qd}}_1 \\,\\cos \\left(q_2 \\right)\\,{\\left(l_2 +\\mathrm{rc2x}\\right)}\n\\end{array}\\right)"}}
%---
%[output:22fcf113]
%   data: {"dataType":"text","outputData":{"text":"The value of T_2 is:","truncated":false}}
%---
%[output:5ffab47f]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\frac{\\mathrm{I2zz}\\,{{\\textrm{qd}}_2 }^2 }{2}+\\frac{\\mathrm{I2yy}\\,{{\\textrm{qd}}_1 }^2 \\,{\\cos \\left(q_2 \\right)}^2 }{2}+\\frac{\\mathrm{I2xx}\\,{{\\textrm{qd}}_1 }^2 \\,{\\sin \\left(q_2 \\right)}^2 }{2}+\\frac{m_2 \\,{{\\left(l_2 +\\mathrm{rc2x}\\right)}}^2 \\,{\\left({{\\textrm{qd}}_1 }^2 \\,{\\cos \\left(q_2 \\right)}^2 +{{\\textrm{qd}}_2 }^2 \\right)}}{2}"}}
%---
%[output:86c8643d]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"w","rows":3,"type":"double","value":[["0","0"],["0","0"],["0","0"]]}}
%---
%[output:705cccfd]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"v","rows":3,"type":"double","value":[["0","0"],["0","0"],["0","0"]]}}
%---
%[output:1de6478c]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"vc","rows":3,"type":"double","value":[["0","0"],["0","0"],["0","0"]]}}
%---
%[output:682db448]
%   data: {"dataType":"tabular","outputData":{"columnNames":[null,null],"columns":2,"dataTypes":[null,null],"header":"2×2 cell array","name":"T","rows":2,"type":"cell","value":[["(qd1^2*(m1*rc1x^2 + m1*rc1z^2 + I1yy))\/2","[ ]"],["(I2zz*qd2^2)\/2 + (I2yy*qd1^2*cos(q2)^2)\/2 + (I2xx*qd1^2*sin(q2)^2)\/2 + (m2*(l2 + rc2x)^2*(qd1^2*cos(q2)^2 + qd2^2))\/2","[ ]"]]}}
%---
%[output:41b069de]
%   data: {"dataType":"symbolic","outputData":{"name":"T","value":"\\frac{{{\\textrm{qd}}_1 }^2 \\,{\\left(m_1 \\,{\\mathrm{rc1x}}^2 +m_1 \\,{\\mathrm{rc1z}}^2 +\\mathrm{I1yy}\\right)}}{2}+\\frac{\\mathrm{I2zz}\\,{{\\textrm{qd}}_2 }^2 }{2}+\\frac{\\mathrm{I2yy}\\,{{\\textrm{qd}}_1 }^2 \\,{\\cos \\left(q_2 \\right)}^2 }{2}+\\frac{\\mathrm{I2xx}\\,{{\\textrm{qd}}_1 }^2 \\,{\\sin \\left(q_2 \\right)}^2 }{2}+\\frac{m_2 \\,{{\\left(l_2 +\\mathrm{rc2x}\\right)}}^2 \\,{\\left({{\\textrm{qd}}_1 }^2 \\,{\\cos \\left(q_2 \\right)}^2 +{{\\textrm{qd}}_2 }^2 \\right)}}{2}"}}
%---
%[output:0c5723ea]
%   data: {"dataType":"symbolic","outputData":{"name":"M","value":"\\left(\\begin{array}{cc}\n\\mathrm{I1yy}+m_1 \\,{\\mathrm{rc1x}}^2 +m_1 \\,{\\mathrm{rc1z}}^2 +\\mathrm{I2yy}\\,{\\cos \\left(q_2 \\right)}^2 +\\mathrm{I2xx}\\,{\\sin \\left(q_2 \\right)}^2 +m_2 \\,{\\cos \\left(q_2 \\right)}^2 \\,{{\\left(l_2 +\\mathrm{rc2x}\\right)}}^2  & 0\\\\\n0 & \\mathrm{I2zz}+m_2 \\,{{\\left(l_2 +\\mathrm{rc2x}\\right)}}^2 \n\\end{array}\\right)"}}
%---
%[output:3b981f46]
%   data: {"dataType":"symbolic","outputData":{"name":"M","value":"\\left(\\begin{array}{cc}\na_2 \\,{\\cos \\left(q_2 \\right)}^2 +a_3 \\,{\\sin \\left(q_2 \\right)}^2 +a_1  & 0\\\\\n0 & a_4 \n\\end{array}\\right)"}}
%---
%[output:9a50bef3]
%   data: {"dataType":"text","outputData":{"text":"Christoffel matrix for joint 1\nC1 = \n","truncated":false}}
%---
%[output:2c0ab5dc]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{cc}\n0 & a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\\\\na_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right) & 0\n\\end{array}\\right)"}}
%---
%[output:9a824ff8]
%   data: {"dataType":"text","outputData":{"text":"Christoffel matrix for joint 2\nC2 = \n","truncated":false}}
%---
%[output:5771ed3c]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{cc}\na_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right) & 0\\\\\n0 & 0\n\\end{array}\\right)"}}
%---
%[output:2121da18]
%   data: {"dataType":"text","outputData":{"text":"Robot centrifugal and Coriolis terms\nc1 = \n","truncated":false}}
%---
%[output:9311aaf3]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"-2\\,{\\textrm{qd}}_1 \\,{\\textrm{qd}}_2 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)}"}}
%---
%[output:0559bc52]
%   data: {"dataType":"text","outputData":{"text":"c2 = \n","truncated":false}}
%---
%[output:0f986e3d]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"{{\\textrm{qd}}_1 }^2 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)}"}}
%---
%[output:6549f239]
%   data: {"dataType":"symbolic","outputData":{"name":"c","value":"\\left(\\begin{array}{c}\n-2\\,{\\textrm{qd}}_1 \\,{\\textrm{qd}}_2 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)}\\\\\n{{\\textrm{qd}}_1 }^2 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)}\n\\end{array}\\right)"}}
%---
%[output:7c8b4694]
%   data: {"dataType":"tabular","outputData":{"columnNames":[null],"columns":1,"dataTypes":[null],"header":"2×1 cell array","name":"C","rows":2,"type":"cell","value":[["2×2 sym"],["2×2 sym"]]}}
%---
%[output:6d082688]
%   data: {"dataType":"symbolic","outputData":{"name":"U1","value":"-\\frac{981\\,m_1 \\,\\mathrm{rc1x}}{100}"}}
%---
%[output:208d56d8]
%   data: {"dataType":"symbolic","outputData":{"name":"U2","value":"-\\frac{981\\,m_2 \\,\\mathrm{rc2x}\\,\\cos \\left(q_2 \\right)}{100}"}}
%---
%[output:446436d5]
%   data: {"dataType":"symbolic","outputData":{"name":"U","value":"-\\frac{981\\,m_1 \\,\\mathrm{rc1x}}{100}-\\frac{981\\,m_2 \\,\\mathrm{rc2x}\\,\\cos \\left(q_2 \\right)}{100}"}}
%---
%[output:21032b45]
%   data: {"dataType":"symbolic","outputData":{"name":"g","value":"\\left(\\begin{array}{c}\n0\\\\\n\\frac{981\\,m_2 \\,\\mathrm{rc2x}\\,\\sin \\left(q_2 \\right)}{100}\n\\end{array}\\right)"}}
%---
%[output:6f50d20c]
%   data: {"dataType":"symbolic","outputData":{"name":"S1","value":"\\left(\\begin{array}{cc}\n-{\\textrm{qd}}_2 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)} & -{\\textrm{qd}}_1 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)}\n\\end{array}\\right)"}}
%---
%[output:8f9eb833]
%   data: {"dataType":"symbolic","outputData":{"name":"S2","value":"\\left(\\begin{array}{cc}\n{\\textrm{qd}}_1 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)} & 0\n\\end{array}\\right)"}}
%---
%[output:4a07cefc]
%   data: {"dataType":"symbolic","outputData":{"name":"S","value":"\\left(\\begin{array}{cc}\n-{\\textrm{qd}}_2 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)} & -{\\textrm{qd}}_1 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)}\\\\\n{\\textrm{qd}}_1 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)} & 0\n\\end{array}\\right)"}}
%---
%[output:075eb1a2]
%   data: {"dataType":"symbolic","outputData":{"name":"Mdot","value":"\\left(\\begin{array}{cc}\n-{\\textrm{qd}}_2 \\,{\\left(2\\,a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-2\\,a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)} & 0\\\\\n0 & 0\n\\end{array}\\right)"}}
%---
%[output:54b40f24]
%   data: {"dataType":"symbolic","outputData":{"name":"skewsymm","value":"\\begin{array}{l}\n\\left(\\begin{array}{cc}\n2\\,{\\textrm{qd}}_2 \\,\\sigma_1 -{\\textrm{qd}}_2 \\,{\\left(2\\,a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-2\\,a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)} & 2\\,{\\textrm{qd}}_1 \\,\\sigma_1 \\\\\n-2\\,{\\textrm{qd}}_1 \\,\\sigma_1  & 0\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\n\\end{array}"}}
%---
%[output:070fa81c]
%   data: {"dataType":"symbolic","outputData":{"name":"g","value":"\\left(\\begin{array}{c}\n0\\\\\na_5 \\,\\sin \\left(q_2 \\right)\n\\end{array}\\right)"}}
%---
%[output:4fd6cb0a]
%   data: {"dataType":"symbolic","outputData":{"name":"tau","value":"\\left(\\begin{array}{c}\n{\\textrm{qdd}}_1 \\,{\\left(a_2 \\,{\\cos \\left(q_2 \\right)}^2 +a_3 \\,{\\sin \\left(q_2 \\right)}^2 +a_1 \\right)}-2\\,{\\textrm{qd}}_1 \\,{\\textrm{qd}}_2 \\,{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)}\\\\\n{\\left(a_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)-a_3 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right)\\right)}\\,{{\\textrm{qd}}_1 }^2 +a_4 \\,{\\textrm{qdd}}_2 +a_5 \\,\\sin \\left(q_2 \\right)\n\\end{array}\\right)"}}
%---
%[output:81201573]
%   data: {"dataType":"symbolic","outputData":{"name":"Y","value":"\\left(\\begin{array}{ccccc}\n{\\textrm{qdd}}_1  & {\\textrm{qdd}}_1 \\,{\\cos \\left(q_2 \\right)}^2 -2\\,{\\textrm{qd}}_1 \\,{\\textrm{qd}}_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right) & {\\textrm{qdd}}_1 \\,{\\sin \\left(q_2 \\right)}^2 +2\\,{\\textrm{qd}}_1 \\,{\\textrm{qd}}_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right) & 0 & 0\\\\\n0 & \\frac{{{\\textrm{qd}}_1 }^2 \\,\\sin \\left(2\\,q_2 \\right)}{2} & -\\frac{{{\\textrm{qd}}_1 }^2 \\,\\sin \\left(2\\,q_2 \\right)}{2} & {\\textrm{qdd}}_2  & \\sin \\left(q_2 \\right)\n\\end{array}\\right)"}}
%---
%[output:7df04ae3]
%   data: {"dataType":"symbolic","outputData":{"name":"Y","value":"\\left(\\begin{array}{ccccc}\n{\\textrm{qdd}}_1  & {\\textrm{qdd}}_1 \\,{\\cos \\left(q_2 \\right)}^2 -2\\,{\\textrm{qd}}_1 \\,{\\textrm{qd}}_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right) & {\\textrm{qdd}}_1 \\,{\\sin \\left(q_2 \\right)}^2 +2\\,{\\textrm{qd}}_1 \\,{\\textrm{qd}}_2 \\,\\cos \\left(q_2 \\right)\\,\\sin \\left(q_2 \\right) & 0 & 0\\\\\n0 & \\frac{{{\\textrm{qd}}_1 }^2 \\,\\sin \\left(2\\,q_2 \\right)}{2} & -\\frac{{{\\textrm{qd}}_1 }^2 \\,\\sin \\left(2\\,q_2 \\right)}{2} & {\\textrm{qdd}}_2  & \\sin \\left(q_2 \\right)\n\\end{array}\\right)"}}
%---
%[output:5b7e3f01]
%   data: {"dataType":"symbolic","outputData":{"name":"tau","value":"\\left(\\begin{array}{c}\n0\\\\\n2\\,a_2 -2\\,a_3 +\\frac{\\sqrt{2}\\,a_5 }{2}\n\\end{array}\\right)"}}
%---
