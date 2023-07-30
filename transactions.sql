-- Active: 1688787340623@@127.0.0.1@3306@my_database
CREATE TABLE transactions (
    user_id INT,
    spend DECIMAL(10,2),
    transaction_date DATETIME
);

INSERT INTO transactions (user_id, spend, transaction_date)
VALUES
    (111, 100.50, '2022-01-08 12:00:00'),
    (111, 55.00, '2022-01-10 12:00:00'),
    (121, 36.00, '2022-01-18 12:00:00'),
    (145, 24.99, '2022-01-26 12:00:00'),
    (111, 89.60, '2022-02-05 12:00:00');

/*Assume you are given the table below on Uber transactions made by users.
 Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date */
SELECT user_id, spend, transaction_date
FROM (
    SELECT user_id, spend, transaction_date,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS row_num
    FROM transactions
) AS t
WHERE row_num = 3;
