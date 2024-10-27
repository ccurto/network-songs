% CTLN_example_13_5star_chain.m
%
% comments: graph with six overlapping 5-stars.  
% This corresponds to Figure 11B of the paper https://arxiv.org/abs/1605.04463
%
% Option at end of file to save data as: examples/CTLN_example_13_5star_chain.mat

% adjacency matrix 
sA = [ 0  0  0  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0; ...
       1  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0; ...
       1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0; ...
       0  1  1  0  0  0  1  1  0  0  0  0  0  0  0  0  0  0  0  0; ...
       0  0  1  1  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0; ...
       0  0  0  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0; ...
       0  0  0  0  1  1  0  0  0  1  1  0  0  0  0  0  0  0  0  0; ...
       0  0  0  0  0  1  1  0  0  0  1  0  0  0  0  0  0  0  0  0; ...
       0  0  0  0  0  0  1  1  0  0  0  0  0  0  0  0  0  0  0  0; ...
       0  0  0  0  0  0  0  1  1  0  0  0  1  1  0  0  0  0  0  0; ...
       0  0  0  0  0  0  0  0  1  1  0  0  0  1  0  0  0  0  0  0; ...
       0  0  0  0  0  0  0  0  0  1  1  0  0  0  0  0  0  0  0  0; ...
       0  0  0  0  0  0  0  0  0  0  1  1  0  0  0  1  1  0  0  0; ...
       0  0  0  0  0  0  0  0  0  0  0  1  1  0  0  0  1  0  0  0; ...
       0  0  0  0  0  0  0  0  0  0  0  0  1  1  0  0  0  0  0  0; ...
       0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  0  0  0  1  1; ...
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  0  0  0  1; ...
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  0  0  0; ...
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  0  0; ...
       0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  0];

% simulation parameters 
n = 20;    % number of neurons 
e = 0.25;  % epsilon value 
d = 0.5;   % delta value 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stimulate with kicks

% idx gives the neurons that will receive a pulse at some point in the run
idx=[3:3:18];

% there will be twice as many runs of the simulation as there are
% stimulated neurons -- one short run in which the neuron is stimulated
% then a long run when we stay in the cyclic module 
nRuns = 2*length(idx); % number of time windows (half have pulses)

% initialize time lengths for pulse/no-pulse windows
T = zeros(1, nRuns); 
Ti = 2; % pulse time length, in units of leak timescale (membrane time constant)
Tj = 13; % inter-pulse time length

% initialize theta: each column is a theta vector for a different time window
% pulse - no pulse - pulse - no pulse - ...
theta = ones(n, nRuns); 

% insert pulses into theta array
for i=1:2:nRuns
    pulse_neuron = idx((i+1)/2);
    theta(pulse_neuron,i) = 1.2; % make "pulse" neuron have theta = 1.2
    T(i) = Ti;
    T(i+1) = Tj;
end

% note that theta, T are larger objects than usual, but simulation code
% can detect and handle this. 
%
% size(theta,2) = length(T) = number of time windows with different inputs

% initial conditions 
X0cell=[]; % initialize cell array of interesting initial conditions 
X0cell{1} = [ 0.100   0.100   0.000   0.000   0.000   0.000   0.000 ...
              0.000   0.000   0.000   0.000   0.000   0.000   0.000 ...
              0.000   0.000   0.000   0.000   0.000   0.000];

X0 = X0cell{1};   % for other initial conditions, modify command to access other entries in cell array 

% projection 
proj = [ ]; 

% colors 
colors = [ ]; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% To save .mat file, uncomment commands below 

% ex_num = 13;
% ex_name = '5star_chain';
% graph_comments = 'graph with 6 overlapping 5-stars.  from Fig 11B of CTLN preprint.';
% 
% save('examples/CTLN_example_13_5star_chain.mat', 'sA', 'n', 'e', 'd','theta','T','X0','X0cell','proj','colors','ex_num','ex_name','graph_comments')
