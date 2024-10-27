function plot_graph(sA,colors,middleflag,edgecolor,edgewidth)

% function plot_graph(sA,colors,middleflag,edgecolor,edgewidth)
%
% This function plots all the nodes of the graph around a circle then puts
% a directed arrow from node j to node i if sA(i,j)=1
%
% middleflag = 1 for plotting last node in the middle, else ignore
%
% updated june 1, 2020 to make the arrows on edges a bit more prominent
% updated june 23, 2020 to fix "hold on" bug for independent set
% updated october 25, 2020 to add edgecolor option
% updated nov 14, 2020 to add edgewidth option
% updated dec 27, 2020 to make nodes larger
% updated dec 30, 2020 to allow generalized sA matrices

n=size(sA,1);

if nargin<2 || isempty(colors)
    if n <=5
        colors = [0 .5 .7; .15 .6 0; .5 .5 .5;...
            1 .643 0; .8 0 0];
    else
        colors = lines(n);
    end;
end;

if nargin<3 || isempty(middleflag)
    middleflag = 0;
end;

if nargin<4 || isempty(edgecolor)
    edgecolor = [0 0 0]; % default to black
end;

if nargin<5 || isempty(edgewidth)
    edgewidth = 1.5;
end;

% determine positions for nodes
r=1;
if middleflag
    idxs = 1:n-1;
    x=r*cos(-(idxs-1)*2*pi/(n-1) + pi/2);
    y=r*sin(-(idxs-1)*2*pi/(n-1) + pi/2);
    x = [x 0]; y = [y 0]; % add last node in center
else
    idxs=1:n;
    x=r*cos(-(idxs-1)*2*pi/n + pi/2);
    y=r*sin(-(idxs-1)*2*pi/n + pi/2);
end;

% plot arrows
for j=1:n
    for i=1:n
        if sA(i,j)>0 % plot edges for sA(i,j) = 1 and interpolated edges
            t = sA(i,j);
            interpcolor = t*edgecolor + (1-t)*[1 1 1];
            dir=[x(i), y(i)]-[x(j),y(j)];
            quiver(x(j), y(j), dir(1), dir(2),.87,...
                'color',interpcolor,'LineWidth',edgewidth, 'MaxHeadSize', .6);  % Adjust this line to affect arrowheads and edge length
            hold on;
        end
    end
end

% plot nodes
for i=1:n
    plot(x(i),y(i),'.','color',colors(i,:),'Markersize',30)
    hold on;
end

% touch ups
xlim([-1.2*r, 1.3*r]);
ylim([-1.2*r, 1.3*r]);
set(gca,'XTick',[]); % to remove tick marks on x-axis
set(gca,'YTick',[]); % to remove tick marks on y-axis
hold off;