%% -*- prolog -*- 

:- http_handler( '/corewars/',
	         corewars_home,
		 [priority(1)]
	       ).
:- http_handler( '/corewars/about/',
	         corewars_about,
		 []
	       ).
:- http_handler( '/corewars/login/',
	         corewars_login,
		 []
	       ).
:- http_handler( '/corewars/logout/',
	         corewars_logout,
		 []
	       ).
:- http_handler( '/corewars/login/verify',
	         corewars_verify,
		 []
	       ).
:- http_handler( '/corewars/warriors/',
	         corewars_warriors,
		 []
	       ).
