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