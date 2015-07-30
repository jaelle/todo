:- use_module(library(http/json)).

json_completed(JSON,Todos):-
    findall(
        completed{item:Description},
        (member(Todo,Todos),
        Todo = completed(Description)),
        JSON).

json_upcoming(JSON,Todos):-
    findall(
        upcoming{item:Description,date:date{month:M,day:D,year:Y}},
        (member(Todo,Todos),
        Todo = upcoming(Description,M,D,Y)),
        JSON).