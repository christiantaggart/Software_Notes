
--normalize data by MANY-TO-MANY JOIN
DROP DATABASE IF EXISTS movies;
CREATE DATABASE movies;
\c movies;
CREATE TABLE actors(
  id SERIAL PRIMARY KEY,
  name text,
  age integer
);

CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  title text,
  duration integer,
  rating varchar(10)
);

CREATE TABLE actors_movies(
  id SERIAL PRIMARY KEY,
  --foreign key referencing actors id
  actor_id integer references actors(id) ON DELETE CASCADE,
  movie_id integer references movies(id) ON DELETE CASCADE
);

CREATE TABLE awards(
  id SERIAL PRIMARY KEY,
  award_type text,
  name text,
  year integer,
  movie_id integer NOT NULL references movies(id) ON DELETE CASCADE
);

CREATE TABLE plots(
  id SERIAL PRIMARY KEY,
  description text,
  movie_id integer NOT NULL references movies(id) ON DELETE CASCADE
);

INSERT INTO actors(name,age) VALUES ('LIZA MA', 300);
INSERT INTO actors(name,age) VALUES ('ERICA', 2);
INSERT INTO actors(name,age) VALUES ('Christian', 30000);
INSERT INTO actors(name,age) VALUES ('KATE Hudson', 44);

INSERT INTO movies(title, duration, rating) VALUES ('Tokyo Drift', 111, 'PG-13');
INSERT INTO movies(title, duration, rating) VALUES ('Almost Famous', 120, 'R');
INSERT INTO movies(title, duration, rating) VALUES ('cloudy with a chance of meatballs', 999, 'R');

INSERT INTO plots(description, movie_id) VALUES ('Sideways car', 1);
INSERT INTO plots(description, movie_id) VALUES ('too young interview yung love', 2);
INSERT INTO plots(description, movie_id) VALUES ('Musical singing, goofy', 3);

INSERT INTO awards(award_type, name, year, movie_id) VALUES ('Best name', 'best award', 1991, 1);

INSERT INTO actors_movies(actor_id, movie_id) VALUES (1, 1);
INSERT INTO actors_movies(actor_id, movie_id) VALUES (2, 1);
INSERT INTO actors_movies(actor_id, movie_id) VALUES (3, 2);
INSERT INTO actors_movies(actor_id, movie_id) VALUES (3, 3);
INSERT INTO actors_movies(actor_id, movie_id) VALUES (4, 2);
