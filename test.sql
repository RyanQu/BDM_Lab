/* Q1 */
SELECT DISTINCT P.ticker, P.close, B.timestamp
FROM buynsell B, price P
WHERE B.ticker=P.ticker AND 
    B.date=P.date AND 
    B.timestamp>'2017-01-01 00:00:00';

/* Q2 */
SELECT DISTINCT P.ticker
FROM price P
WHERE P.close > (
    SELECT DISTINCT P_1.close 
    FROM price P_1 
    WHERE P_1.date='2017-03-20' 
    AND P_1.ticker='IBM')
AND P.close <= (
    SELECT DISTINCT P_2.close 
    FROM price P_2 
    WHERE P_2.date='2017-03-20' 
    AND P_2.ticker='GOOG');

/* Q3 */
SELECT DISTINCT P.ticker 
FROM price P LEFT JOIN 
    (SELECT DISTINCT P_1.ticker
        FROM price P_1, price P_2 
        WHERE P_1.date='2017-03-20' 
        AND P_2.date='2017-03-20' 
        AND P_1.close<P_2.close) AS S 
    USING (ticker) 
WHERE P.date='2017-03-20' AND S.ticker is NULL;

/* Q4 */
/*
    The empty result, 
    ADD record in PRICE: GE 2017-03-20 101.1
*/
SELECT DISTINCT S.ticker
FROM stock S, price P
WHERE S.exchange='NYSE'
AND (P.close>100 OR P.close<20)
AND P.date='2017-03-20'
AND P.ticker = S.ticker;

/* Q5 */
/* The empty result, ADD record in PRICE: GE 2017-03-21 200 */
SELECT DISTINCT N.ticker FROM
(SELECT DISTINCT M.ticker FROM
    (SELECT DISTINCT P.ticker, P.date, P.close 
    FROM stock S, price P
    WHERE S.ticker = P.ticker
    AND S.exchange = 'NYSE'
    AND (P.date = '2017-03-20' OR P.date = '2017-03-21')) AS M
    LEFT JOIN
    (SELECT DISTINCT P_1.ticker
        FROM price P_1 
        WHERE P_1.date>'2017-01-01'  
        AND P_1.close<100) AS T 
    USING (ticker) 
WHERE T.ticker is NULL) AS N
LEFT JOIN
(SELECT DISTINCT P_1.ticker
    FROM price P_1, price P_2, price P_3, price P_4, stock S
    WHERE P_1.date='2017-03-20' 
    AND P_2.date='2017-03-21' 
    AND P_3.date='2017-03-20' 
    AND P_4.date='2017-03-21'
    AND P_1.ticker=P_2.ticker
    AND P_3.ticker=P_4.ticker
    AND P_1.ticker=S.ticker
    AND P_3.ticker=S.ticker
    AND S.exchange='NYSE'
    AND P_4.close-P_3.close>P_2.close-P_1.close) AS K
USING (ticker)
WHERE K.ticker is NULL;

/* The Q6 */
/* ADD record in buynsell: 
'AAPL','SELL','2017-03-22','2017-03-22 19:42:00',102,5000
*/
SELECT DISTINCT N.date FROM 
(SELECT DISTINCT B.date, SUM(B.price*B.num_of_shares) AS SUM
FROM buynsell B
WHERE B.ticker='AAPL'
AND B.buy_or_sell='SELL'
GROUP by date) AS N
LEFT JOIN
(SELECT DISTINCT B.date, SUM(B.price*B.num_of_shares) AS SUM
FROM buynsell B, stock S
WHERE S.exchange='NASDAQ' 
AND B.ticker=S.ticker
AND B.buy_or_sell='BUY'
GROUP by date) AS M
USING (date)
WHERE M.date is NOT NULL
AND N.SUM > M.SUM


/* The Q6 Version 2*/
/* ADD record in buynsell: 
'AAPL','SELL','2017-03-22','19:42:00',102,5000
*/
SELECT DISTINCT N.date FROM 
(SELECT DISTINCT B.date, SUM(B.value*B.num_of_shares) AS SUM
FROM buynsell B
WHERE B.ticker='AAPL'
AND B.buy_or_sell='SELL'
GROUP by date) AS N,
(SELECT DISTINCT B.date, SUM(B.value*B.num_of_shares) AS SUM
FROM buynsell B, stock S
WHERE S.exchange='NASDAQ' 
AND B.ticker=S.ticker
AND B.buy_or_sell='BUY'
GROUP by date) AS M
WHERE M.date=N.date
AND N.SUM > M.SUM


