%% -*- prolog -*-

:- module(return_file, [return_file/2]).

return_file(Option, Request) :-
	member(path(Path), Request),
	sub_atom(Path, 1, _, 0, RPath),
	(   exists_directory(RPath) ->
	    permission_error(read, file, Path)
	;   (   exists_file(RPath) ->
                http_reply_file(RPath, Option, Request)
	    ;   existence_error(http_location, Path))).
