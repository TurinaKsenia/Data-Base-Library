WITH real_kol AS (
SELECT author, name_book, (number_of_copies-COALESCE(COUNT(b.book_id), 0)) AS kol
FROM 
    book_groups bg
LEFT JOIN (
    SELECT b.group_id, b.book_id
    FROM book_distribution bd
    JOIN books b ON bd.book_id = b.book_id
    WHERE bd.refund_date IS NULL
) b ON bg.group_id = b.group_id
GROUP BY bg.group_id
)

SELECT author, name_book, kol FROM real_kol
WHERE kol IN (SELECT MAX(kol) FROM real_kol)