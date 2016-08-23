%% -*- prolog -*-
:- module(corewars_about, [corewars_about/1]).

%% This page must contain rules or link to rules and my server settings 
corewars_about(Request) :-
	corewars:corewars_page( Request,
	                        [ h2('Game Rules'),
				  h2('Server Settings')
			        ]).
