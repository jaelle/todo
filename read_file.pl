:- use_module(library(readutil)).
:- ensure_loaded(parse).

read_todos_from_file(File,Todos):-
    setup_call_cleanup(
        open(File,read,Stream),
    	(
    	    read_string(Stream, _Length, Contents),
    	    split_string(Contents, "\n", "", Lines),
    	    findall(
    	        Todo,
    	        (member(Line,Lines),
    	        parse_todo(Line,Todo)),
    	        Todos)
    	),
    	close(Stream)).