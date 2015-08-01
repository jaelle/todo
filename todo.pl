:- ensure_loaded(debug).
:- ensure_loaded(read_file).

test:-
    read_todos_from_file('todos.txt',Todos),
    writeln("Todos from todos.txt:"),
    writeln("----------------------"),
    writeln(Todos),
    forall(
        ( member(todo(someday,Todo),Todos) ; member(todo(Type,Todo,date(Y,M,D)),Todos)),
        writeln(Todo)).

pwp_date(Year,Month,Day,Date):-
    catch(
        atomics_to_string([by," ",Month," ",Day,,," ",Year],Date),
        _,
        fail),!.

pwp_date(_,_,_,"").