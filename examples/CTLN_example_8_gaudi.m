% CTLN_example_8_gaudi.m
%
% comments: First initial condition gives the Gaudi attractor. 
% Second initial condition is a simple limit cycle.
% This corresponds to Figure 6 of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_8_gaudi.mat

% adjacency matrix 
sA = [ 0  0  0  1  1; ...
       1  0  0  0  1; ...
       1  1  0  0  0; ...
       0  1  1  0  0; ...
       0  0  1  1  0 ]; 

% this graph can also be constructed as a cyclically symmetric graph
% on 5 nodes, where each node sends edges forward to the next 2 nodes
% sA = make_kcyclic_graph(5,2);

% simulation parameters 
n = 5;    % number of neurons 
e = 0.1;  % epsilon value 
d = 0.12;   % delta value 
theta = 1;   % external drive
T = 600;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.150   0.200   0.170   0.190   0.210];
X0cell{2} = [ 0.150   0.100   0.160   0.250   0.280];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; 

% colors 
colors = [ ];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 8;
% ex_name = 'gaudi';
% graph_comments = 'n=5 graph from Fig 6 of CTLN preprint. Gaudi attractor.';
% 
% save('examples/CTLN_example_8_gaudi.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
