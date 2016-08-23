% -*- prolog -*-
:- use_module(library('http/thread_httpd')).
:- use_module(library('http/http_dispatch')).
:- use_module(library('http/html_write')).
:- use_module(library('http/mimetype')).
:- use_module(library('http/http_session')).
:- use_module(library('http/http_parameters')).
:- use_module(library('http/html_head')).
:- use_module(library('http/http_authenticate')).

:- include('urls_dispatcher').
:- use_module('main_page').
:- use_module('test_page').
:- use_module('corewars/corewars').
:- use_module('page_skeleton').
:- use_module('return_file').			%http/http_pwp module in new
						%version of http library

main :-
	working_directory(_, '/home/kim/Workspace/http'),
	%% expand_file_name('/srv/http/', [Dir]),
	%% assert(user:file_search_path(document_root, Dir)),
        http_server(http_dispatch, [port(8080)]).
