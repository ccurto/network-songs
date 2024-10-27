% CTLN_example_3_deg_matched_B.m
%
% comments: This network has three 3-cycles but only two limit cycles.
% This corresponds to Figure 3B of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_3_deg_matched_B.mat

% adjacency matrix 
sA = [ 0  0  0  0  1; ...
       1  0  1  0  0; ...
       0  0  0  1  1; ...
       1  0  0  0  0; ...
       0  1  0  1  0 ]; 

% simulation parameters 
n = 5;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 
theta = 1;   % external drive
T = 100;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.100   0.100   0.000   0.000   0.100];
X0cell{2} = [ 0.000   0.100   0.100   0.000   0.100];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; 

% colors 
colors = [ 0.80 0.00 0.00; 0.00 0.50 0.70; 0.15 0.60 0.00; 1.00 0.64 0.00; 0.50 0.50 0.50 ]; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 3;
% ex_name = 'deg_matched_B';
% graph_comments = 'graph B from Fig 3 of CTLN preprint. It has 3 3-cycles but only 2 limit cycles';
%
% save('examples/CTLN_example_3_deg_matched_B.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
