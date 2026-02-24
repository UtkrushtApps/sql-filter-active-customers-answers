-- Focused query for active customers support lookup

SELECT
    c.id          AS customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone,
    c.status,
    c.last_updated,
    ci.name       AS city_name
FROM
    customers AS c
    INNER JOIN cities AS ci
        ON c.city_id = ci.id
WHERE
    -- Only active customers
    c.status = 'active'
    -- Require a non-null phone number
    AND c.phone IS NOT NULL
    -- Either live in Bangalore OR have the specified email domain
    AND (
        ci.name = 'Bangalore'
        OR c.email LIKE '%@examplecorp.com'
    )
ORDER BY
    c.last_updated DESC
LIMIT 20;