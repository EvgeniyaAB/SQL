CREATE TABLE IF NOT EXISTS Style_music (
	id SERIAL PRIMARY KEY,
	name_style VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
	id SERIAL PRIMARY KEY,
	name_singer VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Style_musicSinger (
	id SERIAL PRIMARY KEY,
	style_music_id INTEGER REFERENCES Style_music(id),
	singer_id INTEGER REFERENCES Singer(id),
	album_id INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL,
	album_year date
);


CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Album(id),
	track_name VARCHAR(60) NOT NULL,
	track_long INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(60) NOT NULL,
	collection_year date NOT NULL
);

CREATE TABLE IF NOT EXISTS CollectionTrack (
	id SERIAL PRIMARY KEY,
	track_id INTEGER REFERENCES Track(id),
	collection_id INTEGER REFERENCES Collection(id)
);
