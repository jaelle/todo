:- ensure_loaded(debug).
:- ensure_loaded(read_file).

test(Description):-
    read_todos_from_file('todos.txt',Todos),
    member(todo(Type,Description,date(Y,M,D)),Todos).

pwp_date(Year,Month,Day,Date):-
    catch(
        atomics_to_string([by," ",Month," ",Day,,," ",Year],Date),
        _,
        fail).

pwp_date(_,_,_,""):-!.