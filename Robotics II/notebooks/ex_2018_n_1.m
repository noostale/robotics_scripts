clear all
clc
syms Ixx Iyy Izz q1 q2 q3 q4 g1 g2 qd1 qd2 qd3 qd4 l1 l2 l3 l4 dc1 dc2 dc3 dc4 m1 m2 m3 m4 real
digits(6)
%%
r=[[0;q1;0],[0;q2;0],[l3;0;0],[l4;0;0]] %[output:485a6ad3]
rc=[[0;-dc1;0],[0;-dc2;0],[-l3+dc3;0;0],[-l4+dc4;0;0]] %[output:70ac0db4]
DH=[pi/2,0,q1,pi/2;pi/2,0,q2,pi/2; %[output:group:4c1491d3] %[output:279124ac]
0,l3,0,q3; %[output:279124ac]
0,l4,0,q4] %[output:group:4c1491d3] %[output:279124ac]
[w,v,vc,T]=moving_frames_algorithm(4,DH,[qd1;qd2;qd3;qd4],[m1;m2;m3;m4],r,rc,[1,2]) %[output:4374f455] %[output:912274ed] %[output:7b9bc5bd] %[output:32a176b0] %[output:4c3fa903] %[output:7924bf8e] %[output:6ced8a16] %[output:59dc6689] %[output:7d351a33] %[output:4dd8eedf] %[output:428e3e92] %[output:74444db9] %[output:7266da6b] %[output:9d92fc72] %[output:8b2ebe20] %[output:040ec524] %[output:33f4edc8] %[output:9e53847a] %[output:29f6c07f] %[output:9c68f845] %[output:49cbcc1d] %[output:75e86eb2] %[output:825c58bd] %[output:1f2b65e1] %[output:58b69e4c] %[output:5fa941cb] %[output:7d4a1cec] %[output:0ab188a4] %[output:3f7be19a] %[output:0c4a1f6f] %[output:2d534b12] %[output:225c241a] %[output:4f520e4d] %[output:350fb7b3] %[output:91904d1b] %[output:57774861] %[output:3d898caa] %[output:96cfe0c6] %[output:75dc0b59] %[output:5fce51aa] %[output:497f4bf9] %[output:9ac272ae] %[output:388e1211] %[output:49c05c2a] %[output:0958efbc] %[output:9cf58788] %[output:39b0f577]
T_tot=simplify(T{1}+T{2}+T{3}+T{4}) %[output:0de0086b]
T=(m4*((dc4*qd3 + dc4*qd4 + qd2*cos(q3 + q4) - qd1*sin(q3 + q4) + l3*qd3*cos(q4))^2 + (sin(q4)*(l3*qd3 + qd2*cos(q3) - qd1*sin(q3)) + cos(q4)*(qd1*cos(q3) + qd2*sin(q3)))^2))/2 + (Izz*qd3^2)/2 + (m3*((qd1*cos(q3) + qd2*sin(q3))^2 + (dc3*qd3 + qd2*cos(q3) - qd1*sin(q3))^2))/2 + (m1*qd1^2)/2 + (m2*(qd1^2 + qd2^2))/2 + Izz*(qd3/2 + qd4/2)*(qd3 + qd4) %[output:2561e517]
M=simplify(jacobian(jacobian(T,[qd1,qd2,qd3,qd4]),[qd1,qd2,qd3,qd4])) %[output:3630f79a]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":45}
%---
%[output:485a6ad3]
%   data: {"dataType":"symbolic","outputData":{"name":"r","value":"\\left(\\begin{array}{cccc}\n0 & 0 & l_3  & l_4 \\\\\nq_1  & q_2  & 0 & 0\\\\\n0 & 0 & 0 & 0\n\\end{array}\\right)"}}
%---
%[output:70ac0db4]
%   data: {"dataType":"symbolic","outputData":{"name":"rc","value":"\\left(\\begin{array}{cccc}\n0 & 0 & {\\textrm{dc}}_3 -l_3  & {\\textrm{dc}}_4 -l_4 \\\\\n-{\\textrm{dc}}_1  & -{\\textrm{dc}}_2  & 0 & 0\\\\\n0 & 0 & 0 & 0\n\\end{array}\\right)"}}
%---
%[output:279124ac]
%   data: {"dataType":"symbolic","outputData":{"name":"DH","value":"\\left(\\begin{array}{cccc}\n\\frac{\\pi }{2} & 0 & q_1  & \\frac{\\pi }{2}\\\\\n\\frac{\\pi }{2} & 0 & q_2  & \\frac{\\pi }{2}\\\\\n0 & l_3  & 0 & q_3 \\\\\n0 & l_4  & 0 & q_4 \n\\end{array}\\right)"}}
%---
%[output:4374f455]
%   data: {"dataType":"text","outputData":{"text":"Number of joints: 4\n","truncated":false}}
%---
%[output:912274ed]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"v00","rows":3,"type":"double","value":[["0"],["0"],["0"]]}}
%---
%[output:7b9bc5bd]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"w00","rows":3,"type":"double","value":[["0"],["0"],["0"]]}}
%---
%[output:32a176b0]
%   data: {"dataType":"symbolic","outputData":{"name":"I","value":"\\left(\\begin{array}{ccc}\n\\mathrm{Ixx} & 0 & 0\\\\\n0 & \\mathrm{Iyy} & 0\\\\\n0 & 0 & \\mathrm{Izz}\n\\end{array}\\right)"}}
%---
%[output:4c3fa903]
%   data: {"dataType":"symbolic","outputData":{"name":"R","value":"\\left(\\begin{array}{ccc}\n0 & 0 & 1\\\\\n1 & 0 & 0\\\\\n0 & 1 & 0\n\\end{array}\\right)"}}
%---
%[output:7924bf8e]
%   data: {"dataType":"text","outputData":{"text":"the value of w_1 is:","truncated":false}}
%---
%[output:6ced8a16]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:59dc6689]
%   data: {"dataType":"text","outputData":{"text":"The value of v_1 is:","truncated":false}}
%---
%[output:7d351a33]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n{\\textrm{qd}}_1 \\\\\n0\n\\end{array}\\right)"}}
%---
%[output:4dd8eedf]
%   data: {"dataType":"text","outputData":{"text":"The value of vc_1 is:","truncated":false}}
%---
%[output:428e3e92]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n{\\textrm{qd}}_1 \\\\\n0\n\\end{array}\\right)"}}
%---
%[output:74444db9]
%   data: {"dataType":"text","outputData":{"text":"The value of T_1 is:","truncated":false}}
%---
%[output:7266da6b]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\frac{m_1 \\,{{\\textrm{qd}}_1 }^2 }{2}"}}
%---
%[output:9d92fc72]
%   data: {"dataType":"symbolic","outputData":{"name":"R","value":"\\left(\\begin{array}{ccc}\n0 & 0 & 1\\\\\n1 & 0 & 0\\\\\n0 & 1 & 0\n\\end{array}\\right)"}}
%---
%[output:8b2ebe20]
%   data: {"dataType":"symbolic","outputData":{"name":"w_prev","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:040ec524]
%   data: {"dataType":"text","outputData":{"text":"the value of w_2 is:","truncated":false}}
%---
%[output:33f4edc8]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:9e53847a]
%   data: {"dataType":"text","outputData":{"text":"The value of v_2 is:","truncated":false}}
%---
%[output:29f6c07f]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n{\\textrm{qd}}_1 \\\\\n{\\textrm{qd}}_2 \\\\\n0\n\\end{array}\\right)"}}
%---
%[output:9c68f845]
%   data: {"dataType":"text","outputData":{"text":"The value of vc_2 is:","truncated":false}}
%---
%[output:49cbcc1d]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n{\\textrm{qd}}_1 \\\\\n{\\textrm{qd}}_2 \\\\\n0\n\\end{array}\\right)"}}
%---
%[output:75e86eb2]
%   data: {"dataType":"text","outputData":{"text":"The value of T_2 is:","truncated":false}}
%---
%[output:825c58bd]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\frac{m_2 \\,{\\left({{\\textrm{qd}}_1 }^2 +{{\\textrm{qd}}_2 }^2 \\right)}}{2}"}}
%---
%[output:1f2b65e1]
%   data: {"dataType":"symbolic","outputData":{"name":"R","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(q_3 \\right) & -\\sin \\left(q_3 \\right) & 0\\\\\n\\sin \\left(q_3 \\right) & \\cos \\left(q_3 \\right) & 0\\\\\n0 & 0 & 1\n\\end{array}\\right)"}}
%---
%[output:58b69e4c]
%   data: {"dataType":"symbolic","outputData":{"name":"w_prev","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:5fa941cb]
%   data: {"dataType":"text","outputData":{"text":"the value of w_3 is:","truncated":false}}
%---
%[output:7d4a1cec]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n{\\textrm{qd}}_3 \n\\end{array}\\right)"}}
%---
%[output:0ab188a4]
%   data: {"dataType":"text","outputData":{"text":"The value of v_3 is:","truncated":false}}
%---
%[output:3f7be19a]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n{\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\\\\\nl_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:0c4a1f6f]
%   data: {"dataType":"text","outputData":{"text":"The value of vc_3 is:","truncated":false}}
%---
%[output:2d534b12]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n{\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\\\\\n{\\textrm{dc}}_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:225c241a]
%   data: {"dataType":"text","outputData":{"text":"The value of T_3 is:","truncated":false}}
%---
%[output:4f520e4d]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\frac{\\mathrm{Izz}\\,{{\\textrm{qd}}_3 }^2 }{2}+\\frac{m_3 \\,{\\left({{\\left({\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\\right)}}^2 +{{\\left({\\textrm{dc}}_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\right)}}^2 \\right)}}{2}"}}
%---
%[output:350fb7b3]
%   data: {"dataType":"symbolic","outputData":{"name":"R","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(q_4 \\right) & -\\sin \\left(q_4 \\right) & 0\\\\\n\\sin \\left(q_4 \\right) & \\cos \\left(q_4 \\right) & 0\\\\\n0 & 0 & 1\n\\end{array}\\right)"}}
%---
%[output:91904d1b]
%   data: {"dataType":"symbolic","outputData":{"name":"w_prev","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n{\\textrm{qd}}_3 \n\\end{array}\\right)"}}
%---
%[output:57774861]
%   data: {"dataType":"text","outputData":{"text":"the value of w_4 is:","truncated":false}}
%---
%[output:3d898caa]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n0\\\\\n0\\\\\n{\\textrm{qd}}_3 +{\\textrm{qd}}_4 \n\\end{array}\\right)"}}
%---
%[output:96cfe0c6]
%   data: {"dataType":"text","outputData":{"text":"The value of v_4 is:","truncated":false}}
%---
%[output:75dc0b59]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\begin{array}{l}\n\\left(\\begin{array}{c}\n\\sin \\left(q_4 \\right)\\,\\sigma_1 +\\cos \\left(q_4 \\right)\\,{\\left({\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\\right)}\\\\\nl_4 \\,{\\left({\\textrm{qd}}_3 +{\\textrm{qd}}_4 \\right)}+\\cos \\left(q_4 \\right)\\,\\sigma_1 -\\sin \\left(q_4 \\right)\\,{\\left({\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\\right)}\\\\\n0\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =l_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\n\\end{array}"}}
%---
%[output:5fce51aa]
%   data: {"dataType":"text","outputData":{"text":"The value of vc_4 is:","truncated":false}}
%---
%[output:497f4bf9]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left(\\begin{array}{c}\n\\sin \\left(q_4 \\right)\\,{\\left(l_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\right)}+\\cos \\left(q_4 \\right)\\,{\\left({\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\\right)}\\\\\n{\\textrm{dc}}_4 \\,{\\textrm{qd}}_3 +{\\textrm{dc}}_4 \\,{\\textrm{qd}}_4 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 +q_4 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 +q_4 \\right)+l_3 \\,{\\textrm{qd}}_3 \\,\\cos \\left(q_4 \\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:9ac272ae]
%   data: {"dataType":"text","outputData":{"text":"The value of T_4 is:","truncated":false}}
%---
%[output:388e1211]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\frac{m_4 \\,{\\left({{\\left({\\textrm{dc}}_4 \\,{\\textrm{qd}}_3 +{\\textrm{dc}}_4 \\,{\\textrm{qd}}_4 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 +q_4 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 +q_4 \\right)+l_3 \\,{\\textrm{qd}}_3 \\,\\cos \\left(q_4 \\right)\\right)}}^2 +{{\\left(\\sin \\left(q_4 \\right)\\,{\\left(l_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\right)}+\\cos \\left(q_4 \\right)\\,{\\left({\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\\right)}\\right)}}^2 \\right)}}{2}+\\mathrm{Izz}\\,{\\left(\\frac{{\\textrm{qd}}_3 }{2}+\\frac{{\\textrm{qd}}_4 }{2}\\right)}\\,{\\left({\\textrm{qd}}_3 +{\\textrm{qd}}_4 \\right)}"}}
%---
%[output:49c05c2a]
%   data: {"dataType":"matrix","outputData":{"columns":4,"name":"w","rows":3,"type":"double","value":[["0","0","0","0"],["0","0","0","0"],["0","0","0","0"]]}}
%---
%[output:0958efbc]
%   data: {"dataType":"matrix","outputData":{"columns":4,"name":"v","rows":3,"type":"double","value":[["0","0","0","0"],["0","0","0","0"],["0","0","0","0"]]}}
%---
%[output:9cf58788]
%   data: {"dataType":"matrix","outputData":{"columns":4,"name":"vc","rows":3,"type":"double","value":[["0","0","0","0"],["0","0","0","0"],["0","0","0","0"]]}}
%---
%[output:39b0f577]
%   data: {"dataType":"tabular","outputData":{"columnNames":[null,null,null,null],"columns":4,"dataTypes":[null,null,null,null],"header":"4×4 cell array","name":"T","rows":4,"type":"cell","value":[["(m1*qd1^2)\/2","[ ]","[ ]","[ ]"],["(m2*(qd1^2 + qd2^2))\/2","[ ]","[ ]","[ ]"],["(Izz*qd3^2)\/2 + (m3*((qd1*cos(q3) + qd2*sin(q3))^2 + (dc3*qd3 + qd2*cos(q3) - qd1*sin(q3))^2))\/2","[ ]","[ ]","[ ]"],["(m4*((dc4*qd3 + dc4*qd4 + qd2*cos(q3 + q4) - qd1*sin(q3 + q4) + l3*qd3*cos(q4))^2 + (sin(q4)*(l3*qd3 + qd2*cos(q3) - qd1*sin(q3)) + cos(q4)*(qd1*cos(q3) + qd2*sin(q3)))^2))\/2 + Izz*(qd3\/2 + qd4\/2)*(qd3 + qd4)","[ ]","[ ]","[ ]"]]}}
%---
%[output:0de0086b]
%   data: {"dataType":"symbolic","outputData":{"name":"T_tot","value":"\\begin{array}{l}\n\\frac{m_4 \\,{\\left({{\\left({\\textrm{dc}}_4 \\,{\\textrm{qd}}_3 +{\\textrm{dc}}_4 \\,{\\textrm{qd}}_4 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 +q_4 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 +q_4 \\right)+l_3 \\,{\\textrm{qd}}_3 \\,\\cos \\left(q_4 \\right)\\right)}}^2 +{{\\left(\\sin \\left(q_4 \\right)\\,{\\left(l_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\right)}+\\cos \\left(q_4 \\right)\\,\\sigma_1 \\right)}}^2 \\right)}}{2}+\\frac{\\mathrm{Izz}\\,{{\\textrm{qd}}_3 }^2 }{2}+\\frac{m_3 \\,{\\left({\\sigma_1 }^2 +{{\\left({\\textrm{dc}}_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\right)}}^2 \\right)}}{2}+\\frac{m_1 \\,{{\\textrm{qd}}_1 }^2 }{2}+\\frac{m_2 \\,{\\left({{\\textrm{qd}}_1 }^2 +{{\\textrm{qd}}_2 }^2 \\right)}}{2}+\\mathrm{Izz}\\,{\\left(\\frac{{\\textrm{qd}}_3 }{2}+\\frac{{\\textrm{qd}}_4 }{2}\\right)}\\,{\\left({\\textrm{qd}}_3 +{\\textrm{qd}}_4 \\right)}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 ={\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\n\\end{array}"}}
%---
%[output:2561e517]
%   data: {"dataType":"symbolic","outputData":{"name":"T","value":"\\begin{array}{l}\n\\frac{m_4 \\,{\\left({{\\left({\\textrm{dc}}_4 \\,{\\textrm{qd}}_3 +{\\textrm{dc}}_4 \\,{\\textrm{qd}}_4 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 +q_4 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 +q_4 \\right)+l_3 \\,{\\textrm{qd}}_3 \\,\\cos \\left(q_4 \\right)\\right)}}^2 +{{\\left(\\sin \\left(q_4 \\right)\\,{\\left(l_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\right)}+\\cos \\left(q_4 \\right)\\,\\sigma_1 \\right)}}^2 \\right)}}{2}+\\frac{\\mathrm{Izz}\\,{{\\textrm{qd}}_3 }^2 }{2}+\\frac{m_3 \\,{\\left({\\sigma_1 }^2 +{{\\left({\\textrm{dc}}_3 \\,{\\textrm{qd}}_3 +{\\textrm{qd}}_2 \\,\\cos \\left(q_3 \\right)-{\\textrm{qd}}_1 \\,\\sin \\left(q_3 \\right)\\right)}}^2 \\right)}}{2}+\\frac{m_1 \\,{{\\textrm{qd}}_1 }^2 }{2}+\\frac{m_2 \\,{\\left({{\\textrm{qd}}_1 }^2 +{{\\textrm{qd}}_2 }^2 \\right)}}{2}+\\mathrm{Izz}\\,{\\left(\\frac{{\\textrm{qd}}_3 }{2}+\\frac{{\\textrm{qd}}_4 }{2}\\right)}\\,{\\left({\\textrm{qd}}_3 +{\\textrm{qd}}_4 \\right)}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 ={\\textrm{qd}}_1 \\,\\cos \\left(q_3 \\right)+{\\textrm{qd}}_2 \\,\\sin \\left(q_3 \\right)\n\\end{array}"}}
%---
%[output:3630f79a]
%   data: {"dataType":"symbolic","outputData":{"name":"M","value":"\\begin{array}{l}\n\\left(\\begin{array}{cccc}\nm_1 +m_2 +m_3 +m_4  & 0 & \\sigma_1  & -{\\textrm{dc}}_4 \\,m_4 \\,\\sin \\left(q_3 +q_4 \\right)\\\\\n0 & m_2 +m_3 +m_4  & \\sigma_3  & \\sigma_4 \\\\\n\\sigma_1  & \\sigma_3  & m_3 \\,{{\\textrm{dc}}_3 }^2 +m_4 \\,{{\\textrm{dc}}_4 }^2 +2\\,m_4 \\,\\cos \\left(q_4 \\right)\\,{\\textrm{dc}}_4 \\,l_3 +m_4 \\,{l_3 }^2 +2\\,\\mathrm{Izz} & \\sigma_2 \\\\\n-{\\textrm{dc}}_4 \\,m_4 \\,\\sin \\left(q_3 +q_4 \\right) & \\sigma_4  & \\sigma_2  & m_4 \\,{{\\textrm{dc}}_4 }^2 +\\mathrm{Izz}\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =-{\\textrm{dc}}_3 \\,m_3 \\,\\sin \\left(q_3 \\right)-l_3 \\,m_4 \\,\\sin \\left(q_3 \\right)-{\\textrm{dc}}_4 \\,m_4 \\,\\sin \\left(q_3 +q_4 \\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =\\mathrm{Izz}+{\\textrm{dc}}_4 \\,m_4 \\,{\\left({\\textrm{dc}}_4 +l_3 \\,\\cos \\left(q_4 \\right)\\right)}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 ={\\textrm{dc}}_3 \\,m_3 \\,\\cos \\left(q_3 \\right)+l_3 \\,m_4 \\,\\cos \\left(q_3 \\right)+\\sigma_4 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 ={\\textrm{dc}}_4 \\,m_4 \\,\\cos \\left(q_3 +q_4 \\right)\n\\end{array}"}}
%---
