use sakila;
-- Suelte la columna picturede staff.

select picture
from sakila.staff;

alter table sakila.staff
drop column picture;

-- Se contrata a una nueva persona para ayudar a Jon. Su nombre es TAMMY SANDERS y es cliente. Actualice la base de datos en consecuencia.

INSERT INTO sakila.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES (3, 'Tammy', 'Sanders', 5, 'tammy.sanders@sakilastaff.com', 1, 1, 'Tammy' , 345, NOW());

-- Agregue el alquiler de la película "Academy Dinosaur" de Charlotte Hunter de Mike Hillyer en la Tienda 1. Puede usar la fecha actual para la rental_datecolumna de la rentaltabla. Sugerencia : consulte las columnas de la tabla de alquiler y vea qué información necesitaría agregar allí. Puede consultar esos datos. Por ejemplo, notarás que customer_idtambién necesitas información. Para conseguirlo puedes utilizar la siguiente consulta:

select *
from sakila.rental;

select rental_id
from sakila.rental
order by rental_id desc;

INSERT INTO sakila.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (16050, NOW(), 9, 130, NOW(), 1, NOW());

-- Elimine los usuarios no activos, pero primero cree una tabla de respaldo deleted_users para almacenar customer_id, emaily datepara los usuarios que se eliminarían. Sigue estos pasos:

select *
from sakila.customer;

SELECT COUNT(*) 
FROM sakila.customer 
WHERE active = 0;

SELECT *
FROM sakila.customer 
WHERE active = 0;

CREATE TABLE deleted_users (
    customer_id INT,
    email VARCHAR(255),
    date DATE
);

INSERT sakila.deleted_users (customer_id, email, date)
SELECT customer_id, email, CURDATE() AS date
FROM sakila.customer
WHERE active = 0;

SELECT * FROM sakila.deleted_users;

-- Delete the non active users from the table customer

SELECT customer_id FROM sakila.customer WHERE active = 0;

DELETE FROM sakila.payment
WHERE customer_id IN (SELECT customer_id FROM sakila.customer WHERE active = 0);

SELECT * FROM sakila.payment;

DELETE FROM sakila.rental
WHERE customer_id IN (SELECT customer_id FROM sakila.customer WHERE active = 0);

DELETE FROM sakila.customer
WHERE active = 0;

Select * from deleted_users;

