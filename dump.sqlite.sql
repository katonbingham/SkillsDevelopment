-- TABLE
CREATE TABLE notes (id Integer PRIMARY KEY AUTOINCREMENT, Title varchar(20));
CREATE TABLE note (id Integer PRIMARY KEY, Title varchar(20), Body text );
CREATE TABLE sqlite_sequence(name,seq);
 
-- INDEX
CREATE INDEX n_index on notes (name);
 
-- TRIGGER
 
-- VIEW
 
