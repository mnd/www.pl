%% -*- prolog -*-

%% main_page.pl
:- http_handler(root(.), main_page, [priority(1)]).
%% test_page.pl 
:- http_handler(root(test), test_page, [prefix]).	%WARNING: Must be deleted
%% 
:- http_handler( root('robots.txt'),
	         http_reply_file('robots.txt', [mime_type('text/plain')]),
		 []
	       ).
%% files.pl
%user:file_search_path(styles, root('styles/')).
:- http_handler( root('styles/'),
	         return_file([mime_type('text/css')]),
		 [prefix]
	       ).
:- http_handler( root('scripts/'),
	         return_file([mime_type('text/javascript')]),
		 [prefix]
	       ).
:- http_handler( root('images/'),
	         return_file([]),
		 [prefix]
	       ).
%% corewars.pl
%:- http_handler(root('corewars/'), corewars, [prefix]).
