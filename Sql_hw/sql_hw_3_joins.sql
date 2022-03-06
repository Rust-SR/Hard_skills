--SQL HomeWork 3. Joins

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select employees.employee_name, employee_salary.employee_id
from employee_salary 
join employees on employees.id = employee_salary.employee_id 
full join salary on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null;

-- вариант 2
select monthly_salary
from employee_salary 
join salary on employee_salary.salary_id = salary.id 
where employee_salary.employee_id >= 70;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employees.employee_name 
from employee_salary 
full join employees on employee_salary.employee_id = employees.id
full join salary on employee_salary.salary_id = salary.id
where employee_name is null and monthly_salary < 2000;
 
-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, employee_salary.salary_id
from employees
full join employee_salary on employees.id = employee_salary.id
where salary_id is null;


--6. Вывести всех работников с названиями их должности.
select employees.employee_name, roles.role_name 
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles.role_name 
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Java developer';

--8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, roles.role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Python developer';

--9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%QA engineer';

-- 10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Manual QA engineer';

-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Automation QA engineer';

-- 12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join roles on employee_salary.employee_id = roles.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join roles on employee_salary.employee_id = roles.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join roles on employee_salary.employee_id = roles.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select salary.monthly_salary
from roles_employee
full join roles on roles.id = roles_employee.role_id
full join employee_salary on roles_employee.id = employee_salary.id
join employees on employees.id = employee_salary.employee_id 
full join salary on salary.id = employee_salary.salary_id 
where role_name like '%Java developer';

-- 16. Вывести зарплаты Python разработчиков
select roles.role_name, salary.monthly_salary 
from employee_salary 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python 
select employees.employee_name, salary.monthly_salary
from employee_salary
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
join roles on employee_salary.employee_id = roles.id
where role_name like '%Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
join roles on employee_salary.employee_id = roles.id
where role_name like '%Middle JavaScript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
join roles on employee_salary.employee_id = roles.id
where role_name like '%Senior Java%';


-- 20. Вывести зарплаты Junior QA инженеров
select employees.employee_name, salary.monthly_salary, roles.role_name
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
join roles on employee_salary.employee_id = roles.id
where role_name like '%Junior%' and role_name like '%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов
select avg (salary.monthly_salary) as avg
from employee_salary
join roles on employee_salary.salary_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum (salary.monthly_salary) as sum
from employee_salary 
join roles on employee_salary.salary_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров
select min (salary.monthly_salary) as min
from employee_salary 
join roles on employee_salary.salary_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA engineer%';

 --24. Вывести максимальную ЗП QA инженеров
select max (salary.monthly_salary) as max
from employee_salary 
join roles on employee_salary.salary_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA engineer%';

-- 25. Вывести количество QA инженеров
select count (roles.role_name) as count 
from roles_employee 
join roles on roles_employee.role_id = roles.id
where role_name like '%QA engineer%';

-- 26. Вывести количество Middle специалистов.
select count (roles.role_name) as count 
from roles_employee 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count (roles.role_name) as count 
from roles_employee 
join roles on roles_employee.role_id = roles.id 
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum (salary.monthly_salary) as sum
from employee_salary
join roles on employee_salary.salary_id = roles.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
order by salary.monthly_salary 

--30. Вывести имена, должности и ЗП всех специалистов по 
--возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary > 1700 and monthly_salary < 2300
order by salary.monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию 
--у специалистов у которых ЗП меньше 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2300
order by salary.monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у 
--специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
order by salary.monthly_salary;
