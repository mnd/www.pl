%% -*- prolog -*- 
:- module(corewars_home, [corewars_home/1]).

%% TODO: Generate page from previous result
corewars_home(Request) :-
	corewars:corewars_page( Request,
	                        [ h2('Battle Results') ]).

