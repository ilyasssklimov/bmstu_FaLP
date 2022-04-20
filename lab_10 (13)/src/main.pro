domains
    person = string.
    number = string.
    
    city, street = string.
    house, flat = unsigned.
    address = address(city, street, house, flat).

    own_name = string.
    own_price = unsigned.
    
    car_color = string.

    bank, bank_account = string.
    bank_sum = unsigned.
    
    car = car(own_name, own_price, car_color).
    structure = structure(own_name, own_price).
    plot = plot(own_name, own_price).
    water = water(own_name, own_price).
    own = car(own_name, own_price, car_color); structure(own_name, own_price); 
          plot(own_name, own_price); water(own_name, own_price).

predicates
    person_number(person, number).
    person_car(person, car).
    person_bank(person, bank, bank_account, bank_sum).
    person_address(person, address).
    
    number_car(number, person, own_name, own_price).
    
    person_city_street_bank_number(person, city, street, bank, number).
    
    car_person_city_number_bank(own_name, car_color, person, city, number, bank).
    
    person_structure(person, structure).
    person_plot(person, plot).
    person_water(person, water).
    owner(person, own_name, own_price).
    
    car_price(person, own_price).
    structure_price(person, own_price).
    plot_price(person, own_price).
    water_price(person, own_price).
    owner_total_price(person, own_price).

clauses
    person_number("Klimov", "89124214959").
    person_number("Ivanov", "89424412959").
    person_number("Klimov", "89414215521").
    person_number("Petrov", "89412451252").
    
    person_car("Ivanov", car("Audi", 400000, "Black")).
    person_car("Klimov", car("Nissan", 200000, "White")).
    person_car("Petrov", car("BMW", 500000, "Green")).
    
    person_bank("Petrov", "Sber", "123456789012345", 2300000).
    person_bank("Klimov", "Tinkoff", "1491256789012195", 420000).
    person_bank("Klimov", "Alpha", "41455789212241", 10000000).
    person_bank("Ivanov", "Sber", "12344212412345", 42100000).
    
    person_address("Klimov", address("Moscow", "Street_1", 1, 12)).
    person_address("Ivanov", address("Moscow", "Street_2", 2, 32)).
    person_address("Petrov", address("St.Peterburg", "Street_3", 3, 42)).
    person_address("Klimov", address("St. Peterburg", "Street_4", 4, 52)).
    
    number_car(Number, Person, Car_model, Car_price) :-
        person_number(Person, Number), person_car(Person, car(Car_model, Car_price, _)).
    
    person_city_street_bank_number(Person, City, Street, Bank, Number) :- 
        person_address(Person, address(City, Street, _, _)), person_bank(Person, Bank, _, _), person_number(Person, Number).
    
    car_person_city_number_bank(Model, Color, Person, City, Number, Bank) :-
        person_car(Person, car(Model, _, Color)), person_address(Person, address(City, _, _, _)), 
        person_number(Person, Number), person_bank(Person, Bank, _, _).
    
    person_structure("Klimov", structure("Build_1", 1000000)).
    person_structure("Petrov", structure("Build_2", 2000000)).
    person_structure("Ivanov", structure("Build_3", 300000)).
    
    person_plot("Ivanov", plot("Plot_1", 500000)).
    person_plot("Klimov", plot("Plot_2", 100000)).
    
    person_water("Klimov", water("Water_transport_1", 10000000)).
    person_water("Petrov", water("Water_transport_2", 15000000)).
    
    car_price(Person, Price) :- person_car(Person, car(_, Price, _)), !.
    car_price(_, 0).
    
    structure_price(Person, Price) :- person_structure(Person, structure(_, Price)), !.
    structure_price(_, 0).
    
    plot_price(Person, Price) :- person_plot(Person, plot(_, Price)), !.
    plot_price(_, 0).
    
    water_price(Person, Price) :- person_water(Person, water(_, Price)), !.
    water_price(_, 0).
    
    owner(Person, Own, Price) :- person_car(Person, car(Own, Price, _)); person_structure(Person, structure(Own, Price)); 
                                 person_plot(Person, plot(Own, Price)); person_water(Person, water(Own, Price)).
                                 
    owner_total_price(Person, Total) :- car_price(Person, Price_1), structure_price(Person, Price_2),
                                        plot_price(Person, Price_3), water_price(Person, Price_4),
                                        Total = Price_1 + Price_2 + Price_3 + Price_4.
    
goal 
    % owner("Klimov", Own, _).
    % owner("Petrov", Own, Price).
    % owner_total_price("Ivanov", Total).