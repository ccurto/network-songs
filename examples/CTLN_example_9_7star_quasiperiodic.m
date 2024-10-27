% CTLN_example_9_7star_quasiperiodic.m
%
% comments: n=7 cyclically symmetric tournament with quasiperiodic attractor.
% This corresponds to Figure 7 of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_9_7star_quasiperiodic.mat

% adjacency matrix 
sA = [ 0  0  0  0  1  1  1; ...
       1  0  0  0  0  1  1; ...
       1  1  0  0  0  0  1; ...
       1  1  1  0  0  0  0; ...
       0  1  1  1  0  0  0; ...
       0  0  1  1  1  0  0; ...
       0  0  0  1  1  1  0 ]; 

% this graph can also be constructed as a cyclically symmetric graph
% on 7 nodes, where each node sends edges forward to the next 3 nodes
% sA = make_kcyclic_graph(7,3);
   
   
% simulation parameters 
n = 7;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 
theta = 1;   % external drive
T = 100;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.174   0.160   0.160   0.172   0.169   0.158   0.138];
X0cell{2} = [ 0.156   0.174   0.156   0.151   0.156   0.165   0.130];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ 0.3251  0.1537; 0.1056  0.2810; 0.6110  0.4401; 0.7788  0.5271; 0.4235  0.4574; 0.0908  0.8754; 0.2665  0.5181 ]; 

% colors 
colors = [ 1.00 0.35 0.00; 0.80 0.00 0.00; 0.00 0.50 0.70; 0.15 0.60 0.00; ...
    0.50 0.50 0.50; 0.85 0.25 0.70; 0.60 0.40 0.20 ]; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 9;
% ex_name = '7star_quasiperiodic';
% graph_comments = 'n=7 cyclically symmetric tournament from Fig 7 of CTLN preprint. Quasiperiodic attractor.';
% 
% save('examples/CTLN_example_9_7star_quasiperiodic.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
