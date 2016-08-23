%% -*- prolog -*-
:- module(corewars_warriors, [corewars_warriors/1]).

corewars_warriors(Request) :-
	(   http_session_data(logined(_Path)) ->
	    corewars:corewars_page( Request,
	                            [ h2('Warriors management')
				    ])
	;   http_redirect(moved, '/corewars/', Request)
        ).
