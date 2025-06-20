--СОЗДАНИЕ ТАБЛИЦЫ book_distribution
CREATE TABLE IF NOT EXISTS public.book_distribution
(
    reader_id integer NOT NULL,
    book_id integer NOT NULL,
    distribution_date date CHECK (distribution_date<= CURRENT_DATE AND NOT NULL),
    refund_date DATE CHECK (refund_date <= CURRENT_DATE),
    CONSTRAINT book_distribution_pkey PRIMARY KEY (reader_id, book_id, distribution_date),

	CONSTRAINT fk_book 
        FOREIGN KEY (book_id) 
        REFERENCES books(book_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
		
	CONSTRAINT fk_reader
        FOREIGN KEY (reader_id) 
        REFERENCES readers(reader_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
)
--------------------------------------------------------------------------------------------
--ЗАПОЛНЕНИЕ ДАННЫМИ
INSERT INTO public.book_distribution (reader_id, book_id, distribution_date, refund_date) VALUES
--для наибольшего количества экземпляров
(1001, 400007, '2025-05-20', NULL),  
(1002, 300005, '2000-05-10', '2000-05-10'), 
(1003, 200003, '2019-01-15', '2019-10-15'), 
--для самой популярной книги весной 2000 года
(1002, 700016, '2000-03-1', NULL),   
(1003, 700017, '2000-03-1', '2000-03-09'), 
(1004, 700018, '2000-03-1', '2000-03-09'), 
(1005, 700019, '2000-03-12', '2000-03-27'),   
(1006, 700016, '2000-03-12', '2000-03-27'), 
(1007, 700017, '2000-03-12', '2000-03-27'), 
(1008, 700018, '2000-04-2', '2000-04-10'),   
(1009, 700019, '2000-04-2', '2000-04-10'), 
(1010, 600015, '2000-04-2', '2000-04-10'), 
(1011, 500012, '2000-04-13', '2000-05-01'),   
(1012, 800022, '2000-04-13', '2000-05-01'), 
(1013, 900023, '2000-04-13', '2000-05-01'), 
(1014, 120026, '2000-05-12', '2000-05-20'),   
(1015, 110025, '2000-05-12', '2000-05-20'), 
--Для задолженностей
(1001, 100001, '2023-01-15', NULL),
(1005, 100002, '2002-06-15', '2002-11-12'),
(1002, 500013, '2023-01-15', NULL),
(1010, 300004, '2003-01-15','2002-11-12' ),
(1015, 100024, '2025-01-20', NULL),
--Сумма >100 рублей
(1014, 200003, '2025-04-10', NULL),
(1014, 300005, '2025-05-11', NULL),
(1014, 400010, '2025-05-30', NULL),
(1012, 800020, '2025-04-10', NULL),
(1012, 500012, '2025-05-11', NULL),
(1012, 120026, '2025-05-30', NULL)
