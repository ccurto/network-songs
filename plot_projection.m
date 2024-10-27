function [projn xlim0 ylim0] = plot_projection(X,proj,interval,color)

% function [projn xlim0 ylim0] = plot_projection(X,proj,interval,color)
%
% X = t x n solution matrix, like soln.X from output of threshlin_ode.m.
% proj = n x 2 vector of 2 projection directions
% interval = an interval in [0,1] specifying which part of the recording
% -> ex: input [.75,1] for last 1/4 of simulation time
% color = [R G B] color for plotting projection, default is black: [0 0 0]
%
% projn = n x 2 vector of 2 normalized & orthogonalized projection vectors
%
% updated May 27, 2017 to output projection vectors
% updated Aug 6, 2020 by Carina to fix proj orthogonalization bug!
% updated Dec 27, 2020 by Carina to return xlim0 and ylim0

n = size(X,2); % no. of neurons (dynamic variables)

if nargin<2 || isempty(proj)
    proj = rand(n,2); % pick 2 random directions
end;

% restrict to interval
if nargin<3 || isempty(interval)
    Y = X;
else
    tt = size(X,1);
    t0 = max(1,round(tt*interval(1)));
    t1 = min(tt,round(tt*interval(2)));
    Y = X(t0:t1,:);
end;

if nargin<4 || isempty(color)
    color = [0 0 0];
end;

% normalize projection vectors and orthogonalize 
proj1 = proj(:,1)/norm(proj(:,1));
proj2 = proj(:,2) - (proj(:,2)'*proj1)*proj1;
proj2 = proj2/norm(proj2);
projn = [proj1 proj2];

% compute projection
Xproj = Y*projn;

% plot projection
plot(Xproj(:,1),Xproj(:,2),'color',color,'Linewidth',1.5)

% return min and max x-vals and y-vals
xlim0 = [min(Xproj(:,1)) max(Xproj(:,1))];
ylim0 = [min(Xproj(:,2)) max(Xproj(:,2))];