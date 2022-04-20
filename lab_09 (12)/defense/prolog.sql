-- person_number(person, number).
create table if not exists person_number (
	person text,
	number text
);

-- person_car(person, car_model, car_color).
create table if not exists person_car (
	person text,
	car_model text,
	car_color text
);

-- model_price(car_model, car_price).
create table if not exists model_price (
	car_model text,
	car_price integer
);

-- person_bank(person, bank).
create table if not exists person_bank (
	person text,
	bank text
);

-- person_address(person, address).
create table if not exists person_address (
	person text,
	city text,
	street text,
	house integer,
	flat integer
);


-- person_number("Klimov", "89124214959").
insert into person_number(person, number) values('Klimov', '89124214959');

-- person_number("Ivanov", "89424412959").
insert into person_number(person, number) values('Ivanov', '89424412959');

-- person_number("Klimov", "89414215521").
insert into person_number(person, number) values('Klimov', '89414215521');

-- person_number("Petrov", "89412451252").
insert into person_number(person, number) values('Petrov', '89412451252');


-- person_car("Ivanov", "Audi", "Black").
insert into person_car(person, car_model, car_color) values('Ivanov', 'Audi', 'Black');

-- person_car("Klimov", "Nissan", "White").
insert into person_car(person, car_model, car_color) values('Klimov', 'Nissan', 'White');

-- person_car("Petrov", "BMW", "Green").
insert into person_car(person, car_model, car_color) values('Petrov', 'BMW', 'Green');

-- person_car("Klimov", "BMW", "Green").
insert into person_car(person, car_model, car_color) values('Klimov', 'BMW', 'Green');

 
-- model_price("BMW", 500000).
insert into model_price(car_model, car_price) values('BMW', 500000);

-- model_price("Audi", 400000).
insert into model_price(car_model, car_price) values('Audi', 400000);

-- model_price("Nissan", 200000).
insert into model_price(car_model, car_price) values('Nissan', 200000);

    
-- person_bank("Petrov", "Sber").
insert into person_bank(person, bank) values('Petrov', 'Sber');

-- person_bank("Klimov", "Tinkoff").
insert into person_bank(person, bank) values('Klimov', 'Tinkoff');

-- person_bank("Klimov", "Alpha").
insert into person_bank(person, bank) values('Klimov', 'Alpha');

-- person_bank("Ivanov", "Sber").
insert into person_bank(person, bank) values('Ivanov', 'Sber');
 

-- person_address("Klimov", address("Moscow", "Street_1", 1, 12)).
insert into person_address(person, city, street, house, flat) values('Klimov', 'Moscow', 'Street_1', 1, 12);

-- person_address("Ivanov", address("Moscow", "Street_2", 2, 32)).
insert into person_address(person, city, street, house, flat) values('Ivanov', 'Moscow', 'Street_2', 2, 32);

-- person_address("Petrov", address("St.Peterburg", "Street_3", 3, 42)).
insert into person_address(person, city, street, house, flat) values('Petrov', 'St.Peterburg', 'Street_3', 3, 42);

-- person_address("Klimov", address("St. Peterburg", "Street_4", 4, 52)).
insert into person_address(person, city, street, house, flat) values('Klimov', 'St.Peterburg', 'Street_4', 4, 52);


-- number_car("89124214959", Person, Model, Price).
select pn.person, pc.car_model, mp.car_price
from (select * from person_number where number = '89124214959') pn
	join person_car pc on pn.person = pc.person
	join model_price mp on pc.car_model = mp.car_model;

-- number_car("89424412959", _, Model, _).
select pc.car_model 
from (select * from person_number where number = '89424412959') pn
	join person_car pc on pn.person = pc.person;
	

-- person_city_street_bank_number("Klimov", "Moscow", Street, Bank, Number).
select pa.street, pb.bank, pn.number
from (select person, street from person_address where person = 'Klimov' and city = 'Moscow') pa
	join person_bank pb on pa.person = pb.person
	join person_number pn on pa.person = pn.person;
	

-- car_person_city_number_bank("BMW", "Green", Person, City, Number, Bank).
select pc.person, pa.city, pn.number, pb.bank
from (select person from person_car where car_model = 'BMW' and car_color = 'Green') pc
	join person_address pa on pc.person = pa.person
	join person_number pn on pc.person = pn.person
	join person_bank pb on pc.person = pb.person;
	
-- car_person_city_number_bank("Audi", "Black", Person, City, Number, Bank).
select pc.person, pa.city, pn.number, pb.bank
from (select person from person_car where car_model = 'Audi' and car_color = 'Black') pc
	join person_address pa on pc.person = pa.person
	join person_number pn on pc.person = pn.person
	join person_bank pb on pc.person = pb.person;
	
-- car_person_city_number_bank("BMW", "White", Person, City, Number, Bank).
select pc.person, pa.city, pn.number, pb.bank
from (select person from person_car where car_model = 'BMW' and car_color = 'White') pc
	join person_address pa on pc.person = pa.person
	join person_number pn on pc.person = pn.person
	join person_bank pb on pc.person = pb.person;