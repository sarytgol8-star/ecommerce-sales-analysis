
SELECT count(*) as total_orders --сумма заказов
FROM orders;


SELECT * FROM orders LIMIT 10;     --10 первых значений
SELECT * FROM order_items LIMIT 10;


SELECT count(*) as count,order_status
from orders 
where order_status = 'delivered'
group by order_status      --сумма
ORDER BY count desc;



Select    --объединение 2 табл и общая стоимость товаров
sum(o_i.price)
from orders as o
inner join order_items as o_i
on o.order_id=o_i.order_id
where o.order_status = 'delivered';


Select sum(o_i.price)/COUNT(DISTINCT o.order_id) as average_check 
from orders as o
inner join order_items as o_i   --средний чек
on o.order_id=o_i.order_id
where o.order_status = 'delivered';


Select DATE_TRUNC('month', o.order_purchase_timestamp) as month,--(перевод в месяцы),
sum(o_i.price) as total_sales
from orders as o
inner join order_items as o_i   --АНАЛИЗ ПО МЕСЯЦАМ ДОСТАВЛЕННЫХ ТОВАРОВ
on o.order_id=o_i.order_id
where o.order_status = 'delivered'
group by month
order by month;


Select DATE_TRUNC('month', o.order_purchase_timestamp) as month,
sum(o_i.price) as total_sales
from orders as o
inner join order_items as o_i     --топ 5 месяцев по продажам
on o.order_id=o_i.order_id 
where o.order_status = 'delivered'
group by month
order by total_sales desc LIMIT 5;



SELECT * FROM products LIMIT 5;  --5 названий товаров
SELECT * FROM category_translation LIMIT 5;


SELECT 'products' AS table_name, COUNT(*) AS total_rows
FROM products   --сумма всего
UNION ALL
SELECT 'category_translation', COUNT(*)
FROM category_translation;


Select ct.product_category_name_english as English_name,sum(o_i.price) as total_sales
from orders as o
inner join order_items as o_i
on o.order_id=o_i.order_id
inner join products as p         --объединение 4 табл
on o_i.product_id=p.product_id
inner join category_translation as ct
on p.product_category_name=ct.product_category_name
where o.order_status = 'delivered' 
group by product_category_name_english
order by sum(o_i.price) desc limit 10;


Select DATE_TRUNC('month', o.order_purchase_timestamp) as month,
count(DISTINCT o.order_id) as total_orders
from orders as o
inner join order_items as o_i     --топ заказов по месяцам
on o.order_id=o_i.order_id 
where o.order_status = 'delivered'
group by month
order by month asc;


Select order_status,COUNT(*) AS total_orders
from orders as o       --сумма по месяцам
group by order_status
order by total_orders desc;




SELECT
    ROUND(SUM(oi.price), 2) AS total_sales,

    ROUND(
        SUM(
            CASE
                WHEN ct.product_category_name_english IS NOT NULL
                THEN oi.price
                ELSE 0
            END
        ), 2
    ) AS categorized_sales,

    ROUND(
        SUM(
            CASE
                WHEN ct.product_category_name_english IS NULL
                THEN oi.price
                ELSE 0
            END
        ), 2
    ) AS missing_sales
FROM orders AS o
INNER JOIN order_items AS oi
ON o.order_id = oi.order_id
LEFT JOIN products AS p
ON oi.product_id = p.product_id

LEFT JOIN category_translation AS ct
ON p.product_category_name = ct.product_category_name
WHERE o.order_status = 'delivered';
