-- Выбрать книгу, для которой наибольшее число экземпляров находятся в библиотеке (не выданы читателям)
-------------------------------------------------------------------------------------------------------
WITH real_kol AS (
SELECT author, name_book, (number_of_copies-COALESCE(COUNT(b.book_id), 0)) AS kol
FROM 
    book_groups bg
--Считаем количество книг, которые находятся в руках у читателей
LEFT JOIN (
    SELECT b.group_id, b.book_id
    FROM book_distribution bd
    JOIN books b ON bd.book_id = b.book_id
    WHERE bd.refund_date IS NULL
) b ON bg.group_id = b.group_id
--Группируем их по номеру группы
GROUP BY bg.group_id
)
--Вычисляем значения имеющихся книг, как разность между максимумом и теми, что в наличии
-- При этом книги, которые не находятся сейчас в руках в kol получат null, поэтому меняем его на 0
---------------------------------------------------------------------------------------------------
--Находим книги, для которых текущее количество является максимальным
SELECT author, name_book, kol FROM real_kol
WHERE kol IN (SELECT MAX(kol) FROM real_kol)
