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

merge(X, [], [X]).
merge(X, [Y|Tail], [X,Y|Tail]) :-
    X @< Y, !.
merge(X, [Y|Tail2], [Y|Tail]) :-
    merge(X, Tail2, Tail).

msort([A], [A]).
msort([A, B], [A, B]) :- A < B.
msort([A, B], [B, A]) :- B =< A.
msort([Head|Tail], Result) :- msort(Tail, SortedTail), merge(Head, SortedTail, Result).