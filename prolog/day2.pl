% Tyler Palsulich
% Seven Languages in Seven Weeks, by Bruce A. Tate
% Prolog Day 2

% Reverse the elements of a list.

reverse([A], [A]).					% Base case of just one element.
reverse([A, B], [B, A]).			% Base case of two elements.

reverse([Head|Tail1], Return) :-	% Remove the Head, then append it to the reverse of the tail.
	reverse(Tail1, Tail2),
	append(Tail2, [Head], Return).

% ?- reverse([5, 4, 3, 2, 1], What).
% What = [1, 2, 3, 4, 5].

% Find the smallest element of a list.

minimum([A], A).					% Base case of just one element.
minimum([Head|Tail], Head) :-		% Either return Head or the min of Tail.
	minimum(Tail, TailMin),
	Head < TailMin, !.				% Cut to always return TailMin if this fails.
minimum([_|Tail], TailMin) :-
	minimum(Tail, TailMin).

% ?- minimum([500, 100, -1000, -500, 1000, -100], What).
% What = -1000.


% Sort the elements of a list.

% Merge will insert an element into the proper spot in the sorted list.

merge(X, [], [X]).						% Base case of inserting into an empty list.
merge(X, [Y|Tail], [X,Y|Tail]) :-		% Recursively take the Head off the list until the head is less than the element.
    X @< Y, !.							% Cut to ensure we merge the element into the list at the right time.
merge(X, [Y|Tail2], [Y|Tail]) :-
    merge(X, Tail2, Tail).				% Once the element to insert is greater than the head, merge everything back.

msort([A], [A]).						% Base case of the recursion. A one element list is already sorted.
msort([Head|Tail], Result) :-			% Recursively merge the Head into the sorted Tail.
	msort(Tail, SortedTail),
	merge(Head, SortedTail, Result).

% ?- sort([500, 100, -1000, -500, 1000, -100], What).
% What = [-1000, -500, -100, 100, 500, 1000].
