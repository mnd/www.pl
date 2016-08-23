%% -*- prolog -*- 
:- module(corewars_login, [corewars_login/1, corewars_verify/1,
	                   corewars_logout/1, path_for_pass/2]).

corewars_login(Request) :-
	http_parameters(Request, [fail(Is_Fail, [default(false)])]),
	(   Is_Fail = true ->
	    MSG=[p([]), 'login filed. Try again']
	;   MSG=[]
	),
        corewars:corewars_page( Request,
	                        [ h2('Enter pass phrase'),
				  form([ name(login),
				         action('/corewars/login/verify'),
				         method('GET')
				       ],
				       [ div([ input([ name(pass_phrase),
					               size(40)
					             ]),
					       input([ type(submit),
					               value(login)
					             ])
				             ])
					 | MSG
				       ])
			        ]).

corewars_verify(Request) :-
	http_parameters(Request, [pass_phrase(Text, [length >= 4])]),
	(   path_for_pass(Text, Path) ->
	    http_session_assert(logined(Path)),
	    corewars:corewars_page( Request,
	                            [h2('Logged in'), p([]), Path])
	;   http_redirect(moved, '/corewars/login/?fail=true', Request)
        ).

path_for_pass(Pass, Path) :-
	open('./corewars/passwd', read, Fd),
	read_passwd(Fd, Users),
	close(Fd), !,
	member(data(Pass, Path), Users).

read_passwd(Fd, R) :-
	read(Fd, T),
	(   T = end_of_file ->
	    R = []
	;   read_passwd(Fd, R1),
 	    R = [T|R1]
	).

corewars_logout(Request) :-
	http_current_session(Id, _),
	http_close_session(Id),
	http_redirect(moved, '/corewars/', Request).
