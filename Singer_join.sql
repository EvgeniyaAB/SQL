--Количество исполнителей в каждом жанре.
SELECT sm.name_style AS name_style, count(s.name_singer) AS count_singer 
FROM singer s 
LEFT JOIN style_singer ss ON ss.singer_id = s.id 
LEFT JOIN style_music sm ON sm.id = ss.style_music_id
GROUP BY name_style
ORDER BY count_singer DESC; 

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(t.track_name) AS count_track
FROM track t 
LEFT JOIN album a ON t.album_id = a.id
WHERE a.album_year BETWEEN '2019-01-01' AND '2020-12-31';

--Средняя продолжительность треков по каждому альбому.
SELECT a.album_name AS album_name, avg(t.track_long) AS average_track_long
FROM track t 
LEFT JOIN album a ON t.album_id = a.id
GROUP BY album_name
ORDER BY average_track_long DESC;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT name_singer AS singer 
FROM singer s 
WHERE name_singer NOT IN (SELECT s.name_singer  
					FROM singer s
					LEFT JOIN singer_album sa ON sa.singer_id = s.id
					LEFT JOIN album a ON a.id = sa.album_id
					WHERE a.album_year BETWEEN '2020-01-01' AND '2020-12-31'
				);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT c.collection_name AS collection
FROM collection c 
LEFT JOIN collectiontrack c2 ON c.id = c2.collection_id 
LEFT JOIN track t ON t.id = c2.track_id
LEFT JOIN album a ON a.id = t.album_id
LEFT JOIN singer_album sa ON sa.album_id = a.id 
LEFT JOIN singer s ON s.id = sa.singer_id
WHERE s.name_singer = 'Баста';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT a.album_name AS album 
FROM album a
LEFT JOIN singer_album sa ON a.id = sa.album_id
LEFT JOIN singer s ON s.id = sa.singer_id
LEFT JOIN style_singer ss ON ss.singer_id = s.id
LEFT JOIN style_music sm ON sm.id = ss.style_music_id
GROUP BY album, s.name_singer
HAVING count(sm.name_style) > 1;

--Наименования треков, которые не входят в сборники.
SELECT t.track_name AS track 
FROM track t 
LEFT JOIN collectiontrack c ON t.id = c.track_id
WHERE c.track_id IS NULL; 

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT s.name_singer AS singer
FROM singer s
LEFT JOIN singer_album sa ON s.id = sa.singer_id
LEFT JOIN album a ON a.id = sa.album_id 
LEFT JOIN track t ON t.album_id = a.id
WHERE t.track_long = (SELECT min(track_long) FROM track)
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
