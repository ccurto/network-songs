% my_first_network_song_script_27oct2024.m
%
% created by carina on oct 27, 2024 to illustrate network songs code

clear all


% Step 0: Provide song_title and stretch_factor.......................

% title for saving song - change this to avoid overwriting last song!
song_title = 'my-song';

% regulate the "speed" of the song w/o affecting sound frequencies
stretch_factor = []; % use [] for default, which is 15


% Step 1: Build the (W,b) and compute solution........................

% This is just a random example guaranteed to have no stable fixed pts.
% ** Comment this out and insert your own (W,b) instead! **
n = 11; % number of nodes
d = 3;  % avg in-degree
sA = randDigraph(n,d); % by default, creates oriented graph w/ no sinks
W = graph2net(sA); % CTLN with default epsilon and delta values
b = ones(n,1);

% next, simulate network dynamics for the threshold-linear network
T = 70; % length of simulation, in units of membrane timescale
X0 = zeros(n,1);
X0 = X0+.1*rand(n,1); % initial conditions, use X0=[] for defaults
soln = threshlin_ode(W,b,T,X0);


% Step 2: MAKE NETWORK SONGS............................................

% piano keys to use for minor pentatonic scale (note 40 = middle C)
keys_penta = [28,31,33,35,38,...
              40,43,45,47,50,...
              52,55,57,59,62];

% piano keys for carina/emil scale #1, n = 11
keys_dscale = [30,35,38,...
               42,47,50,...
               54,59,...
               48,49,57];

% choose a scale, convert keys to frequencies
% freqs = []; % for defaults (G major scale)
freqs = key2freq(keys_dscale);

% make the songs: automatically saved as song_title.wav files
[Z,Fs,threshX,Z_raw] = soln2song(soln.X,song_title,freqs,stretch_factor);

% note: defaults only have 28 frequencies, so only first 28 neurons
% will be "played" unless additional frequencies are passed in soln2song
% ......................................................................


% Step 3: Plot solutions, raw and thresholded...........................

% colors for ratecurves plots
colors = [0 .5 .7; .15 .6 0; .5 .5 .5; .8 .55 0; .8 0 0; .6 .4 .2;...
    77/256,175/256,74/256;117/256,112/256,179/256;158/256,1/256,66/256;...
    102/256,194/256,165/256;34/256,94/256,168/256];
colors = [colors;colors;colors]; % repeat 11 colors for 33

fig = 1;
figure(fig)
subplot(2,1,1)
plot_ratecurves(soln.X,soln.time,colors)
title('raw solution')

% plot thresholded firing rates
subplot(2,1,2)
plot_ratecurves(threshX,soln.time,colors);
title('thresholded solution for network song')
sgtitle(['network song: ' song_title])

% save figure
orient(fig,'landscape')
print(fig,'-painters','-dpdf','-fillpage',[song_title '_fig'])


% Step 4: Play the songs!............................................
% note: they are also automatically saved as song_title.wav files,
% and you should be able to play them by clicking on those .wav files

sound(Z,Fs); % to play thresholded song
%sound(Z_raw,Fs); % to play "raw" song 