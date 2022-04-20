domains
    person = string.
    number = string.
    
    city, street = string.
    house, flat = unsigned.
    address = address(city, street, house, flat).

    car_model, car_color = string.
    car_price = unsigned.

    bank = string.
    bank_sum = unsigned.


predicates
    person_number(person, number).
    person_car(person, car_model, car_color).
    model_price(car_model, car_price).
    person_bank(person, bank).
    person_address(person, address).
    
    number_car(number, person, car_model, car_price).
    
    person_city_street_bank_number(person, city, street, bank, number).
    
    car_person_city_number_bank(car_model, car_color, person, city, number, bank).

clauses
    person_number("Klimov", "89124214959").
    person_number("Ivanov", "89424412959").
    person_number("Klimov", "89414215521").
    person_number("Petrov", "89412451252").
    
    person_car("Ivanov", "Audi", "Black").
    person_car("Klimov", "Nissan", "White").
    person_car("Petrov", "BMW", "Green").
    person_car("Klimov", "BMW", "Green").
    
    model_price("BMW", 500000).
    model_price("Audi", 400000).
    model_price("Nissan", 200000).
    
    person_bank("Petrov", "Sber").
    person_bank("Klimov", "Tinkoff").
    person_bank("Klimov", "Alpha").
    person_bank("Ivanov", "Sber").
    
    person_address("Klimov", address("Moscow", "Street_1", 1, 12)).
    person_address("Ivanov", address("Moscow", "Street_2", 2, 32)).
    person_address("Petrov", address("St.Peterburg", "Street_3", 3, 42)).
    person_address("Klimov", address("St. Peterburg", "Street_4", 4, 52)).
    
    
    number_car(Number, Person, Car_model, Car_price) :-
        person_number(Person, Number), person_car(Person, Car_model, _), model_price(Car_model, Car_price).
    
    person_city_street_bank_number(Person, City, Street, Bank, Number) :- 
        person_address(Person, address(City, Street, _, _)), person_bank(Person, Bank), person_number(Person, Number).
    
    car_person_city_number_bank(Model, Color, Person, City, Number, Bank) :-
        person_car(Person, Model, Color), person_address(Person, address(City, _, _, _)), 
        person_number(Person, Number), person_bank(Person, Bank).

goal
    % ---- PART 1 ----
    % number_car("89124214959", Person, Model, Price).
    % number_car("89424412959", _, Model, _).

    % person_city_street_bank_number("Klimov", "Moscow", Street, Bank, Number).
    
    % ---- PART 2 ----
    % some owners
    % car_person_city_number_bank("BMW", "Green", Person, City, Number, Bank).
    
    % one owner
    % car_person_city_number_bank("Audi", "Black", Person, City, Number, Bank).
    
    % no owners
    % car_person_city_number_bank("BMW", "White", Person, City, Number, Bank).