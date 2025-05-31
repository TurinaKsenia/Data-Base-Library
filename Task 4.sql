SELECT fio, sum_price FROM readers r
INNER JOIN
(SELECT reader_id, SUM(price) as sum_price
FROM book_distribution bd
INNER JOIN books b
ON bd.book_id=b.book_id
INNER JOIN book_groups bg
ON b.group_id=bg.group_id
WHERE refund_date IS NULL
GROUP BY reader_id) as pupu
ON r.reader_id=pupu.reader_id
WHERE sum_price>100