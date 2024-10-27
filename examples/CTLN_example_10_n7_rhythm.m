% CTLN_example_10_n7_rhythm.m
%
% comments: n=7 graph with a complex rhythm.
% This corresponds to Figure 8 of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_10_n7_rhythm.mat

% adjacency matrix - ** This graph doesn't match Figure 8 **
sA = [ 0  0  0  0  1  1  0; ...
       1  0  0  0  1  1  1; ...
       1  1  0  1  1  0  1; ...
       1  1  0  0  0  1  0; ...
       0  0  0  1  0  1  0; ...
       0  0  1  0  0  0  0; ...
       1  0  0  1  1  1  0 ]; 

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
% 
% ex_num = 10;
% ex_name = 'n7_rhythm';
% graph_comments = 'n=7 graph from Fig 8 of CTLN preprint. Complex rhythm';
% 
% save('examples/CTLN_example_10_n7_rhythm.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
