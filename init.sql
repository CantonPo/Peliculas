PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS whitelist;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS movies;

CREATE TABLE IF NOT EXISTS movies (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'title' TEXT NOT NULL UNIQUE,
    'genre' TEXT NOT NULL,
    'age' INTEGER NOT NULL,
    'director' TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'user_name' TEXT NOT NULL,
    'fav_movie' INTEGER,
    FOREIGN KEY ('fav_movie') REFERENCES movies('id')
);

CREATE TABLE IF NOT EXISTS whitelist(
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'user' INTEGER,
    'movie' INTEGER,
    FOREIGN KEY ('user') REFERENCES users('id'),
    FOREIGN KEY ('movie') REFERENCES movies('id')
);

INSERT INTO movies(title, genre, age, director) VALUES 
('Rocky', 'Drama', 1976, 'Sylvester Stallone'),
('Star Wars Episodio 3: La venganza de los Sith ', 'Ciencia Ficción', 2005, 'Lucas Film'),
('Shrek', 'Comedia', 2001, 'Andrew Adamson'),
('Hercules', 'Infantil', 1997, 'Ron Clements'),
('El padrino', 'Crimen', 1972, 'Francis Ford Coppola'),
('Spider Man', 'Acción', 2002, 'Sam Reimi'),
('Batman Begins', 'Acción', 2005, 'Christopher Nolan'),
('The Goonies', 'Aventura', 1985, 'Richard Donner'),
('El señor de los anillos: El retorno del rey', 'Fantasía', 2003, 'Peter Jackson'),
('Ted', 'Comedia', 2012, 'Seth Macfariane'),
('Expediente Warren', 'Terror', 2013, 'Ari Aster'),
('Kick Boxer', 'Acción', 1989, 'Mark Disalle');

INSERT INTO users(user_name, fav_movie) VALUES 
('Canton', 10),
('Makram', 1),
('Juan', 3),
('Alex', 2),
('Rafa', 7);

INSERT INTO whitelist(user, movie) VALUES
(1,1),
(2,6);



UPDATE users
SET user_name='Juan', fav_movie=4
WHERE id = 1;  


DELETE FROM users WHERE id = 1;


SELECT users.user_name, movies.title AS pelicula_pendiente
FROM users
JOIN whitelist ON users.id = whitelist.user
JOIN movies ON whitelist.movie = movies.id;