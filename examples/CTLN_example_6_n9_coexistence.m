% CTLN_example_6_n9_coexistence.m
%
% comments: n=9 coexistence graph; it has two stable fixed points, 
% a limit cycle, and a chaotic attractor.
% This corresponds to Figure 4 of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_6_n9_coexistence.mat

% adjacency matrix 
sA = [ 0  0  0  0  1  0  1  1  1; ...
       1  0  1  0  0  0  0  0  1; ...
       0  0  0  0  1  1  0  0  0; ...
       1  0  1  0  0  0  0  1  0; ...
       0  1  0  1  0  0  0  0  0; ...
       0  1  0  0  1  0  0  0  0; ...
       0  0  0  0  0  0  0  1  0; ...
       1  0  0  1  0  0  1  0  1; ...
       1  0  0  0  0  0  0  1  0 ]; 

% simulation parameters 
n = 9;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 
theta = 1;   % external drive
T = 100;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.000   0.000   0.000   0.100   0.000   0.000   0.100   0.000   0.000];
X0cell{2} = [ 0.100   0.000   0.000   0.000   0.000   0.000   0.000   0.100   0.100];
X0cell{3} = [ 0.000   0.100   0.100   0.000   0.000   0.100   0.000   0.000   0.000];
X0cell{4} = [ 0.000   0.000   0.100   0.100   0.200   0.000   0.000   0.000   0.000];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; 

% colors 
colors = [ 0.80 0.00 0.00; 0.00 0.50 0.70; 0.15 0.60 0.00; 1.00 0.64 0.00; 0.50 0.50 0.50; ...
           0.60 0.40 0.20; 1.00 0.35 0.00; 0.30 0.02 0.46; 0.85 0.25 0.70 ]; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 6;
% ex_name = 'n9_coexistence';
% graph_comments = 'n=9 coexistence graph from Fig 4 of CTLN preprint. This has two stable fps, a limit cycle, and a chaotic attractor.';
%
% save('examples/CTLN_example_6_n9_coexistence.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
