% Tyler Palsulich
% Seven Languages in Seven Weeks, by Bruce A. Tate
% Erlang Day 2

% Consider a list of keyword-value tuples, such as [{erlang, "a func-
% tional language"}, {ruby, "an OO language"}]. Write a function that ac-
% cepts the list and a keyword and returns the associated value for
% the keyword.

% Consider a shopping list that looks like [{item quantity price}, ...].
% Write a list comprehension that builds a list of items of the form
% [{item total_price}, ...], where total_price is quantity times price.

% Bonus problem:
% Write a program that reads a tic-tac-toe board presented as a list
% or a tuple of size nine. Return the winner (x or o) if a winner
% has been determined, cat if there are no more possible moves,
% or no_winner if no player has won yet.

-module(day2).

-export([hash/2]).
-export([total_price/0]).
-export([tic/1]).

hash(List, Key) -> 
	[{ _, Value} | _ ] = lists:filter(fun({K, _}) -> K == Key end, List), Value.

total_price() -> 
	Cart = [{pencil, 4, 0.25}, {pen, 1, 1.20}, {paper, 2, 0.20}],
	[{Product, Quantity, Price, Quantity * Price} || {Product, Quantity, Price} <- Cart].

tic(Board) ->
	case Board of
		[P, P, P,
		 _, _, _, 
		 _, _, _] when P =/= e -> P;

		[_, _, _,
		 P, P, P,
		 _, _, _] when P =/= e -> P;

		[_, _, _,
		 _, _, _,
		 P, P, P] when P =/= e -> P;

		[P, _, _,
		 P, _, _,
		 P, _, _] when P =/= e -> P;

		[_, P, _,
		 _, P, _,
		 _, P, _] when P =/= e -> P;

		[_, _, P,
		 _, _, P,
		 _, _, P] when P =/= e -> P;

		[P, _, _,
		 _, P, _,
		 _, _, P] when P =/= e -> P;

		[_, _, P,
		 _, P, _,
		 P, _, _] when P =/= e -> P;

		_ -> 
			case lists:any(fun(P) -> P == e end, Board) of
				true -> no_winner;
				_ -> cat
			end
	end.