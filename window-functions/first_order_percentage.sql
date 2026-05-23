-- ❓ Problem
-- Percentage of customers whose first order was immediate.

-- ✅ Solution
SELECT
    ROUND(
        100 * AVG(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 1.0
                ELSE 0.0
            END
        ),
        2
    ) AS immediate_percentage
FROM (
    SELECT
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS rn
    FROM delivery
) t
WHERE rn = 1;
