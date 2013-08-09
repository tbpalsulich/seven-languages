% Tyler Palsulich
% Seven Languages in Seven Weeks, by Bruce A. Tate
% Erlang Day 3

% Monitor the translate_service and restart it should it die.

% Make the Doctor process restart itself if it should die.

% Make a monitor for the Doctor monitor. If either monitor dies, restart it.

-module(day3_translate_doctor).

-export([loop/0, doc_doc/0]).

loop() ->
	process_flag(trap_exit, true),
	receive
		new ->		% Create a new translator and watch for it to die.
			register(translator, spawn_link(fun day3_translate_service:loop/0)),
			io:format("Creating a new translator...~n"),
			loop();

		{'EXIT', From, Reason} ->		% The translator died. Restart it with info.
			io:format("The translator ~p died with reason ~p.", [From, Reason]),
			io:format("Restarting it...~n"),
			self() ! new,
			loop();

		_ ->		% Our doctor was given a bad command! Make him exit.
			exit({doctor_loop, bad_doctor_order, received_at, erlang:time()})
		end.

doc_doc() ->		% Supervisor for the doctor of the translator.
	process_flag(trap_exit, true),
	receive
		new ->		% Create a new doctor.
			register(doctor, spawn_link(fun day3_translate_doctor:loop/0)),
			io:format("Creating a new doctor...~n"),
			doctor ! new,
			doc_doc();

		{'EXIT', From, Reason} ->		% Our doctor died. Restart him with info.
			io:format("The doctor ~p died with reason ~p.", [From, Reason]),
			io:format("Restarting it...~n"),
			self() ! new,
			doc_doc()
		end.

% Sample output. Note how if either service exits, it is restarted.
% I don't have doc_doc monitor itself since that would be confusing,
% knotted recursion.

% Eshell V5.9.1  (abort with ^G)
% 1> c(day3_translate_service).
% {ok,day3_translate_service}
% 2> c(day3_translate_doctor). 
% {ok,day3_translate_doctor}
% 3> DocDoc = spawn(fun day3_translate_doctor:doc_doc/0).
% <0.44.0>
% 4> DocDoc ! new.
% Creating a new doctor...
% new
% Creating a new translator...
% 5> day3_translate_service:translate(translator, "casa").
% "house"
% 6> day3_translate_service:translate(translator, "random").
% The translator <0.47.0> died with reason {<0.32.0>,not_understood,received_at,
%                                           {1,38,54}}."I don't understand."
% Restarting it...
% Creating a new translator...
% 7> doctor ! random.                                       
% The doctor <0.46.0> died with reason {doctor_loop,bad_doctor_order,
%                                       received_at,
%                                       {1,39,25}}.random
% Restarting it...
% Creating a new doctor...
% Creating a new translator...