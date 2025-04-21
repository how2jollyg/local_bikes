{% docs _mrt_orders_to_customers %}

This model provides an aggregated view of orders by customer, combining data from multiple sources such as orders, order_items, categories and brands. It aims to analyse firhter the retention metrics for a customer such as:
- **Customer Lifetime Value**: Estimated revenue a business can reasonably expect from a single customer account throughout the business relationship.
SUM(sale_amount) * Average Customer Lifespan / Number of Customers
- **Customer Retention Rate**: Percentage of customers who continue to purchase over a specific period.

It provides a comprehensive view of each order, allowing for easy analysis of order performance, customer demographics, and feedback.

{% enddocs %}