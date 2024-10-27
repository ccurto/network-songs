% CTLN_example_0_3cycle.m
%
% comments: basic n=3 graph with a 3-cycle, producing a limit cycle.
% This corresponds to Figure 1C of the paper https://arxiv.org/abs/1605.04463

% adjacency matrix
sA = [0 0 1; 1 0 0; 0 1 0];

% simulation parameters
% simulation parameters 
n = 3;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 
theta = 1;   % external drive
T = 60;   % time in units of membrane time constant

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [0.10,0.11,0.12]';

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; % default to random projection

% colors 
colors = [ ]; % use default colors