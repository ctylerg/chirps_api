

CREATE DATABASE chirp_chirp;
\c chirp_chirp

CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR (255));

CREATE TABLE chirps (id SERIAL PRIMARY KEY, users_id INTEGER, name VARCHAR(255), what VARCHAR(255));
