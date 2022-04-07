domains
    name, number, university = string

predicates
    person_number(name, number).
    person_university(name, university).
    
    number_university(number, university).

clauses
    person_number("Ilya", "89324189932").
    person_number("Ilya", "89412523512").
    person_number("Ivan", "89132412421").
    person_number("Petr", "89124512512").
    person_number("Ivan", "89125125215").
    person_number("Andrey", "89128295512").
    
    person_university("Ilya", "BMSTU").
    person_university("Ivan", "BMSTU").
    person_university("Petr", "MSU").
    person_university("Andrey", "MPEI").
    
    number_university(Number, University) :- 
        person_university(Person, University), 
        person_number(Person, Number).

goal
    person_number("Ivan", X).
    % person_number(X, "89324189932").
    % person_university("Ilya", X).
    % person_university(X, "BMSTU").
    % number_university(X, Y).
    % number_university(X, "BMSTU").
    
    