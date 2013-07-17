% Tyler Palsulich
% Seven Languages in Seven Weeks, by Bruce A. Tate
% Prolog Day 2


reverse([A], [A]).
reverse([A, B], [B, A]).

reverse([Head|Tail1], Return) :-
	reverse(Tail1, Tail2),
	append(Tail2, [Head], Return).

minimum([A], A).
minimum([Head|Tail], Return) :-
	minimum(Tail, TailMin),
	Head < TailMin, Return is Head.
minimum([Head|Tail], Return) :-
	minimum(Tail, TailMin),
	Head >= TailMin, Return is TailMin.