:- ensure_loaded(months).

parse_todo(Line,Todo):-
    atom_string(Atom,Line),
    tokenize_atom(Atom,Tokens),
    phrase(todo(Todo),Tokens,[]).
    	
todo(Todo) -->
    [*],
    item(Todo).
    
item(todo(completed,Description,_)) -->
    description(Description),
    [,],
    [done].
    
item(todo(overdue,Description,date(Year,Month,Day))) -->
    description(Description),
    [,],
    past_date(Year,Month,Day).

item(todo(upcoming,Description,date(Year,Month,Day))) -->
    description(Description),
    [,],
    future_date(Year,Month,Day).

future_date(Year,Month,Day) -->
    date(Year,Month,Day),
    {
        m(M,Month),
        get_time(CurrentTime),
        date_time_stamp(date(Year,M,Day),TodoTime),
        
        TodoTime > CurrentTime
    }.

past_date(Year,Month,Day) -->
    date(Year,Month,Day),
    {
        m(M,Month),
        get_time(CurrentTime),
        date_time_stamp(date(Year,M,Day),TodoTime),
        
        TodoTime =< CurrentTime
    }.

% 8/4/2015
date(Year,Month,Day) -->
    month(Month),
    [/],
    day(Day),
    [/],
    year(Year).

% add some other rules for representing a date
% Try: August 4, 2015
date(Year,Month,Day) -->
    month(Month),
    day(Day),
    [,],
    year(Year).

% numeric representation (1-12)
month(Month) -->
    [M], { m(M,Month) }.

% add some other rules for representing a month  
% try: text representation (ex: August)
month(Month) -->
    [Month], { m(_,Month) }.
    
day(Day) -->
    [Day], 
    { 
        integer(Day),
        Day > 0,
        Day =< 31 
    }.
    
year(Year) -->
    [Year],
    {
        integer(Year),
        Year >= 2000,
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