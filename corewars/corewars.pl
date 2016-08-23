%% -*- prolog -*- 
:- module(corewars, [corewars/1]).

:- include('corewars_dispatch').
:- use_module('corewars_about').
:- use_module('corewars_home').
:- use_module('corewars_login').
:- use_module('corewars_warriors').

%% pages dispatches with http_dispatch.
%% corewars/1 do nothing except redirect to /corewars/ page

corewars(Request) :-				
	http_redirect(moved, '/corewars/', Request).

corewars_page(_Request, Content) :-
	(   http_session_data(logined(_)) ->
	    Manage = [ ('/corewars/warriors/', 'Warriors'),
	               ('/corewars/logout/', 'Logout')
		     ]
	;   Manage = [('/corewars/login/', 'Login')]
        ),
	gen_page( 'CoreWars hill',
      	          [ ('/corewars/',       'Home'),
	            ('/corewars/about/', 'About Game')
		    | Manage
		  ],
		  Content
	        ).
