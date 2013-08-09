% Tyler Palsulich
% Seven Languages in Seven Weeks, by Bruce A. Tate
% Erlang Day 1

% Write a function that uses recursion to return the number of
% words in a string.

% Write a function that uses recursion to count to ten.

% Write a function that uses matching to selectively print “success”
% or “error: message” given input of the form {error, Message} or suc-
% cess.

-module(day1).

-export([word_count/1]).
-export([word_count/3]).
-export([count_to_ten/0]).
-export([count_to_ten/1]).
-export([error/1]).


% Word count will recursively call itself, incrementing a counter, until there are no spaces left in the string.
% So, this will break if there is more than one space between each word.
% The first argument is the string to count the words in, the second is the index of " ", third is the count.
word_count(String) -> word_count(String, string:str(String, " "), 0).	% First call. Counter is 0.
word_count(_, 0, Size) -> Size;		% No more spaces, so return the counter.
% Increment the counter and call again.
word_count(String, Index, Size) -> word_count(string:substr(String, Index + 1), string:str(String, " "), Size + 1).

count_to_ten() -> count_to_ten(0).			% Get it started easily.
count_to_ten(10) -> io:fwrite("10~n", []);	% Base case of recursion.
count_to_ten(Num) -> io:fwrite("~p~n", [Num]), count_to_ten(Num + 1).	% Recursively count up.


error(success) -> io:fwrite("Success~n", []);			% Simply pattern match to decide what to print.
error({error, Message}) -> io:fwrite("Error: ~p~n", [Message]).