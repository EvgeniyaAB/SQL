INSERT INTO style_music (name_style)
VALUES
('Метал'),
('Рок'),
('Рэп'),
('Поп'),
('Шансон')

INSERT INTO singer (name_singer)
VALUES
('Баста'),
('Григорий Лепс'),
('Скриптонит'),
('Simply red'),
('Кино'),
('Гуф'),
('Linkin park'),
('Atchitects'),
('Asking Alexandria'),
('Deep Purple')

INSERT INTO album (album_name, album_year)
VALUES
('Баста 4', '2013-04-20'),
('Подмена понятий', '2020-10-22'),
('2004', '2019-12-24'),
('Picture book', '1985-10-01'),
('Группа крови', '1988-01-05'),
('Город дорог', '2007-04-24'),
('Meteora', '2003-03-25'),
('For those that wish to exist', '2021-02-26'),
('Asking Alexandria', '2019-12-15'),
('Perfect stranger', '1984-11-02')

INSERT INTO style_musicsinger (style_music_id, singer_id, album_id)
VALUES
(1, 8, 8),
(1, 8, 9),
(1, 10, 10),
(2, 5, 5),
(2, 7, 7),
(2, 9, 9),
(3, 1, 1),
(3, 3, 3),
(3, 6, 6),
(4, 4, 4),
(5, 2, 2)

INSERT INTO track (album_id, track_name, track_long)
VALUES
(1, 'Это дороже денег', 295),
(1, 'Я или ты', 276),
(2, 'Подмена понятий', 327),
(2, 'Москва', 247),
(3, 'Привычка', 196),
(4, 'Come to my aid', 243),
(5, 'Группа крови', 287),
(5, 'Война', 244),
(6, 'Интро', 43),
(6, 'Новогодняя', 220),
(7, 'Faint', 162),
(7, 'Numb', 188),
(8, 'Animals', 244),
(8, 'Dead butterflies', 242),
(9, 'Fame', 198),
(9, 'Animals', 244),
(10, 'Under the gun', 275)


INSERT INTO collection (collection_name, collection_year)
VALUES
('Хиты 2010', '2010-04-01'),
('Рок хиты 1984-го', '2018-10-01'),
('Последний герой', '1989-12-10'),
('Главное рэп на русском', '2022-01-20'),
('Remixed Vol.1', '2021-11-05'),
('Газгольдер саундтрек', '2018-05-25'),
('One more light live', '2017-03-05'),
('What I have done', '2007-01-01')

INSERT INTO collectiontrack (track_id, collection_id)
VALUES
(1, 1),
(2, 6),
(5, 4),
(6, 5),
(7, 3),
(8, 5),
(11, 8),
(12, 7),
(16, 2)

