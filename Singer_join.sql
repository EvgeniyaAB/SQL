--Количество исполнителей в каждом жанре.
SELECT sm2.name_style AS name_style, count(s.name_singer) AS count_singer 
FROM singer s 
LEFT JOIN style_musicsinger sm ON sm.singer_id = s.id 
LEFT JOIN style_music sm2 ON sm2.id = sm.style_music_id
GROUP BY name_style
ORDER BY count_singer DESC; 

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT a.album_name AS album_name, count(t.track_name) AS count_track
FROM track t 
LEFT JOIN album a ON t.album_id = a.id
WHERE a.album_year BETWEEN '2019-01-01' AND '2020-12-31'
GROUP BY album_name
ORDER BY count_track DESC;

--Средняя продолжительность треков по каждому альбому.
SELECT a.album_name AS album_name, avg(t.track_long) AS average_track_long
FROM track t 
LEFT JOIN album a ON t.album_id = a.id
GROUP BY album_name
ORDER BY average_track_long DESC;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT s.name_singer AS singer 
FROM singer s 
LEFT JOIN style_musicsinger sm ON sm.singer_id = s.id
LEFT JOIN album a ON a.id = sm.album_id
WHERE a.album_year NOT BETWEEN '2020-01-01' AND '2020-12-31';

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT c.collection_name AS collection
FROM collection c 
LEFT JOIN collectiontrack c2 ON c.id = c2.collection_id 
LEFT JOIN track t ON t.id = c2.track_id
LEFT JOIN album a ON a.id = t.album_id
LEFT JOIN style_musicsinger sm ON sm.album_id = a.id 
LEFT JOIN singer s ON s.id = sm.singer_id
WHERE s.name_singer = 'Баста';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.album_name AS album
FROM album a
LEFT JOIN style_musicsinger sm ON a.id = sm.album_id
LEFT JOIN singer s ON s.id = sm.singer_id 
LEFT JOIN style_music sm2 ON sm2.id = sm.style_music_id
GROUP BY album
HAVING count(DISTINCT sm2.name_style) > 1 
ORDER BY album_name;

--Наименования треков, которые не входят в сборники.
SELECT t.track_name AS track 
FROM track t 
LEFT JOIN collectiontrack c2 ON t.id = c2.track_id
WHERE c2.track_id IS NULL; 

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT s.name_singer AS singer, t.track_long AS track_long
FROM singer s
LEFT JOIN style_musicsinger sm ON s.id = sm.singer_id
LEFT JOIN album a ON a.id = sm.album_id 
LEFT JOIN track t ON t.album_id = a.id
GROUP BY singer, track_long
HAVING track_long = (SELECT min(track_long) FROM track)
ORDER BY singer;

--Названия альбомов, содержащих наименьшее количество треков.
SELECT a.album_name AS album
FROM album a 
LEFT JOIN track t ON t.album_id = a.id
GROUP BY album
HAVING count(t.track_name) = (SELECT count(track) AS count_track  
                              FROM track
                              GROUP BY album_id
                              ORDER BY count_track
                              LIMIT 1)
                             ;
