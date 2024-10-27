% CTLN_example_2_deg_matched_A.m
%
% comments: This network has two 3-cycles but only one limit cycle.
% This corresponds to Figure 3A of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_2_deg_matched_A.mat

% adjacency matrix 
sA = [ 0  0  0  0  1; ...
       1  0  0  0  1; ...
       0  1  0  0  0; ...
       1  0  1  0  0; ...
       0  0  1  1  0 ]; 

% simulation parameters 
n = 5;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 
theta = 1;   % external drive
T = 60;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.000   0.180   0.300   0.000   0.340];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; 

% colors 
colors = [ 0.80 0.00 0.00; 0.00 0.50 0.70; 0.15 0.60 0.00; 1.00 0.64 0.00; 0.50 0.50 0.50 ]; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 2;
% ex_name = 'deg_matched_A';
% graph_comments = 'graph A from Fig 3 of CTLN preprint. It has 2 3-cycles but only 1 limit cycle';
%
% save('examples/CTLN_example_2_deg_matched_A.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
