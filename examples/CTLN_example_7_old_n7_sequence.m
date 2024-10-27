% CTLN_example_7_old_n7_sequence.m
%
% comments: This n=7 graph has an unexpected sequence, not predictable
% from local degree properties.
% This corresponds to Figure 5 of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_7_old_n7_sequence.mat

% adjacency matrix 
sA = [ 0  1  1  1  1  0  0; ...
       0  0  1  0  1  0  1; ...
       0  0  0  0  0  1  1; ...
       0  1  1  0  0  1  0; ...
       0  0  1  1  0  0  0; ...
       1  1  0  0  1  0  1; ...
       1  0  0  1  1  0  0 ]; 

% simulation parameters 
n = 7;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 
theta = 1;   % external drive
T = 60;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.200   0.100   0.300   0.400   0.100   0.400   0.500];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; 

% colors 
colors = [ 1.00 0.35 0.00; 0.80 0.00 0.00; 0.00 0.50 0.70; 0.15 0.60 0.00; ...
    0.50 0.50 0.50; 0.85 0.25 0.70; 0.60 0.40 0.20 ]; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 7;
% ex_name = 'old_n7_sequence';
% graph_comments = 'n=7 graph from Fig 5 of CTLN preprint. Unexpected sequence -- unpredicted by local degree properties.';
%
% save('examples/CTLN_example_7_old_n7_sequence.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
