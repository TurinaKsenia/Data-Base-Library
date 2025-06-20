--Определить книгу, которая была наиболее популярной весной 2000 года
-----------------------------------------------------------------------
--Выбираем все книги, которые брали весной 2000 года и для каждой группы считаем количсетво взятых раз
with popular AS
(
SELECT group_id, count(group_id) as kol
FROM book_distribution bd
LEFT JOIN books b
ON bd.book_id=b.book_id
WHERE distribution_date BETWEEN '2000-03-01' AND '2000-05-31'
GROUP BY group_id
)
--Находим те строки, в которых количество находится в списке максимальных
SELECT bg.author, bg.name_book, p.kol 
FROM book_groups bg
INNER JOIN popular p
ON bg.group_id=p.group_id
WHERE kol IN (SELECT MAX(kol) FROM popular)
