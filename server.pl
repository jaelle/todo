:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).

user:file_search_path(root,'.').

:- http_handler('/js', assets_handler, [prefix]).
:- http_handler('/css', assets_handler, [prefix]).
:- http_handler('/images', assets_handler, [prefix]).

:- http_handler(/, default_handler, []).

server(Port):-

	http_server(http_dispatch, [port(Port)]).

default_handler(Request):-

	% display index.pwp
	reply_pwp_page('pwp/index.pwp',[],Request).
	
assets_handler(Request):-

	% file is not PWP
	memberchk(path(Path),Request),
	http_reply_file(root(Path),[],Request).