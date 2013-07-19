% Tyler Palsulich
% Seven Languages in Seven W, by Bruce A. Tate
% Prolog Day 3

:- use_module(library(clpfd)).


% Source of slice: https://sites.google.com/site/prologsite/prolog-problems/1/solutions-1/p1_18.pl
slice([X|_],1,1,[X]).
slice([X|Xs],1,K,[X|Ys]) :- K > 1, 
   K1 is K - 1, slice(Xs,1,K1,Ys).
slice([_|Xs],I,K,Ys) :- I > 1, 
   I1 is I - 1, K1 is K - 1, slice(Xs,I1,K1,Ys).



valid([]).
valid([Head|Tail]) :-
	all_different(Head),
	valid(Tail).

sudoku(Puzzle) :-
	Puzzle = [S11, S12, S13, S14,
			  S21, S22, S23, S24,
			  S31, S32, S33, S34,
			  S41, S42, S43, S44],
	Puzzle ins 1..4, 
	Row1 = [S11, S12, S13, S14],
	Row2 = [S21, S22, S23, S24],
	Row3 = [S31, S32, S33, S34],
	Row4 = [S41, S42, S43, S44],
	Col1 = [S11, S21, S31, S41],
	Col2 = [S12, S22, S32, S42],
	Col3 = [S13, S23, S33, S43],
	Col4 = [S14, S24, S34, S44],
	Square1 = [S11, S12, S21, S22],
	Square2 = [S13, S14, S23, S24],
	Square3 = [S31, S32, S41, S42],
	Square4 = [S33, S34, S43, S44],
	valid([Row1, Row2, Row3, Row4,
		   Col1, Col2, Col3, Col4,
		   Square1, Square2, Square3, Square4]),
	writeln(Row1), writeln(Row2), writeln(Row3), writeln(Row4).

% ?- sudoku([_, _, 2, 3,
% _, _, _, _,
% _, _, _, _,
% 3, 4, _, _]).
% [4,2,1,3]
% [1,3,2,4]
% [2,4,3,1]
% [3,1,4,2]



sudoku(Puzzle) :-
	Puzzle = [S11, S12, S13, S14, S15, S16, 
			  S21, S22, S23, S24, S25, S26,
			  S31, S32, S33, S34, S35, S36,
			  S41, S42, S43, S44, S45, S46,
			  S51, S52, S53, S54, S55, S56,
			  S61, S62, S63, S64, S65, S66],
	Puzzle ins 1..4, 

	Row1 = [S11, S12, S13, S14, S15, S16],
	Row2 = [S21, S22, S23, S24, S25, S26],
	Row3 = [S31, S32, S33, S34, S35, S36],
	Row4 = [S41, S42, S43, S44, S45, S46],
	Row5 = [S51, S52, S53, S54, S55, S56],
	Row6 = [S61, S62, S63, S64, S65, S66],

	Col1 = [S11, S21, S31, S41, S51, S61],
	Col2 = [S12, S22, S32, S42, S52, S62],
	Col3 = [S13, S23, S33, S43, S53, S63],
	Col4 = [S14, S24, S34, S44, S54, S64],
	Col5 = [S15, S25, S35, S45, S55, S65],
	Col6 = [S16, S26, S36, S46, S56, S66],

	Square1 = [S11, S12, S13,
			   S21, S22, S23],
	Square2 = [S14, S15, S16,
			   S24, S25, S26],
	Square3 = [S31, S32, S33,
			   S41, S42, S43],
	Square4 = [S34, S35, S36,
			   S44, S45, S46],
	Square5 = [S51, S52, S53,
			   S61, S62, S63],
	Square6 = [S54, S55, S56,
			   S64, S65, S66],

	valid([Row1, Row2, Row3, Row4, Row5, Row6,
		   Col1, Col2, Col3, Col4, Col5, Col6,
		   Square1, Square2, Square3, Square4, Square5, Square6]),
	writeln(Row1), writeln(Row2), writeln(Row3), 
	writeln(Row4), writeln(Row5), writeln(Row6).

sudoku(Puzzle) :-
	Puzzle = [S11, S12, S13, S14, S15, S16, S17, S18, S19, 
			  S21, S22, S23, S24, S25, S26, S27, S28, S29, 
			  S31, S32, S33, S34, S35, S36, S37, S38, S39, 
			  S41, S42, S43, S44, S45, S46, S47, S48, S49, 
			  S51, S52, S53, S54, S55, S56, S57, S58, S59, 
			  S61, S62, S63, S64, S65, S66, S67, S68, S69, 
			  S71, S72, S73, S74, S75, S76, S77, S78, S79,
			  S81, S82, S83, S84, S85, S86, S87, S88, S89, 
			  S91, S92, S93, S94, S95, S96, S97, S98, S99],
	slice(Puzzle,  1,  9, Row1),
	slice(Puzzle, 10, 18, Row2),
	slice(Puzzle, 19, 27, Row3),
	slice(Puzzle, 28, 36, Row4),
	slice(Puzzle, 37, 45, Row5),
	slice(Puzzle, 46, 54, Row6),
	slice(Puzzle, 55, 63, Row7),
	slice(Puzzle, 64, 72, Row8),
	slice(Puzzle, 73, 81, Row9),

	Col1 = [S11, S12, S13, S14, S15, S16, S17, S18, S19],
	Col2 = [S21, S22, S23, S24, S25, S26, S27, S28, S29],
	Col3 = [S31, S32, S33, S34, S35, S36, S37, S38, S39],
	Col4 = [S41, S42, S43, S44, S45, S46, S47, S48, S49],
	Col5 = [S51, S52, S53, S54, S55, S56, S57, S58, S59],
	Col6 = [S61, S62, S63, S64, S65, S66, S67, S68, S69],
	Col7 = [S71, S72, S73, S74, S75, S76, S77, S78, S79],
	Col8 = [S81, S82, S83, S84, S85, S86, S87, S88, S89],
	Col9 = [S91, S92, S93, S94, S95, S96, S97, S98, S99],

	Square1 = [11, 12, 13, 21, 22, 23, 31, 32, 33],
	Square2 = [41, 51, 61, 42, 52, 62, 43, 53, 63],
	Square3 = [71, 81, 91, 72, 82, 92, 73, 83, 93], 
	Square4 = [14, 24, 34, 15, 25, 35, 16, 26, 36], 
	Square5 = [44, 54, 64, 45, 55, 65, 46, 56, 66],
	Square6 = [74, 84, 94, 75, 76, 77, 85, 86, 87], 
	Square7 = [17, 27, 37, 18, 28, 38, 19, 29, 39],
	Square8 = [47, 57, 67, 48, 58, 68, 49, 59, 69],
	Square9 = [77, 87, 97, 78, 88, 98, 79, 89, 99],

	valid([Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9,
		   Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9,
		   Square1, Square2, Square3, Square4, Square5, Square6, Square7, Square8, Square9]),
	writeln(Row1), writeln(Row2), writeln(Row3), 
	writeln(Row4), writeln(Row5), writeln(Row6),
	writeln(Row7), writeln(Row8), writeln(Row9).