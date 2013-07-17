% Tyler Palsulich
% Seven Languages in Seven Weeks, by Bruce A. Tate
% Prolog Day 2

% Reverse the elements of a list.

reverse([A], [A]).
reverse([A, B], [B, A]).

reverse([Head|Tail1], Return) :-
	reverse(Tail1, Tail2),
	append(Tail2, [Head], Return).

% ?- reverse([5, 4, 3, 2, 1], What).
% What = [1, 2, 3, 4, 5].

% Find the smallest element of a list.

minimum([A], A).
minimum([Head|Tail], Head) :-
	minimum(Tail, TailMin),
	Head < TailMin, !.
minimum([_|Tail], TailMin) :-
	minimum(Tail, TailMin).

% ?- minimum([500, 100, -1000, -500, 1000, -100], What).
% What = -1000.


% Sort the elements of a list.

merge(X, [], [X]).
merge(X, [Y|Tail], [X,Y|Tail]) :-
    X @< Y, !.
merge(X, [Y|Tail2], [Y|Tail]) :-
    merge(X, Tail2, Tail).

msort([A], [A]).
msort([A, B], [A, B]) :- A < B, !.
msort([A, B], [B, A]).
msort([Head|Tail], Result) :-
	msort(Tail, SortedTail),
	merge(Head, SortedTail, Result).

% ?- sort([500, 100, -1000, -500, 1000, -100], What).
% What = [-1000, -500, -100, 100, 500, 1000].
