:- ensure_loaded(months).

parse_todo(Line,Todo):-
    atom_string(Atom,Line),
    tokenize_atom(Atom,Tokens),
    phrase(todo(Todo),Tokens,[]).
    	
todo(Todo) -->
    [*],
    item(Todo).
    
item(completed(Description)) -->
    description(Description),
    [,],
    [done].
    
item(overdue(Description,Month,Day,Year)) -->
    description(Description),
    [,],
    past_date(Year,Month,Day).


item(upcoming(Description,Month,Day,Year)) -->
    description(Description),
    [,],
    future_date(Year,Month,Day).

future_date(Year,Month,Day) -->
    month(Month),
    [/],
    day(Day),
    [/],
    year(Year),
    {
        m(M,Month),
        get_time(CurrentTime),
        date_time_stamp(date(Year,M,Day),TodoTime),
        
        TodoTime > CurrentTime
    }.

past_date(Year,Month,Day) -->
    month(Month),
    [/],
    day(Day),
    ['/'],
    year(Year),
    {
        m(M,Month),
        get_time(CurrentTime),
        date_time_stamp(date(Year,M,Day),TodoTime),
        
        TodoTime =< CurrentTime
    }.

month(Month) -->
    [M], { m(M,Month) }.
    
day(Day) -->
    [Day], { Day < 31 }.
    
year(Year) -->
    [Year],
    {
        Year >= 1900,
        Year < 2100
    }.
    
description(Description) -->
    atom_list(AtomList),
    {
        atomics_to_string(AtomList," ",Description)
    }.
    
atom_list([]) --> [].

atom_list([Atom|AtomList]) --> 
    [Atom],!,
    atom_list(AtomList).