function f = key2freq(k)

% function f = key2freq(k)
%
% k = key number on the piano, an integer from 1 to 88
%     can also be a vector of integers: k = [k1, k2, ..., kl]
% f = corresponding frequency or vector of frequencies, in Hz

% the following formula is from wikipedia
% http://en.wikipedia.org/wiki/Piano_key_frequencies
freq = @(n)(440*2.^((n-49)/12));

% now just apply the function to translate key number to frequency!
f = freq(k);