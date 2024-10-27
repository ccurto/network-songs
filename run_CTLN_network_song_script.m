% run_CTLN_network_song_script
%
% script to make network songs from examples in the CTLN paper:
% "Diversity of emergent dynamics in competitive threshold-linear networks"
% available at: https://arxiv.org/abs/1605.04463
%
% created by carina on oct 13, 2024, updated oct 27, 2024

clear all


% Step 0: provide song_title and stretch_factor.........................
% title for saving song - change this to avoid overwriting last song!
song_title = 'n7-rhythm';

% regulate the "speed" of the song w/o affecting sound frequencies
stretch_factor = []; % use [] for default, which is 15
% stretch_factor = 20; % better for old-n7-sequence
% stretch_factor = 5; % don't stretch gaudi or quasiperiodic as much


% Step 1: uncomment *one* line below to run the file with the data...... 
% for the example of interest - CTLN paper figure is indicated for each.

% run('examples/CTLN_example_0_3cycle.m')             % Fig 1C
% run('examples/CTLN_example_1_n25_quasiperiodic.m')  % Fig 2C
% run('examples/CTLN_example_2_deg_matched_A.m')      % Fig 3A
% run('examples/CTLN_example_3_deg_matched_B.m')      % Fig 3B
% run('examples/CTLN_example_4_deg_matched_C.m')      % Fig 3C
% run('examples/CTLN_example_5_baby_chaos.m')         % Fig 3D
% run('examples/CTLN_example_6_n9_coexistence.m')     % Fig 4
% run('examples/CTLN_example_7_old_n7_sequence.m')    % Fig 5
% run('examples/CTLN_example_8_gaudi.m')              % Fig 6
% run('examples/CTLN_example_9_7star_quasiperiodic.m') % Fig 7
 run('examples/CTLN_example_10_n7_rhythm.m')         % Fig 8
% run('examples/CTLN_example_11_gallop_trot.m')       % Fig 10
% run('examples/CTLN_example_12_cell_assembly_chain.m') % Fig 11A
% run('examples/CTLN_example_13_5star_chain.m')      % Fig 11B
% run('examples/CTLN_example_14_quasiperiodic_3cycles.m') % Fig 12
% run('examples/CTLN_example_15_phone_number.m')      % Fig 13


% Step 2: select the initial conditions X0.............................
% by default, X0 = X0cell{1}; if there are multiple stored initial
% conditions, you can access them by setting X0 = X0cell{2}, etc.
X0 = X0cell{1};
% T = 100; % comment out to use pre-loaded default


% Step 3: build (W,b) and compute solution.............................
W = graph2net(sA,e,d);
b = ones(n,1);
soln = threshlin_ode(W,b,T,X0);


% Step 4: MAKE NETWORK SONGS............................................

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


% Step 5: plot solutions, raw and thresholded...........................

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


% Step 6: play the songs!............................................
% note they are also automatically saved as song_title.wav files

sound(Z,Fs); % to play thresholded song
%sound(Z_raw,Fs); % to play "raw" song 