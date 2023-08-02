-- Write an SQL query to report the Capital gain/loss for each stock.

-- The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

-- Return the result table in any order.

-- The query result format is in the following example.

 
/*
Example 1:

Input: 
Stocks table:
+---------------+-----------+---------------+--------+
| stock_name    | operation | operation_day | price  |
+---------------+-----------+---------------+--------+
| Leetcode      | Buy       | 1             | 1000   |
| Corona Masks  | Buy       | 2             | 10     |
| Leetcode      | Sell      | 5             | 9000   |
| Handbags      | Buy       | 17            | 30000  |
| Corona Masks  | Sell      | 3             | 1010   |
| Corona Masks  | Buy       | 4             | 1000   |
| Corona Masks  | Sell      | 5             | 500    |
| Corona Masks  | Buy       | 6             | 1000   |
| Handbags      | Sell      | 29            | 7000   |
| Corona Masks  | Sell      | 10            | 10000  |
+---------------+-----------+---------------+--------+ */



select stock_name,
SUM(case when operation='Sell' then price else -price end)
as capital_gain_loss
from stocks
group by stock_name
