# network-songs

This is a package to create "network songs" from threshold-linear networks (W,b). Many of the examples are for CTLNs, but the code allows input of any (W,b).

The main scripts are:

1. my_first_network_song_script_27oct2024.m
2. run_CTLN_network_song_script.m

The first script allows the user to create a network song for any (W,b). By default, it is set to generate a CTLN from a random oriented graph with no sinks, which is guaranteed to have no stable fixed points. (Stable fixed point solutions make for very boring and ugly songs.)

The second script allows the user to create songs from all the CTLN examples that are found in CTLN Basic 2.0 (https://github.com/ccurto/CTLN-Basic-2.0). The necessary data to generate these examples is given in the examples/ subfolder. This is the same subfolder found in CTLN Basic 2.0.

Most of the functions here are general TLN and CTLN functions that are also found in CTLN Basic 2.0, but included here to make the package self-contained. The new functions needed to generate the network songs are:

key2freq.m
rates2sound.m
soln2song.m

The scripts above call key2freq and soln2song, while soln2song calls rates2sound. One can think of soln2song as a wrapper for rates2sound, including the thresholding of the rate curves as a preprocessing step. The thresholding makes the songs sound more like piano songs, with crisper on/off transitions for each neuron. We also create and save "raw" versions of each song, without thresholding. These sound more like organ or alien music.
