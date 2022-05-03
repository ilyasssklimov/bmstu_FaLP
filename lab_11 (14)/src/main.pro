domains
    name, sex = string.
    gen = unsigned.
    person = person(name, sex, gen).

predicates
    person_parent(person, person).
    person_grandparent(person, person, person).
    person_parent_nth(person, person, unsigned).
    
clauses
    person_parent(person("Petr", "M", 0), person("Sergey", "M", 1)).
    person_parent(person("Petr", "M", 0), person("Larisa", "W", 1)).
    person_parent(person("Vera", "W", 0), person("Fedor", "M", 1)).
    person_parent(person("Vera", "W", 0), person("Valentina", "W", 1)).
    
    person_parent(person("Sergey", "M", 1), person("Nikolay", "M", 2)).
    person_parent(person("Sergey", "M", 1), person("Anastasiya", "W", 2)).
    person_parent(person("Larisa", "W", 1), person("Vladislav", "M", 2)).
    person_parent(person("Larisa", "W", 1), person("Irina", "W", 2)).
    person_parent(person("Fedor", "M", 1), person("Andrey", "M", 2)).
    person_parent(person("Fedor", "M", 1), person("Anna", "W", 2)).
    person_parent(person("Valentina", "W", 1), person("Ivan", "M", 2)).
    person_parent(person("Valentina", "W", 1), person("Elena", "W", 2)).
    
    person_parent(person("Nikolay", "M", 2), person("Mikhail", "M", 3)).
    person_parent(person("Nikolay", "M", 2), person("Tatyana", "W", 3)).
    person_parent(person("Anastasiya", "W", 2), person("Anton", "M", 3)).
    person_parent(person("Anastasiya", "W", 2), person("Nadezhda", "W", 3)).
    person_parent(person("Vladislav", "M", 2), person("Vadim", "M", 3)).
    person_parent(person("Vladislav", "M", 2), person("Ekaterina", "W", 3)).
    person_parent(person("Irina", "W", 2), person("Ivan", "M", 3)).
    person_parent(person("Irina", "W", 2), person("Elena", "W", 3)).
    person_parent(person("Andrey", "M", 2), person("Ioann", "M", 3)).
    person_parent(person("Andrey", "M", 2), person("Margarita", "W", 3)).
    person_parent(person("Anna", "W", 2), person("Alexandr", "M", 3)).
    person_parent(person("Anna", "W", 2), person("Oksana", "W", 3)).
    person_parent(person("Ivan", "M", 2), person("Oleg", "M", 3)).
    person_parent(person("Ivan", "M", 2), person("Lyubov", "W", 3)).
    person_parent(person("Elena", "W", 2), person("Dmitriy", "M", 3)).
    person_parent(person("Elena", "W", 2), person("Natalia", "W", 3)).
    
    person_parent(person("Mikhail", "M", 3), person("Evgeniy", "M", 4)).
    person_parent(person("Mikhail", "M", 3), person("Yana", "W", 4)).
    person_parent(person("Tatyana", "W", 3), person("Innokentiy", "M", 4)).
    person_parent(person("Tatyana", "W", 3), person("Elizaveta", "W", 4)).
    person_parent(person("Anton", "M", 3), person("Artem", "M", 4)).
    person_parent(person("Anton", "M", 3), person("Polina", "W", 4)).
    person_parent(person("Nadezhda", "W", 3), person("Anatoliy", "M", 4)).
    person_parent(person("Nadezhda", "W", 3), person("Taisiya", "W", 4)).
    person_parent(person("Vadim", "M", 3), person("Maksim", "M", 4)).
    person_parent(person("Vadim", "M", 3), person("Sofiya", "W", 4)).
    person_parent(person("Ekaterina", "W", 3), person("Kristian", "M", 4)).
    person_parent(person("Ekaterina", "W", 3), person("Kristina", "W", 4)).
    person_parent(person("Ivan", "M", 3), person("Viktor", "M", 4)).
    person_parent(person("Ivan", "M", 3), person("Veronika", "W", 4)).
    person_parent(person("Elena", "W", 3), person("Oleg", "M", 4)).
    person_parent(person("Elena", "W", 3), person("Rosa", "W", 4)).   
    person_parent(person("Ioann", "M", 3), person("Vladimir", "M", 4)).
    person_parent(person("Ioann", "M", 3), person("Anna", "W", 4)).
    person_parent(person("Margarita", "W", 3), person("Konstantin", "M", 4)).
    person_parent(person("Margarita", "W", 3), person("Aleftina", "W", 4)).
    person_parent(person("Alexandr", "M", 3), person("Eduard", "M", 4)).
    person_parent(person("Alexandr", "M", 3), person("Alexandra", "W", 4)).
    person_parent(person("Oksana", "W", 3), person("Miron", "M", 4)).
    person_parent(person("Oksana", "W", 3), person("Uluyana", "W", 4)).
    person_parent(person("Oleg", "M", 3), person("Damir", "M", 4)).
    person_parent(person("Oleg", "M", 3), person("Viktoriya", "W", 4)).
    person_parent(person("Lyubov", "W", 3), person("Andrey", "M", 4)).
    person_parent(person("Lyubov", "W", 3), person("Dariya", "W", 4)).
    person_parent(person("Dmitriy", "M", 3), person("Saveliy", "M", 4)).
    person_parent(person("Dmitriy", "M", 3), person("Kseniya", "W", 4)).
    person_parent(person("Natalia", "W", 3), person("Denis", "M", 4)).
    person_parent(person("Natalia", "W", 3), person("Miroslava", "W", 4)).
    
    person_parent(person("Evgeniy", "M", 4), person("Makar", "M", 5)).
    person_parent(person("Evgeniy", "M", 4), person("Klavdiya", "W", 5)).
    person_parent(person("Yana", "W", 4), person("Evgraf", "M", 5)).
    person_parent(person("Yana", "W", 4), person("Agata", "W", 5)).
    person_parent(person("Innokentiy", "M", 4), person("Semen", "M", 5)).
    person_parent(person("Innokentiy", "M", 4), person("Oksana", "W", 5)).
    person_parent(person("Elizaveta", "W", 4), person("Nikita", "M", 5)).
    person_parent(person("Elizaveta", "W", 4), person("Evdokiya", "W", 5)).
    person_parent(person("Artem", "M", 4), person("Daniil", "M", 5)).
    person_parent(person("Artem", "M", 4), person("Antonina", "W", 5)).
    person_parent(person("Polina", "W", 4), person("Florentin", "M", 5)).
    person_parent(person("Polina", "W", 4), person("Zoya", "W", 5)).
    person_parent(person("Anatoliy", "M", 4), person("Arhip", "M", 5)).
    person_parent(person("Anatoliy", "M", 4), person("Yuliya", "W", 5)).
    person_parent(person("Taisiya", "W", 4), person("Platon", "M", 5)).
    person_parent(person("Taisiya", "W", 4), person("Maya", "W", 5)).   
    person_parent(person("Maksim", "M", 4), person("Trofim", "M", 5)).
    person_parent(person("Maksim", "M", 4), person("Nadezhda", "W", 5)).
    person_parent(person("Sofiya", "W", 4), person("Filipp", "M", 5)).
    person_parent(person("Sofiya", "W", 4), person("Sofiya", "W", 5)).
    person_parent(person("Kristian", "M", 4), person("Ilya", "M", 5)).
    person_parent(person("Kristian", "M", 4), person("Anastasiya", "W", 5)).
    person_parent(person("Kristina", "W", 4), person("Boris", "M", 5)).
    person_parent(person("Kristina", "W", 4), person("Kira", "W", 5)).
    person_parent(person("Viktor", "M", 4), person("Denis", "M", 5)).
    person_parent(person("Viktor", "M", 4), person("Glafira", "W", 5)).
    person_parent(person("Veronika", "W", 4), person("Agafon", "M", 5)).
    person_parent(person("Veronika", "W", 4), person("Dariya", "W", 5)).
    person_parent(person("Oleg", "M", 4), person("Solomon", "M", 5)).
    person_parent(person("Oleg", "M", 4), person("Iraida", "W", 5)).
    person_parent(person("Rosa", "W", 4), person("Roman", "M", 5)).
    person_parent(person("Rosa", "W", 4), person("Ekaterina", "W", 5)).
    person_parent(person("Vladimir", "M", 4), person("Ivan", "M", 5)).
    person_parent(person("Vladimir", "M", 4), person("Nonna", "W", 5)).
    person_parent(person("Anna", "W", 4), person("Petr", "M", 5)).
    person_parent(person("Anna", "W", 4), person("Faina", "W", 5)).
    person_parent(person("Konstantin", "M", 4), person("Andrey", "M", 5)).
    person_parent(person("Konstantin", "M", 4), person("Karina", "W", 5)).
    person_parent(person("Aleftina", "W", 4), person("Benedikt", "M", 5)).
    person_parent(person("Aleftina", "W", 4), person("Varvara", "W", 5)).
    person_parent(person("Eduard", "M", 4), person("Artem", "M", 5)).
    person_parent(person("Eduard", "M", 4), person("Marina", "W", 5)).
    person_parent(person("Alexandra", "W", 4), person("Ruslan", "M", 5)).
    person_parent(person("Alexandra", "W", 4), person("Lidiya", "W", 5)).
    person_parent(person("Miron", "M", 4), person("Anton", "M", 5)).
    person_parent(person("Miron", "M", 4), person("Viktoriya", "W", 5)).
    person_parent(person("Uluyana", "W", 4), person("Vladimir", "M", 5)).
    person_parent(person("Uluyana", "W", 4), person("Vera", "W", 5)).   
    person_parent(person("Damir", "M", 4), person("Osip", "M", 5)).
    person_parent(person("Damir", "M", 4), person("Valentina", "W", 5)).
    person_parent(person("Viktoriya", "W", 4), person("Kirill", "M", 5)).
    person_parent(person("Viktoriya", "W", 4), person("Viktoriya", "W", 5)).
    person_parent(person("Andrey", "M", 4), person("Danil", "M", 5)).
    person_parent(person("Andrey", "M", 4), person("Mariya", "W", 5)).
    person_parent(person("Dariya", "W", 4), person("Maksim", "M", 5)).
    person_parent(person("Dariya", "W", 4), person("Eleonora", "W", 5)).
    person_parent(person("Saveliy", "M", 4), person("Viktor", "M", 5)).
    person_parent(person("Saveliy", "M", 4), person("Alena", "W", 5)).
    person_parent(person("Kseniya", "W", 4), person("Mikhail", "M", 5)).
    person_parent(person("Kseniya", "W", 4), person("Zinaida", "W", 5)).
    person_parent(person("Denis", "M", 4), person("Gleb", "M", 5)).
    person_parent(person("Denis", "M", 4), person("Raisa", "W", 5)).
    person_parent(person("Miroslava", "W", 4), person("Roman", "M", 5)).
    person_parent(person("Miroslava", "W", 4), person("Alexandra", "W", 5)).
        
    person_grandparent(Person, Parent, Grand) :- 
        person_parent(Person, Parent), person_parent(Parent, Grand).
    
    
    person_parent_nth(_, _, N) :- N < 1, !, fail.
    
    person_parent_nth(Person, person(Parent, Sex, Gen), N) :- 
        N = 1, person_parent(Person, person(Parent, Sex, Gen)), !.
    
    person_parent_nth(Person, Parent, N) :-
        person_parent(Person, NextParent),
        M = N - 1,
        person_parent_nth(NextParent, Parent, M).
   
goal
    % person_grandparent(person("Petr", _, 0), _, person(Person, "W", 2)).
    % person_grandparent(person("Vera", _, 0), _, person(Person, "M", 2)).
    % person_grandparent(person("Petr", _, 0), _, person(Person, _, 2)). 
    % person_grandparent(person("Vera", _, 0), person(_, "W", 1), person(Person, "W", 2)).
    % person_grandparent(person("Petr", _, 0), person(_, "W", 1), person(Person, _, 2)).
    
    person_parent_nth(person("Petr", "M", 0), person(Name, "W", Gen), 5).