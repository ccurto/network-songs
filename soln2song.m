function [Z,Fs,threshX,Z_raw] = soln2song(X,filename,freqs,stretch_factor)

% function [Z,Fs,threshX,Z_raw] = soln2song(X,filename,freqs,stretch_factor)
%
% X = ratecurves, time x neurons, as in soln.X (output of threshline_ode)
% filename = string for saving the .wav files
% freqs = vector of frequencies for the "notes" of each neuron
% -> default is piano key frequencies from G major scale
% stretch_factor = factor by which to slow down song (default is 15)
%
% Z = the song, can be played with matlab command "sound(Z,Fs)"
% Fs = sampling rate for song, output of rates2sound.m
% threshX = thresholded rate curves for cleaner piano sound
% Z_raw = "raw" song from non-thresholded X
%
% This function turns ratecurves into two songs, saved as filename.wav
% and filename_raw.wav, where the first is the son from thresholded
% ratecurves and the second is the song directly from X.
%
% calls: rates2sound.m
%
% first created by carina on aug 22, 2015
% updated by carina on aug 16, 2022 to use simple_plot (not plot_soln)
% updated by carina on oct 9, 2024 to not call simple_plot.m anymore
%    and to return thresholded firing rates, threshX, rather than plot
%    them. "fig" and "colors" can now also be removed...
% updated again by carina on oct 10 & 12, 2024 to remove sound_flag and 
%    input only the ratecurves X instead of the full "soln" structure
%    and to automatically create "raw" song from non-thresholded X.


if nargin < 2 || isempty(filename)
    filename = 'my_song'; 
end

if nargin < 3 || isempty(freqs)
    freqs = []; % will use rates2sound defaults (G major scale)
end

if nargin < 4 || isempty(stretch_factor)
    stretch_factor=[];  % will use rates2sound defaults
end

%..............................................................

% threshold firing rates to top quartile of values, get threshX
n = size(X,2); % number of neurons
thresh = zeros(1,n);
for i=1:n
    rates = sort(X(:,i));
    thresh(i) = rates(round(.75*size(X,1))); % get 75%-ile rate
end
thresh_mtx = ones(size(X,1),1)*thresh; % rank 1 outer product
threshX = X.*(X>thresh_mtx-.01); % don't want to throw out X = thresh_mtx

% create the songs! saves as filename.wav and filename_raw.wav
[Z,Fs] = rates2sound(threshX,freqs,filename,stretch_factor);
[Z_raw,Fs] = rates2sound(X,freqs,[filename '_raw'],stretch_factor);