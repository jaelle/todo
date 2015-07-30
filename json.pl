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
    
/*
,
    	findall(
    	   Completed,
    	   (member(Completed,Todos),
    	   Completed = completed(_)),
    	   CompletedTodos),
    	   
    	findall(
    	    Upcoming,
    	    (member(Upcoming,Todos),
    	    Todo = upcoming(_,_,_,_)),
    	    UpcomingTodos),
    	
    	??json_completed(CompletedTodos),
    	writeln(CompletedTodos),
    	??json_upcoming(UpcomingTodos),
    	writeln(UpcomingTodos).
    	
json_completed(CompletedTodos):-
    forall(
        member(completed(Todo),CompletedTodos),
        ??json_write(current_output,todo{item:Todo})),
        writeln("").
        
    	
json_upcoming(UpcomingTasks):-
    forall(
        member(upcoming(Todo,Month,Day,Year),UpcomingTodos),
        ??json_write(current_output,todo{item:Todo,month:Month,day:day,year:Year})),
        writeln("").
*/