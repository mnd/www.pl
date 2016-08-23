%% -*- prolog -*-
:- module(page_skeleton, [gen_page/3, gen_page/4]).

gen_page(Title, Links, Content) -->
	{ Copyright = ['© 2011 — ', a([href = 'mailto:nikolay.merinov@member.fsf.org'],
	                                   'Nikolay Merinov')]
	},
	gen_page(Title, Links, Content, Copyright).

gen_page(Title, Links, Content, Copyright) -->
	{ gen_links(Links, Menu) },
	page([ title(Title),
	       link([ href('/styles/main-style.css'),
	              rel('stylesheet'),
	       	      type('text/css')
	            ]),
	       meta([ http-equiv = 'Content-Type',
	              content('text/html; charset=utf-8')
		    ])
             ],
	     [ div([ id('menu-block') ],
	           Menu),
               div([ id('content-block') ],
	           [ div([ id('content-title')], Title),
		     div([ id('content-text') ], Content)
	           ]),
	       div([ id('about-block') ], Copyright)
	     ]).

gen_links([], []).
gen_links([(Url, Text) | LS], [M | MS]) :-
	M = div([class = 'menu-item'],
	        a([href = Url], Text)),
	gen_links(LS, MS).

gen_page(Title, Links, Content) :-
	html_current_option(content_type(Type)),
        format('Content-type: ~w~n~n', [Type]),
	phrase(gen_page(Title, Links, Content), HTML),
        print_html(HTML).

gen_page(Title, Links, Content, Copyright) :-
	html_current_option(content_type(Type)),
        format('Content-type: ~w~n~n', [Type]),
	phrase(gen_page(Title, Links, Content, Copyright), HTML),
        print_html(HTML).
