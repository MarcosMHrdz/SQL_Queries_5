![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Laboratorio | Consultas SQL 5

En esta práctica de laboratorio, utilizará la base de datos [Sakila](https://dev.mysql.com/doc/sakila/en/) de alquiler de películas. Ya ha estado utilizando esta base de datos en un par de laboratorios, pero si necesita obtener los datos nuevamente, consulte el [enlace de instalación] oficial (https://dev.mysql.com/doc/sakila/en/sakila-installation .html).

La base de datos está estructurada de la siguiente manera:
![Esquema de base de datos](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/database-sakila-schema.png)

<br><br>

### Instrucciones

1. Elimine la columna "imagen" de "personal".
2. Se contrata a una nueva persona para ayudar a Jon. Su nombre es TAMMY SANDERS y es cliente. Actualice la base de datos en consecuencia.
3. Agregue el alquiler de la película "Academy Dinosaur" de Charlotte Hunter de Mike Hillyer en la Tienda 1. Puede usar la fecha actual para la columna "fecha_alquiler" en la tabla "alquiler".
   **Sugerencia**: Verifique las columnas en la tabla de alquiler y vea qué información necesitaría agregar allí. Puede consultar esos datos. Por ejemplo, notarás que también necesitas la información "customer_id". Para conseguirlo puedes utilizar la siguiente consulta:

    ```sql
    seleccione customer_id de sakila.cliente
    donde nombre = 'CHARLOTTE' y apellido = 'CAZADOR';
    ```
    
    Utilice un método similar para obtener `inventory_id`, `film_id` y `staff_id`.

4. Elimine los usuarios no activos, pero primero cree una _tabla de respaldo_ `usuarios_eliminados` para almacenar `id_cliente`, `correo electrónico` y la `fecha` de los usuarios que se eliminarían. Sigue estos pasos:

   - Comprobar si hay usuarios no activos
   - Cree una tabla _tabla de respaldo_ como se sugiere
   - Insertar los usuarios no activos en la tabla _tabla de respaldo_
   - Eliminar los usuarios no activos de la tabla _cliente_