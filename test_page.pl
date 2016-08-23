%% -*- prolog -*-
:- module(test_page, [test_page/1]).

test_page(Request) :-
	reply_html_page( [],
	                 [ table([ border(1) ], \gen_rows(Request)) ]
		       ).

gen_rows([]) --> [].
gen_rows([H|T]) -->
	{ H =.. [Name, Value],
	  with_output_to(atom(Val), write(Value))
        },
	html([ tr([ td(Name),
	            td(Val)
                  ])
	     ]),
	gen_rows(T).
