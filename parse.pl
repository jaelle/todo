:- ensure_loaded(months).

parse_todo(Line,Todo):-
    atom_string(Atom,Line),
    tokenize_atom(Atom,Tokens),
    phrase(todo(Todo),Tokens,[]).
    	
todo(Todo) -->
    [*],
    item(Todo),!.
    
item(todo(completed,Description,_)) -->
    description(Description),
    [,],
    [done].
    
item(todo(upcoming,Description,date(Y,M,D))) -->
    description(Description),
    [,],
    date(Y,M,D).

% TODO: create a rule that identifies overdue items

% TODO: create a rule that identifies upcoming due dates

% TODO: create an rule for items without dates

% TODO: create a rule that identifies future dates

% TODO: create a rule that identifies past dates

% Example date: 8/4/2015
date(Year,Month,Day) -->
    month(Month),
    [/],
    day(Day),
    [/],
    year(Year).

% TODO: add some other rules for representing a date
% Try: August 4, 2015

% numeric representation of a month(1-12)
month(Month) -->
    [M], { m(M,Month) }.

% TODO: add another rule for representing a month  
% try: text representation (ex: August)
    
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
    
line(Line) -->
    whole_line(AtomList),
    {
        atomics_to_string(AtomList," ",Line)
    }.

atom_list([]) --> [].

atom_list([Atom|AtomList]) --> 
    [Atom],!,
    atom_list(AtomList).

whole_line([Atom|AtomList]) -->
    [Atom],!,
    whole_line(AtomList).

whole_line([]) --> [].