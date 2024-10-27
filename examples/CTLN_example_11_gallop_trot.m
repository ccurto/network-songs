% CTLN_example_11_gallop_trot.m
%
% comments: Gallop/trot. Produces bound (gallop) and trot gaits.
% This corresponds to Figure 10 of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_11_gallop_trot.mat

% adjacency matrix 
sA = [ 0 0 1 1 1 0 1 0; ...
       0 0 1 1 0 1 0 1; ...
       1 1 0 0 0 1 1 0; ...
       1 1 0 0 1 0 0 1; ...
       0 1 1 0 0 0 0 0; ...
       1 0 0 1 0 0 0 0; ...
       0 1 0 1 0 0 0 0; ...
       1 0 1 0 0 0 0 0];

% simulation parameters 
n = 8;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 
theta = 1;   % external drive
T = 60;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.000   0.100   0.100   0.000   0.000   0.000   0.000   0.000];
X0cell{2} = [ 0.000   0.100   0.000   0.100   0.000   0.000   0.000   0.000];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; 

% colors
colors = [ 0.15 0.60 0.00; 0.80 0.00 0.00; 0.00 0.50 0.70; 0.60 0.40 0.20; ...
           0.85 0.85 0.85; 0.85 0.85 0.85; 0.92 0.92 0.74; 0.92 0.92 0.74 ];  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 11;
% ex_name = 'gallop_trot';
% graph_comments = 'n=8 graph from Fig 10 of CTLN preprint. Produces bound (gallop) and trot gaits.';
%
% save('examples/CTLN_example_11_gallop_trot.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
