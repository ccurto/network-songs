% CTLN_example_14_quasiperiodic_3cycles.m
%
% comments: graph with n-2 overlapping 3-cycles,
% also can be created as a cyclic union of a point, indep set, and point.
% This corresponds to Figure 12 of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_14_quasiperiodic_3cycles.mat

% adjacency matrix 
sA = [ 0  0  0  0  0  0  0  0  0  1; ...
       1  0  0  0  0  0  0  0  0  0; ...
       1  0  0  0  0  0  0  0  0  0; ...
       1  0  0  0  0  0  0  0  0  0; ...
       1  0  0  0  0  0  0  0  0  0; ...
       1  0  0  0  0  0  0  0  0  0; ...
       1  0  0  0  0  0  0  0  0  0; ...
       1  0  0  0  0  0  0  0  0  0; ...
       1  0  0  0  0  0  0  0  0  0; ...
       0  1  1  1  1  1  1  1  1  0 ]; 

% this graph can also be constructed as a cyclic union of 
% a point, an independent set, and a point.
%
% here is code that creates this:
% n = 10;
% graphs = [];
% graphs{1} = 0;  % a singleton
% graphs{2} = zeros(n-2);   % an independent set on n-2 nodes
% graphs{3} = 0;  % a singleton
% sA = make_cyclic_union(graphs);
   
% simulation parameters 
n = 10;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 
theta = 1;   % external drive
T = 100;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.100   0.100   0.000   0.000   0.000   0.000   0.000  ...
              0.000   0.000   0.100];
X0cell{2} = [ 0.100   0.000   0.000   0.100   0.000   0.000   0.000  ...
              0.000   0.000   0.100];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; 

% colors 
colors = [ 0.00 0.50 0.70; 0.15 0.60 0.00; 0.00 0.00 0.00; 0.80 0.00 0.00; ...
           0.00 0.00 0.00; 0.00 0.00 0.00; 0.00 0.00 0.00; 0.00 0.00 0.00; ...
           0.00 0.00 0.00; 0.50 0.50 0.50 ]; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 14;
% ex_name = 'quasiperiodic_3cycles';
% graph_comments = 'graph with n-2 overlapping 3-cycles (cyclic union of pt, indep set, and pt).  from Fig 12 of CTLN preprint.';
% 
% save('examples/CTLN_example_14_quasiperiodic_3cycles.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
