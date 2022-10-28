--Таблица employees
--
--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.


create table employees(
	id serial primary key,
	employee_name Varchar(50) not null
);



insert into employees(employee_name)
values 
('Igor_1'),
('Igor_2'),
('Igor_3'),
('Igor_4'),
('Igor_5'),
('Igor_6'),
('Igor_7'),
('Igor_8'),
('Igor_9'),
('Igor_10'),
('Igor_11'),
('Igor_12'),
('Igor_13'),
('Igor_14'),
('Igor_15'),
('Igor_16'),
('Igor_17'),
('Igor_18'),
('Igor_19'),
('Igor_20'),
('Igor_21'),
('Igor_22'),
('Igor_23'),
('Igor_24'),
('Igor_25'),
('Igor_26'),
('Igor_27'),
('Igor_28'),
('Igor_29'),
('Igor_30'),
('Igor_31'),
('Igor_32'),
('Igor_33'),
('Igor_34'),
('Igor_35'),
('Igor_36'),
('Igor_37'),
('Igor_38'),
('Igor_39'),
('Igor_40'),
('Igor_41'),
('Igor_42'),
('Igor_43'),
('Igor_44'),
('Igor_45'),
('Igor_46'),
('Igor_47'),
('Igor_48'),
('Igor_49'),
('Igor_50'),
('Igor_51'),
('Igor_52'),
('Igor_53'),
('Igor_54'),
('Igor_55'),
('Igor_56'),
('Igor_57'),
('Igor_58'),
('Igor_59'),
('Igor_60'),
('Igor_61'),
('Igor_62'),
('Igor_63'),
('Igor_64'),
('Igor_65'),
('Igor_66'),
('Igor_67'),
('Igor_68'),
('Igor_69'),
('Igor_70');

select * from employees;


--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
--Наполнить таблицу salary 16 строками:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500

create table salary(
id serial primary key,
monthly_salary Int not null
)

insert into salary(monthly_salary)
values (1000),
	(1100),
	(1200),
	(1300),
	(1400),
	(1500),
	(1600),
	(1700),
	(1800),
	(1900),
	(2000),
	(2100),
	(2200),
	(2300),
	(2400),
	(2500);
select * from salary;


--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
)

insert into employee_salary(employee_id, salary_id)
values (71,15),
		(72,14),
		(73,13),
		(74,12),
		(75,11),
		(76,10),
		(77,9),
		(78,8),
		(79,7),
		(80,6),
		(1,5),
		(2,4),
		(3,3),
		(4,2),
		(5,1),
		(6,1),
		(7,2),
		(8,3),
		(9,4),
		(10,5),
		(11,6),
		(12,7),
		(13,8),
		(14,9),
		(15,10),
		(16,11),
		(17,12),
		(18,13),
		(19,14),
		(20,15),
		(21,16),
		(22,15),
		(23,14),
		(24,13),
		(25,12),
		(26,11),
		(27,10),
		(28,9),
		(29,8),
		(30,7);
select * from employee_salary;

--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--Поменять тип столба role_name с int на varchar(30)
--Наполнить таблицу roles 20 строками:


create table roles(
id serial primary key,
role_name int not null unique
)

alter table roles
alter column role_name type varchar(30)

insert into roles(role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');
select * from roles;


--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--Наполнить таблицу roles_employee 40 строками:

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id)
);
select * from roles_employee;

insert into roles_employee(employee_id, role_id)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,19),
(22,18),
(23,17),
(24,16),
(25,15),
(26,14),
(27,13),
(28,12),
(29,11),
(30,10),
(31,9),
(32,8),
(33,7),
(34,6),
(35,5),
(36,4),
(37,3),
(38,2),
(39,1),
(40,15);
select * from roles_employee



-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary from employees
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary from employees
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary, employee_name from employees
right join employee_salary on
employees.id = employee_salary.employee_id
join salary on
employee_salary.salary_id = salary.id
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary, employee_name from employees
right join employee_salary on
employees.id = employee_salary.employee_id
join salary on
employee_salary.salary_id = salary.id
where employee_name is null
and salary.monthly_salary < 2000;


-- 5. Найти всех работников кому не начислена ЗП.

select monthly_salary, employee_name from employees
right join employee_salary on
employees.id = employee_salary.employee_id
join salary on
employee_salary.salary_id = salary.id
where monthly_salary is null


-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name from employees
join roles on
employees.id = roles.id

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from employees
join roles on
employees.id = roles.id
where roles.role_name like '%_ava %'

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from employees
join roles on
employees.id = roles.id
where roles.role_name like '%_ython %'

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from employees
join roles on
employees.id = roles.id
where roles.role_name like '%QA%'

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from employees
join roles on
employees.id = roles.id
where roles.role_name like '%l QA%'

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from employees
join roles on
employees.id = roles.id
where roles.role_name like '%n QA%'

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%Junior%'

-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%Middle%'

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%Senior%'

-- 15. Вывести зарплаты Java разработчиков

select monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%_ava %'

-- 16. Вывести зарплаты Python разработчиков

select monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%Python%'

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%unior% %ython%'

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%iddle% %cript%'

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%enior% %ava %'

-- 20. Вывести зарплаты Junior QA инженеров

select monthly_salary from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%unior% %QA%'

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%unior%'


-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%cript%'

-- 23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%QA%'

-- 24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) from employees
join roles on
employees.id = roles.id
join employee_salary on
employees.id = employee_salary.id
join salary on
employee_salary.id = salary.id
where roles.role_name like '%QA%'

-- 25. Вывести количество QA инженеров

select count(role_name) from roles
where role_name like '%QA%'

-- 26. Вывести количество Middle специалистов.

select count(role_name) from roles
where role_name like '%_iddle%'

-- 27. Вывести количество разработчиков

select count(role_name) from roles
where role_name like '%_eveloper%'

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) from employee_salary
join roles_employee on 
employee_salary.employee_id = roles_employee.employee_id
join salary on
employee_salary.salary_id = salary.id
join roles on
roles_employee.role_id = roles.id
where role_name like '%_eveloper%'


-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary from employee_salary
join roles_employee on 
employee_salary.employee_id = roles_employee.employee_id
join salary on
employee_salary.salary_id = salary.id
join roles on
roles_employee.role_id = roles.id
join employees on
employee_salary.employee_id = employees.id
order by monthly_salary;


-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary from employee_salary
join roles_employee on 
employee_salary.employee_id = roles_employee.employee_id
join salary on
employee_salary.salary_id = salary.id
join roles on
roles_employee.role_id = roles.id
join employees on
employee_salary.employee_id = employees.id
where monthly_salary between 1700 and 2300
order by monthly_salary

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary from employee_salary
join roles_employee on 
employee_salary.employee_id = roles_employee.employee_id
join salary on
employee_salary.salary_id = salary.id
join roles on
roles_employee.role_id = roles.id
join employees on
employee_salary.employee_id = employees.id
where monthly_salary < 2300
order by monthly_salary

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary from employee_salary
join roles_employee on 
employee_salary.employee_id = roles_employee.employee_id
join salary on
employee_salary.salary_id = salary.id
join roles on
roles_employee.role_id = roles.id
join employees on
employee_salary.employee_id = employees.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary
