--Выбрать читателей, которые имеют задолженность более 4-х месяцев
--Рассматриваем 2 вида: те, у которых когда-то была задолженность и те, у которых сейчас есть долг
-- INTERVAL - тип данных, который позволяет точно сравнивать даты в зависимости от года, месяца
SELECT fio, CURRENT_DATE::timestamp-distribution_date::timestamp as real_arrears, null as hystory_arrears FROM readers r
INNER JOIN (
SELECT reader_id, distribution_date, refund_date
FROM book_distribution bd
WHERE (refund_date IS NULL and distribution_date::timestamp < CURRENT_DATE - INTERVAL'4 months')) as pupu
ON r.reader_id=pupu.reader_id
UNION
SELECT fio,null as real_arrears, refund_date::timestamp-distribution_date::timestamp as hystory_arrears FROM readers r
INNER JOIN (
SELECT reader_id, distribution_date, refund_date
FROM book_distribution bd
WHERE (refund_date IS NOT NULL and refund_date::timestamp-distribution_date::timestamp > INTERVAL'4 months')) as ququ
ON r.reader_id=ququ.reader_id
