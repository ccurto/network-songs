function [W,A] = graph2net(sA,e,d)

% function [W,A] = graph2net(sA,e,d)
%
% sA = binary adjacency matrix for a directed graph
% e = epsilon value to control synaptic strengths (default: e = .25)
% d = delta value for inhibitory weights (default: d = 2*e)
%
% create matrix W for a threshold-linear network from directed graph 
%
% modified june 22, 2015
% updated dec 30, 2020 to allow generalized sA matrices for interpolation
% updated apr 23, 2022 to fix bug: A was unassigned, now fixed

if nargin < 2 || isempty(e)
    e = .25;
end;

if nargin < 3 || isempty(d)
    d = 2*e;
end;

% create matrix W from sA
W = zeros(size(sA));
n = size(sA,1);
for i=1:n
    for j=1:n
        t = sA(i,j);
        W(i,j) = t*(-1+e) + (1-t)*(-1-d);
    end
    W(i,i) = 0; % make sure diagonal is 0
end

% create matrix A from sA
A = e*(sA>0) - d*(sA<=0); % 1 -> eps, 0 -> - delta
A = A - diag(diag(A)); % reset diagonal to 0


% older code, from before dec 30, 2020:
%
% % create matrix A from sA
% A = e*(sA>0) - d*(sA<=0); % 1 -> eps, 0 -> - delta
% A = A - diag(diag(A)); % reset diagonal to 0
% 
% % create matrix W from A: W = I - 11^t + eps*A
% n = size(A,1);
% W = eye(n) - ones(n,n) + A;  