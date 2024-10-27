function [Z,Fs] = rates2sound(X,freqs,filename,stretch_factor)

% function [Z,Fs] = rates2sound(X,freqs,filename,stretch_factor)
%
% X = t x n matrix, where t = # time bins and n = # neurons
% -> note: for the output of threshlin_ode, soln.X is of the right size.
% freqs = vector of frequencies for the "notes" of each neuron
% -> default is piano key frequencies from G major scale
% -> Note: if length(freqs) < n, final neurons will be silent
% filename = text string for saving as a .wav
% stretch_factor = resampling factor to slow down song (default = 15)
%
% Z = the song, can be played with command "sound(Z,Fs)"
% Fs = sampling rate
%
% generates a sound Z where the amplitudes are governed by the firing rates 
% in X, and each neuron gets its own frequency, and saves .wav file.
%
% calls key2freq.m, to translate numbered piano keys to frequencies
%
% last modified oct 01, 2015 to incorporate "stretch_factor" option
% updated aug 16, 2022 by carina to change stretch_factor default to 15
% updated oct 9, 2024 by carina to change "interp" to "interp1" for
%   latest version of matlab, and fix associated syntax, and to not 
%   automatically play the song


if nargin < 2 || isempty(freqs)
    % G major keys: G A B C D E F#, starting at G2 = key 23
    Gmajor = [23 25 27 28 30 32 34 35 37 39 40 42 44 46 ...
        47 49 51 52 54 56 58 59 61 63 64 66 68 70];
    % order G major keys so that middle frequencies come first
    Gpick = Gmajor([7:26 [6:-1:1] 27:28]);
    % translate keys to frequencies
    freqs = key2freq(Gpick);
end

if nargin < 3 || isempty(filename)
    filename = 'temp';
end

if nargin < 4 || isempty(stretch_factor)
    stretch_factor = 15; % 25 is good for some songs
end

% fix a sampling rate
Fs = 8000;

% get matrix sizes
n = size(X,2); % no. of neurons
t = size(X,1); % no. of time bins

% restrict to first neurons if there are more than number of freqs
nfreq = length(freqs);
if n>nfreq
    X = X(:,1:nfreq);
end

% resample X to interpolate between values and slow things down
R = stretch_factor; % stretch factor for matlab's "interp" function
tbins = [1:1/R:t]; % want R*t = R*size(X,1) tbins
for i=1:size(X,2)
    Xi = X(:,i);
    Y(:,i) = interp1(Xi,tbins); % stretch to R*size(X,1) tbins
end

% assign times in seconds, so that sound freqs make sense
T = size(Y,1); % no. of time bins in Y
dt = 1/Fs;
time = [0:dt:dt*(T-1)]; 

% make matrix of pure sinusoids for each frequency
cosmtx = [];
for i=1:size(X,2)
    cosmtx = [cosmtx; cos(2*pi*freqs(i)*time)];
end

% multiply by amplitude envelopes from neural activity
Z = sum(Y'.*cosmtx,1);

% save to .wav
audiowrite([filename '.wav'],Z,Fs);