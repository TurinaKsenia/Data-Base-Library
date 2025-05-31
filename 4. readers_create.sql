CREATE TABLE IF NOT EXISTS public.readers
(
	reader_id INTEGER  CHECK (reader_id > 0) NOT NULL PRIMARY KEY,
	FIO TEXT NOT NULL,
	address TEXT,
	phone_number char(11) NOT NULL,
	info_disposal boolean NOT NULL	
)