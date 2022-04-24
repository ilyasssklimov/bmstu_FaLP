domains
    name, sex = string.
    person = person(name, sex).


predicates
    person_parent(person, person).
    person_grandparent(person, person, person).


clauses
    person_parent(person("Ilya", "M"), person("Sergey", "M")).
    person_parent(person("Ilya", "M"), person("Larisa", "W")).
    person_parent(person("Maria", "W"), person("Fedor", "M")).
    person_parent(person("Maria", "W"), person("Valentina", "W")).
    
    person_parent(person("Sergey", "M"), person("Nikolay", "M")).
    person_parent(person("Sergey", "M"), person("Anastasiya", "W")).
    person_parent(person("Larisa", "W"), person("Vladislav", "M")).
    person_parent(person("Larisa", "W"), person("Irina", "W")).
    person_parent(person("Fedor", "M"), person("Andrey", "M")).
    person_parent(person("Fedor", "M"), person("Anna", "W")).
    person_parent(person("Valentina", "W"), person("Ivan", "M")).
    person_parent(person("Valentina", "W"), person("Elena", "W")).
    
    person_grandparent(person(Person, Sex_1), person(Parent, Sex_2),
                       person(Grand, Sex_3)) :-
        person_parent(person(Person, Sex_1), person(Parent, Sex_2)), 
        person_parent(person(Parent, Sex_2), person(Grand, Sex_3)).
    
goal
    % person_grandparent(person("Ilya", "M"), _, person(Person, "W")).
    % person_grandparent(person("Maria", "W"), _, person(Person, "M")).
    % person_grandparent(person("Ilya", "M"), _, person(Person, _)). 
    % person_grandparent(person("Maria", "W"), person(_, "W"), person(Person, "W")).
    % person_grandparent(person("Ilya", "M"), person(_, "W"), person(Person, _)).