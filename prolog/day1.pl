% Tyler Palsulich
% Seven Languages in Seven Weeks, by Bruce A. Tate
% Prolog Day 1

author('Steinbeck', 'East of Eden').
author('Steinbeck', 'Of Mice and Men').
author('Hemmingway', 'The Old Man and the Sea').
author('Hemmingway', 'The Sun Also Rises').
author('Orwell', 'Animal Farm').
author('Orwell', '1984').
author('Crichton', 'Prey').
author('Crichton', 'Jurassic Park').

% ?- author(X, Y), X = 'Steinbeck'.

instrument('Jimi Hendrix', 'guitar').
instrument('Neil Pert', 'drums').
instrument('Chopin', 'piano').
instrument('Louis Armstrong', 'trumpet').

genre('Jimi Hendrix', 'Rock').
genre('Neil Pert', 'Rock').
genre('Chopin', 'Classical').
genre('Louis Armstrong', 'Jazz').

% ?- instrument(Artist, Instrument), genre(Artist, Genre), Instrument = 'guitar'.

