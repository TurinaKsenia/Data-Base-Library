CREATE TABLE IF NOT EXISTS public.book_groups
(
	group_id SERIAL PRIMARY KEY,
	author TEXT NOT NULL,
    name_book TEXT NOT NULL,
	release_year INTEGER CHECK (release_year > 0 AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE)),
    annotation TEXT,
  	number_of_copies INTEGER CHECK (number_of_copies >= 0),
  	price NUMERIC(6,2) CHECK (price>0)
)