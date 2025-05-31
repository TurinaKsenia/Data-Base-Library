--СОЗДАНИЕ СОЕДИНЯЮЩЕЙ ТАБЛИЦЫ
CREATE TABLE IF NOT EXISTS public.books
(
    book_id integer NOT NULL,
    group_id integer NOT NULL,
    CONSTRAINT books_pkey PRIMARY KEY (book_id),

	CONSTRAINT fk_group 
        FOREIGN KEY (group_id) 
        REFERENCES book_groups(group_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
)
--------------------------------------------------------------------------------------------
--ЗАПОЛНЕНИЕ ДАННЫМИ
INSERT INTO public.books (book_id, group_id) VALUES
(100001, 1),
(100002, 1),
(200003, 2),
(300004, 3),
(300005, 3),
(300006, 3),
(400007, 4),
(400008, 4),
(400009, 4),
(400010, 4),
(400011, 4),
(500012, 5),
(500013, 5),
(600014, 6),
(600015, 6),
(700016, 7),
(700017, 7),
(700018, 7),
(700019, 7),
(800020, 8),
(800021, 8),
(800022, 8),
(900023, 9),
(100024, 10),
(110025, 11),
(120026, 12);
