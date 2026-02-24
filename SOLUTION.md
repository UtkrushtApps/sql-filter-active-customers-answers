# Solution Steps

1. Create a new SQL file (for example, sql/filter_active_customers.sql) where you will place the reusable query for support agents.

2. Start the query with a SELECT clause that explicitly lists only the key columns you want to expose: customer id, first name, last name, email, phone, status, last_updated, and the city name.

3. Alias the tables for readability: use customers AS c and cities AS ci, then reference columns as c.column_name and ci.column_name.

4. In the SELECT list, include columns from customers (c.id, c.first_name, c.last_name, c.email, c.phone, c.status, c.last_updated) and the city name from cities (ci.name AS city_name).

5. Add a FROM clause that selects from the customers table, using the alias c: FROM customers AS c.

6. Join the cities table to customers so you can filter and display the city name. Use an INNER JOIN cities AS ci ON c.city_id = ci.id, assuming customers.city_id references cities.id.

7. Add a WHERE condition to restrict results to active customers. Use a status column check such as c.status = 'active'.

8. Extend the WHERE clause to exclude customers without a phone number by requiring c.phone IS NOT NULL.

9. Still within the WHERE clause, add the condition that the customer must either live in Bangalore or have an email ending with @examplecorp.com. Implement this as a grouped OR condition: (ci.name = 'Bangalore' OR c.email LIKE '%@examplecorp.com').

10. Ensure the WHERE clause combines all constraints with AND so that rows must be active, have a non-null phone, and satisfy the city-or-email rule.

11. Add an ORDER BY clause to sort rows from newest to oldest based on last update time: ORDER BY c.last_updated DESC.

12. Add a LIMIT clause to restrict the result set to the top 20 rows: LIMIT 20.

13. Review the full SELECT statement to confirm it is a single query, returns only the requested columns, filters correctly for active customers with non-null phone numbers, applies the Bangalore-or-email-domain condition, orders by most recent updates, and limits to 20 rows.

