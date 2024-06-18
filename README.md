# LABweek15Martes
LABweek15Martes
Laboratorio | Procedimientos almacenados
En esta práctica de laboratorio continuaremos trabajando en la base de datos de alquiler de películas de Sakila .

Instrucciones
Escriba consultas, procedimientos almacenados para responder las siguientes preguntas:

En la práctica de laboratorio anterior escribimos una consulta para buscar el nombre, apellido y correos electrónicos de todos los clientes que alquilaron Actionpelículas. Convierta la consulta en un procedimiento almacenado simple. Utilice la siguiente consulta:

  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by first_name, last_name, email;
Ahora sigue trabajando en el procedimiento almacenado anterior para hacerlo más dinámico. Actualice el procedimiento almacenado de tal manera que pueda tomar un argumento de cadena para el nombre de la categoría y devolver los resultados para todos los clientes que alquilaron películas de esa categoría/género. Por ejemplo, podría ser action, animation, children, classics, etc.

Escriba una consulta para verificar la cantidad de películas estrenadas en cada categoría de películas. Convierta la consulta en un procedimiento almacenado para filtrar solo aquellas categorías que tienen películas lanzadas más de un número determinado. Pase ese número como argumento en el procedimiento almacenado.
