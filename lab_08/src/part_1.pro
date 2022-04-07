domains 
    name, number = string

predicates
    person_number(name, number).

clauses
    person_number("Ilya", "89125123253").
    person_number("Ivan", "89424125931").
    person_number("Ilya", "89412415212").
    person_number("Petr", "81231412412").
    
goal
    % person_number("Petr", Number).
    % person_number(Name, Number).
    % person_number(Name, "89125123253").
    % person_number("Ilya", Number).