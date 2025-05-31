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