:- ensure_loaded(debug).
:- ensure_loaded(read_file).
:- ensure_loaded(json).

test:-
    read_todos_from_file('todos.txt',Todos),
    completed(Completed,Todos),
    upcoming(Upcoming,Todos),
    overdue(Overdue,Todos),
    writeln(Overdue),
    writeln(Upcoming),
    writeln(Completed).
    
completed(Completed,Todos):-
    findall(
        Item,
        (member(Todo,Todos),
        Todo = completed(Item)),
        Completed).

upcoming(Upcoming,Todos):-
    findall(
        [Item,date(Y,M,D)],
        (member(Todo,Todos),
        Todo = upcoming(Item,M,D,Y)),
        Upcoming).
        
overdue(Overdue,Todos):-
    findall(
        [Item,date(Y,M,D)],
        (member(Todo,Todos),
        Todo = overdue(Item,M,D,Y)),
        Overdue).