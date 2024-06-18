USE SAKILA;
-- Convierta la consulta en un procedimiento almacenado simple. Utilice la siguiente consulta:
  DELIMITER //

 

CREATE PROCEDURE GetActionMovieRenters()

BEGIN

  SELECT first_name, last_name, email

  FROM customer

  JOIN rental ON customer.customer_id = rental.customer_id

  JOIN inventory ON rental.inventory_id = inventory.inventory_id

  JOIN film ON film.film_id = inventory.film_id

  JOIN film_category ON film_category.film_id = film.film_id

  JOIN category ON category.category_id = film_category.category_id

  WHERE category.name = "Action"

  GROUP BY first_name, last_name, email;

END //

 

DELIMITER ;

CALL GetActionMovieRenters();

-- Actualice el procedimiento almacenado de tal manera que pueda tomar un argumento de cadena para el nombre de la categoría y devolver los resultados para todos los clientes que alquilaron películas de esa categoría/género.
--  Por ejemplo, podría ser action, animation, children, classics, etc.

DELIMITER //

 

CREATE PROCEDURE ObtenerClientesPorCategoria(IN categoria VARCHAR(50))

BEGIN

  SELECT first_name, last_name, email

  FROM customer

  JOIN rental ON customer.customer_id = rental.customer_id

  JOIN inventory ON rental.inventory_id = inventory.inventory_id

  JOIN film ON film.film_id = inventory.film_id

  JOIN film_category ON film_category.film_id = film.film_id

  JOIN category ON category.category_id = film_category.category_id

  WHERE category.name = categoria

  GROUP BY first_name, last_name, email;

END //

 

DELIMITER ;

CALL ObtenerClientesPorCategoria("Animation");

-- Escriba una consulta para verificar la cantidad de películas estrenadas en cada categoría de películas. Convierta la consulta en un procedimiento almacenado para filtrar solo aquellas categorías que tienen películas lanzadas más de un número determinado. 
-- Pase ese número como argumento en el procedimiento almacenado.
SELECT category.name AS category_name, COUNT(film.film_id) AS number_of_movies

FROM category

JOIN film_category ON category.category_id = film_category.category_id

JOIN film ON film_category.film_id = film.film_id

GROUP BY category.name;


DELIMITER //

 

CREATE PROCEDURE ObtenerCategoriasConPeliculasMinimas(IN min_peliculas INT)

BEGIN

  SELECT category.name AS category_name, COUNT(film.film_id) AS number_of_movies

  FROM category

  JOIN film_category ON category.category_id = film_category.category_id

  JOIN film ON film_category.film_id = film.film_id

  GROUP BY category.name

  HAVING number_of_movies > min_peliculas;

END //

 

DELIMITER ;


CALL ObtenerCategoriasConPeliculasMinimas(10);