-- Название и год выхода альбомов, вышедших в 2018 году.
SELECT album_name, album_year  
FROM album
WHERE album_year BETWEEN '2018-01-01' AND '2018-12-31';

--Название и продолжительность самого длительного трека.
SELECT track_name, track_long 
FROM track
WHERE track_long = (
			SELECT max (track_long)
			FROM track
			);

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name
FROM track
WHERE track_long >= 3.5 * 60;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name
FROM collection
WHERE collection_year BETWEEN '2018-01-01' AND '2020-12-31';

--Исполнители, чьё имя состоит из одного слова.
SELECT name_singer
FROM singer
WHERE name_singer NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».
SELECT track_name
FROM track
WHERE track_name LIKE '%my%' OR track_name LIKE '%мой%';




