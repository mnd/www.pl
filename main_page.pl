%%  -*- prolog -*-
:- module(main_page, [main_page/1]).

main_page(_Request) :-
	about_me(Content),
	gen_page( 'Nikolay Merinov homepage',
	          [ ('/', 'About'),
		    ('/corewars', 'Core Wars (under construction)'),
		    ('https://io.mndet.net', 'pump.io')
		  ],
		  Content
	        ).

about_me(Content) :-
	P = p([]), BR = br([]),
	Content =
          [ h2('About Me'),
	    center(img([label = 'Kim', src = '/images/kim.jpg'])),
	    P, 'I\'m just a coder',
	    h2('Contacts'),
	    P,'e-mail: ', a( [href = 'mailto:nikolay.merinov@member.fsf.org'],
	                     'nikolay.merinov@member.fsf.org'
			   ),
	    BR,'jabber: ',a( [href = 'xmpp:mnd@member.fsf.org'],
	                     'mnd@member.fsf.org'
			   ),
	    BR,'pump.io: ',a( [href = 'https://io.mndet.net/mnd'],
	                     'mnd@pump.mndet.net'
			   )
	  ].
