-- Select everything and run the script
DROP TABLE IF EXISTS artist_details, song_lyrics, playlists_songs, songs_genres, song, playlist, genre, artist, album;

-- Artist table
CREATE TABLE artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Artist Details table (One-to-One relationship with artist)
CREATE TABLE artist_details (
    id SERIAL PRIMARY KEY,
    date_of_birth DATE NOT NULL,
    full_name VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    is_married BOOLEAN DEFAULT false NOT NULL,
    spouse_name VARCHAR(100),
    artist_id INT UNIQUE REFERENCES artist(id)
);

-- Album table
CREATE TABLE album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    rating DECIMAL CHECK(rating >= 0 AND rating <= 5)
);

-- Song table
CREATE TABLE song (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INTERVAL NOT NULL,
    explicit BOOLEAN DEFAULT false NOT NULL,
    artist_id INT REFERENCES artist(id),
    album_id INT REFERENCES album(id)
);

-- Song Lyrics table (One-to-One relationship with songs)
CREATE TABLE song_lyrics (
    id SERIAL PRIMARY KEY,
    lyrics TEXT NOT NULL,
    song_id INT UNIQUE REFERENCES song(id)
);

-- Playlist table
CREATE TABLE playlist (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100)
);

-- Playlist_Songs table (Many-to-Many relationship between playlists and songs)
CREATE TABLE playlists_songs (
    playlist_id INT REFERENCES playlist(id),
    song_id INT REFERENCES song(id),
    PRIMARY KEY (playlist_id, song_id)
);

-- Genre table
CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Songs_Genres table (Many-to-Many relationship between songs and genres)
CREATE TABLE songs_genres (
    song_id INT REFERENCES song(id),
    genre_id INT REFERENCES genre(id),
    PRIMARY KEY (song_id, genre_id)
);

INSERT INTO artist (id, name) VALUES 
(1, 'Eminem'),
(2, 'Dua Lipa'),
(3, 'Tose Proeski'),
(4, 'Rihanna'),
(5, 'Taylor Swift'),
(6, 'David Guetta'),
(7, 'Shakira'),
(8, 'Drake'),
(9, 'Severina'),
(10, 'Zdravko Colic'),
(11, 'Adele'),
(12, 'The Weeknd'),
(13, 'Goran Bregovic'),
(14, 'Ceca'),
(15, 'Jelena Karleusa'),
(16, 'Saban Saulic'),
(17, 'Beyonce'),
(18, 'Coldplay'),
(19, 'Ed Sheeran'),
(20, 'Sia'),
(21, 'Bruce Springsteen'),
(22, 'Ariana Grande'),
(23, 'Miles Davis'),
(24, 'Sezen Aksu'),
(25, 'Saban Bajramovic'),
(26, 'Iron Maiden'),
(27, 'Lepa Brena'),
(28, 'Kygo'),
(29, 'Moby'),
(30, 'Arctic Monkeys'),
(31, 'Hozier'),
(32, 'Nina Simone'),
(33, 'Halid Beslic'),
(34, 'Dino Merlin'),
(35, 'Amira Medunjanin'),
(36, 'Kendrick Lamar'),
(37, 'Billie Eilish'),
(38, 'Daft Punk'),
(39, 'Lewis Capaldi'),
(40, 'Post Malone'),
(41, 'Edyta Bartosiewicz'),
(42, 'Mela Koteluk'),
(43, 'Monika Brodka'),
(44, 'Maria Peszek'),
(45, 'Doda');

INSERT INTO artist_details (id, date_of_birth, full_name, country, city, is_married, spouse_name, artist_id) VALUES 
(1, '1972-10-17', 'Marshall Bruce Mathers III', 'USA', 'St Joseph', false, NULL, 1),
(2, '1995-08-22', 'Dua Lipa', 'England', 'London', false, NULL, 2),
(3, '1981-01-25', 'Todor Tose Proeski', 'Macedonia', 'Prilep', false, NULL, 3),
(4, '1988-02-20', 'Robyn Rihanna Fenty', 'Barbados', 'Saint Michael', true, 'ASAP Rocky', 4),
(5, '1989-12-13', 'Taylor Alison Swift', 'USA', 'Reading', false, NULL, 5),
(6, '1967-11-07', 'Pierre David Guetta', 'France', 'Paris', true, 'Jessica Ledon', 6),
(7, '1977-02-02', 'Shakira Isabel Mebarak Ripoll', 'Colombia', 'Barranquilla', true, 'Gerard Pique', 7),
(8, '1986-10-24', 'Aubrey Drake Graham', 'Canada', 'Toronto', false, NULL, 8),
(9, '1972-04-21', 'Severina Vuckovic', 'Croatia', 'Split', true, 'Igor Kojic', 9),
(10, '1951-05-30', 'Zdravko Colic', 'Bosnia and Herzegovina', 'Sarajevo', false, NULL, 10),
(11, '1988-05-05', 'Adele Laurie Blue Adkins', 'England', 'London', false, NULL, 11),
(12, '1990-02-16', 'Abel Makkonen Tesfaye', 'Canada', 'Toronto', false, NULL, 12),
(13, '1950-03-22', 'Goran Bregovic', 'Bosnia and Herzegovina', 'Sarajevo', true, 'Dzenana Sudzuka', 13),
(14, '1973-06-14', 'Svetlana Raznatovic', 'Serbia', 'Belgrade', false, NULL, 14),
(15, '1978-08-17', 'Jelena Karleusa Tosic', 'Serbia', 'Belgrade', true, 'Dusko Tosic', 15),
(16, '1951-09-06', 'Saban Saulic', 'Serbia', 'Sabac', true, 'Gordana Saulic', 16),
(17, '1981-09-04', 'Beyonce Giselle Knowles-Carter', 'USA', 'Houston', true, 'Jay-Z', 17),
(18, '1977-03-02', 'Christopher Anthony John Martin', 'England', 'Exeter', false, NULL, 18),
(19, '1991-02-17', 'Edward Christopher Sheeran', 'England', 'Halifax', true, 'Cherry Seaborn', 19),
(20, '1975-12-18', 'Sia Kate Isobelle Furler', 'Australia', 'Adelaide', false, NULL, 20),
(21, '1949-09-23', 'Bruce Frederick Joseph Springsteen', 'USA', 'Long Branch', true, 'Patti Scialfa', 21),
(22, '1993-06-26', 'Ariana Grande Butera', 'USA', 'Boca Raton', false, NULL, 22),
(23, '1926-05-26', 'Miles Dewey Davis III', 'USA', 'Alton', true, 'Cicely Tyson', 23),
(24, '1954-07-13', 'Fatma Sezen Yildirim', 'Turkey', 'Denizli', false, NULL, 24),
(25, '1936-04-16', 'Saban Bajramovic', 'Serbia', 'Nis', true, 'Stamenka Bajramovic', 25),
(26, '1957-12-25', 'Stephen Percy Harris', 'England', 'Leytonstone', true, 'Lorraine Harris', 26),
(27, '1960-10-20', 'Fahreta Zivojinovic', 'Bosnia and Herzegovina', 'Tuzla', true, 'Bobo Zivojinovic', 27),
(28, '1991-09-11', 'Kyrre Gorvell Dahll', 'Norway', 'Singapore', false, NULL, 28),
(29, '1965-09-11', 'Richard Melville Hall', 'USA', 'Harlem', false, NULL, 29),
(30, '2002-01-06', 'Alex Turner', 'England', 'Sheffield', false, NULL, 30),
(31, '1990-03-17', 'Andrew John Hozier Byrne', 'Ireland', 'Bray', false, NULL, 31),
(32, '1933-02-21', 'Eunice Kathleen Waymon', 'USA', 'Tryon', false, NULL, 32),
(33, '1953-11-20', 'Halid Beslic', 'Bosnia and Herzegovina', 'Knezina', true, 'Sejda Beslic', 33),
(34, '1962-09-12', 'Edin Dervishalidovic', 'Bosnia and Herzegovina', 'Sarajevo', true, 'Amela Dervishalidovic', 34),
(35, '1972-03-23', 'Amira Medunjanin', 'Bosnia and Herzegovina', 'Sarajevo', false, NULL, 35),
(36, '1987-06-17', 'Kendrick Lamar Duckworth', 'USA', 'Compton', true, 'Whitney Alford', 36),
(37, '2001-12-18', 'Billie Eilish Pirate Baird OConnell', 'USA', 'Los Angeles', false, NULL, 37),
(38, '1974-01-03', 'Thomas Bangalter', 'France', 'Paris', true, 'Elodie Bouchez', 38),
(39, '1996-10-07', 'Lewis Capaldi', 'Scotland', 'Bathgate', false, NULL, 39),
(40, '1995-07-04', 'Austin Richard Post', 'USA', 'Syracuse', false, NULL, 40),
(41, '1980-01-13', 'Artur Rojek', 'Poland', 'Warsaw', false, NULL, null),
(42, '1990-02-01', 'Peter Fox', 'Germany', 'Berlin', false, NULL, null);


-- Removing artist_id references from album
INSERT INTO album (id, name, rating) VALUES 
(1, 'The Eminem Show', 4.5),
(2, 'Future Nostalgia', 4.7),
(3, 'The Hardest Way', 4.8),
(4, 'Good Girl Gone Bad', 4.6),
(5, 'Folklore', 4.9),
(6, 'Nothing but the Beat', 4.3),
(7, 'Oral Fixation', 4.2),
(8, 'Scorpion', 4.8),
(9, 'Halo', 3.9),
(10, 'Ti si mi u krvi', 4.7),
(11, '25', 4.8),
(12, 'After Hours', 4.9),
(13, 'Silent Wedding', 4.1),
(14, 'Autogram', 4.0),
(15, 'Diva', 3.7),
(16, 'Dva galeba bela', 4.5),
(17, 'Lemonade', 4.9),
(18, 'A Head Full of Dreams', 4.4),
(19, 'Divide', 4.8),
(20, 'This Is Acting', 4.5),
(21, 'Born in the U.S.A.', 4.8),
(22, 'Thank U, Next', 4.7),
(23, 'Kind of Blue', 4.9),
(24, 'Gulumse', 4.5),
(25, 'A Gypsy Legend', 4.6),
(26, 'Fear of the Dark', 4.7),
(27, 'Mile voli disko', 4.3),
(28, 'Cloud Nine', 4.4),
(29, 'Play', 4.5),
(30, 'AM', 4.6),
(31, 'Hozier', 4.7),
(32, 'I Put a Spell on You', 4.8),
(33, 'Romanija', 4.1),
(34, 'Sredinom', 4.5),
(35, 'Amulette', 4.2),
(36, 'DAMN.', 4.9),
(37, 'When We All Fall Asleep, Where Do We Go?', 4.8),
(38, 'Discovery', 4.7),
(39, 'Divinely Uninspired to a Hellish Extent', 4.3),
(40, 'Hollywoods Bleeding', 4.5),
(43, 'Fados do Fado', 4.2),
(44, 'O Melhor de Amalia Rodrigues', 4.7),
(45, 'Fado em Mim', 4.5),
(46, 'Desfado', 4.3),
(47, 'Canta Fado', 4.0),
(48, 'Senhora da Noite', 4.6),
(49, 'Fado Tradicional', 4.4),
(50, 'Pelo Dia Dentro', 4.1),
(51, 'Rumo ao Sul', 4.3),
(52, 'Mulher do Norte', 4.2);


-- Updating the songs table to include album_id
INSERT INTO song (id, name, duration, explicit, artist_id, album_id) VALUES 
(1, 'Lose Yourself', '5 minutes 26 seconds', true, 1, 1),
(2, 'New Rules', '3 minutes 31 seconds', false, 2, 2),
(3, 'Jedina', '4 minutes 4 seconds', false, 3, 3),
(4, 'Umbrella', '4 minutes 35 seconds', false, 4, 4),
(5, 'Love Story', '3 minutes 55 seconds', false, 5, 5),
(6, 'Titanium', '4 minutes 5 seconds', false, 6, 6),
(7, 'Hips Dont Lie', '3 minutes 38 seconds', false, 7, 7),
(8, 'Gods Plan', '3 minutes 19 seconds', true, 8, 8),
(9, 'Italiana', '4 minutes 13 seconds', false, 9, 9),
(10, 'Ti si mi u krvi', '5 minutes 46 seconds', false, 10, 10),
(11, 'Hello', '4 minutes 55 seconds', false, 11, 11),
(12, 'Blinding Lights', '3 minutes 22 seconds', false, 12, 12),
(13, 'Kalashnikov', '4 minutes 22 seconds', false, 13, 13),
(14, 'Trepni', '4 minutes 6 seconds', false, 14, 14),
(15, 'Insomnia', '4 minutes 28 seconds', true, 15, 15),
(16, 'Dva Galeba Bela', '4 minutes 15 seconds', false, 16, 16),
(17, 'Halo', '3 minutes 45 seconds', false, 17, 17),
(18, 'Paradise', '4 minutes 38 seconds', false, 18, 18),
(19, 'Shape of You', '3 minutes 54 seconds', false, 19, 19),
(20, 'Chandelier', '3 minutes 36 seconds', false, 20, 20),
(21, 'Born to Run', '4 minutes 31 seconds', false, 21, 21),
(22, '7 Rings', '2 minutes 58 seconds', true, 22, 22),
(23, 'So What', '9 minutes 22 seconds', false, 23, 23),
(24, 'Tukenecegiz', '5 minutes 2 seconds', false, 24, 24),
(25, 'Djelem Djelem', '3 minutes 45 seconds', false, 25, 25),
(26, 'Fear of the Dark', '7 minutes 18 seconds', false, 26, 26),
(27, 'Jugoslovenka', '4 minutes 47 seconds', false, 27, 27),
(28, 'Firestone', '4 minutes 33 seconds', false, 28, 28),
(29, 'Porcelain', '4 minutes 1 second', false, 29, 29),
(30, 'Do I Wanna Know', '4 minutes 32 seconds', false, 30, 30),
(31, 'Take Me to Church', '4 minutes 1 second', false, 31, 31),
(32, 'Feeling Good', '2 minutes 53 seconds', false, 32, 32),
(33, 'Miljacka', '3 minutes 50 seconds', false, 33, 33),
(34, 'Sve je laz', '4 minutes 11 seconds', false, 34, 34),
(35, 'Moj Dilbere', '3 minutes 15 seconds', false, 35, 35),
(36, 'HUMBLE.', '2 minutes 57 seconds', true, 36, 36),
(37, 'Bad Guy', '3 minutes 14 seconds', true, 37, 37),
(38, 'One More Time', '5 minutes 20 seconds', false, 38, 38),
(39, 'Someone You Loved', '3 minutes 2 seconds', false, 39, 39),
(40, 'Circles', '3 minutes 35 seconds', false, 40, 40),
(41, 'Without Me', '4 minutes 50 seconds', true, 1, 1),
(42, 'Stan', '6 minutes 44 seconds', true, 1, 1),
(43, 'Beautiful', '4 minutes 05 seconds', true, 1, 1),
(44, 'Break My Heart', '3 minutes 42 seconds', false, 2, 2),
(45, 'Physical', '3 minutes 13 seconds', false, 2, 2),
(46, 'Hallucinate', '3 minutes 29 seconds', false, 2, 2),
(47, 'Karolina', '4 minutes 15 seconds', false, 3, 3),
(48, 'Pratim te', '4 minutes 22 seconds', false, 3, 3),
(49, 'Soba za tugu', '4 minutes 08 seconds', false, 3, 3),
(50, 'We Found Love', '3 minutes 35 seconds', false, 4, 4),
(51, 'Diamonds', '3 minutes 45 seconds', false, 4, 4),
(52, 'Rude Boy', '3 minutes 42 seconds', false, 4, 4),
(53, 'You Belong With Me', '3 minutes 52 seconds', false, 5, 5),
(54, 'Cardigan', '4 minutes 00 seconds', false, 5, 5),
(55, 'Wildest Dreams', '3 minutes 40 seconds', false, 5, 5),
(56, 'She Wolf', '3 minutes 12 seconds', false, 6, 6),
(57, 'Memories', '3 minutes 30 seconds', false, 6, 6),
(58, 'Flames', '3 minutes 15 seconds', false, 6, 6),
(59, 'Whenever, Wherever', '3 minutes 16 seconds', false, 7, 7),
(60, 'Waka Waka', '3 minutes 22 seconds', false, 7, 7),
(61, 'La Tortura', '3 minutes 33 seconds', false, 7, 7),
(62, 'One Dance', '2 minutes 54 seconds', true, 8, 8),
(63, 'Hotline Bling', '4 minutes 27 seconds', true, 8, 8),
(64, 'In My Feelings', '3 minutes 38 seconds', true, 8, 8),
(65, 'Brad Pitt', '3 minutes 20 seconds', false, 9, 9),
(66, 'Tarapana', '3 minutes 36 seconds', false, 9, 9),
(67, 'Gas Gas', '3 minutes 28 seconds', false, 9, 9),
(68, 'Kao Moja Mati', '4 minutes 46 seconds', false, 10, 10),
(69, 'Stanica Podlugovi', '4 minutes 30 seconds', false, 10, 10),
(70, 'Dajte Da Pijemo', '4 minutes 48 seconds', false, 10, 10),
(71, 'Set Fire to the Rain', '4 minutes 02 seconds', false, 11, 11),
(72, 'Rolling in the Deep', '3 minutes 48 seconds', false, 11, 11),
(73, 'Water Under the Bridge', '4 minutes 00 seconds', false, 11, 11),
(74, 'Save Your Tears', '3 minutes 36 seconds', false, 12, 12),
(75, 'The Hills', '4 minutes 03 seconds', false, 12, 12),
(76, 'Can''t Feel My Face', '3 minutes 34 seconds', false, 12, 12),
(77, 'In the Deathcar', '4 minutes 18 seconds', false, 13, 13),
(78, 'Ederlezi', '4 minutes 45 seconds', false, 13, 13),
(79, 'Maki Maki', '3 minutes 55 seconds', false, 13, 13),
(80, 'Zuta Minuta', '3 minutes 25 seconds', false, 14, 14),
(81, 'Nagovori', '4 minutes 05 seconds', false, 14, 14),
(82, 'Maskarada', '3 minutes 59 seconds', false, 14, 14),
(83, 'Jednom Kad Nam Dodju Svi', '3 minutes 58 seconds', false, 15, 15),
(84, 'Magla', '4 minutes 16 seconds', false, 15, 15),
(85, 'Nije Mi Nista', '3 minutes 56 seconds', false, 15, 15),
(86, 'Samo Me Nebo Rastavit Moze', '4 minutes 24 seconds', false, 16, 16),
(87, 'Iza Njih', '4 minutes 06 seconds', false, 16, 16),
(88, 'Sve Sto Znam', '4 minutes 28 seconds', false, 16, 16),
(89, 'Formation', '3 minutes 26 seconds', false, 17, 17),
(90, 'Single Ladies', '3 minutes 13 seconds', false, 17, 17),
(91, 'Crazy in Love', '3 minutes 56 seconds', false, 17, 17),
(92, 'Fix You', '4 minutes 55 seconds', false, 18, 18),
(93, 'The Scientist', '5 minutes 10 seconds', false, 18, 18),
(94, 'Yellow', '4 minutes 28 seconds', false, 18, 18),
(95, 'Perfect', '4 minutes 23 seconds', false, 19, 19),
(96, 'Castle on the Hill', '4 minutes 21 seconds', false, 19, 19),
(97, 'Galway Girl', '2 minutes 50 seconds', false, 19, 19),
(98, 'Cheap Thrills', '3 minutes 44 seconds', false, 20, 20),
(99, 'Elastic Heart', '4 minutes 17 seconds', false, 20, 20),
(100, 'Unstoppable', '3 minutes 38 seconds', false, 20, 20),
(101, 'Dancing in the Dark', '4 minutes 02 seconds', false, 21, 21),
(102, 'Glory Days', '4 minutes 15 seconds', false, 21, 21),
(103, 'Born in the U.S.A.', '4 minutes 39 seconds', false, 21, 21),
(104, 'No Tears Left to Cry', '3 minutes 25 seconds', true, 22, 22),
(105, 'Breathin', '3 minutes 18 seconds', true, 22, 22),
(106, 'Positions', '2 minutes 52 seconds', true, 22, 22),
(107, 'So What', '9 minutes 22 seconds', false, 23, 23),
(108, 'Blue in Green', '5 minutes 37 seconds', false, 23, 23),
(109, 'Freddie Freeloader', '9 minutes 49 seconds', false, 23, 23),
(110, 'Vazgecemem', '4 minutes 35 seconds', false, 24, 24),
(111, 'Gulumse', '4 minutes 14 seconds', false, 24, 24),
(112, 'Keske', '3 minutes 55 seconds', false, 24, 24),
(113, 'I Can See You', '4 minutes 12 seconds', false, 25, 25),
(114, 'Hey Boy Hey Girl', '5 minutes 20 seconds', false, 25, 25),
(115, 'El Camino', '3 minutes 48 seconds', false, 25, 25),
(116, 'The Trooper', '4 minutes 11 seconds', false, 26, 26),
(117, 'Run to the Hills', '3 minutes 54 seconds', false, 26, 26),
(118, 'Aces High', '4 minutes 31 seconds', false, 26, 26),
(119, 'Mile voli disko', '3 minutes 26 seconds', false, 27, 27),
(120, 'Jorgovani', '4 minutes 16 seconds', false, 27, 27),
(121, 'Nema vise vremena', '3 minutes 46 seconds', false, 27, 27),
(122, 'Firestone', '4 minutes 33 seconds', false, 28, 28),
(123, 'Stole the Show', '3 minutes 41 seconds', false, 28, 28),
(124, 'Born to be Yours', '3 minutes 12 seconds', false, 28, 28),
(125, 'Porcelain', '4 minutes 01 seconds', false, 29, 29),
(126, 'Natural Blues', '4 minutes 13 seconds', false, 29, 29),
(127, 'Lift Me Up', '3 minutes 57 seconds', false, 29, 29),
(128, 'Do I Wanna Know', '4 minutes 32 seconds', false, 30, 30),
(129, 'Arabella', '3 minutes 29 seconds', false, 30, 30),
(130, 'Snap Out of It', '3 minutes 13 seconds', false, 30, 30),
(131, 'Take Me to Church', '4 minutes 01 seconds', false, 31, 31),
(132, 'From Eden', '4 minutes 43 seconds', false, 31, 31),
(133, 'Cherry Wine', '4 minutes 00 seconds', false, 31, 31),
(134, 'Feeling Good', '2 minutes 53 seconds', false, 32, 32),
(135, 'I Put a Spell on You', '2 minutes 35 seconds', false, 32, 32),
(136, 'Sinnerman', '10 minutes 22 seconds', false, 32, 32),
(137, 'Miljacka', '3 minutes 50 seconds', false, 33, 33),
(138, 'Ja sam jarac', '4 minutes 05 seconds', false, 33, 33),
(139, 'Romanija', '4 minutes 10 seconds', false, 33, 33),
(140, 'Sredinom', '4 minutes 45 seconds', false, 34, 34),
(141, 'Kokuzna Vremena', '4 minutes 22 seconds', false, 34, 34),
(142, 'Lazu Me', '4 minutes 18 seconds', false, 34, 34),
(143, 'Amulette', '4 minutes 02 seconds', false, 35, 35),
(144, 'Dare', '3 minutes 40 seconds', false, 35, 35),
(145, 'Stani Zora', '4 minutes 13 seconds', false, 35, 35),
(146, 'HUMBLE.', '2 minutes 57 seconds', true, 36, 36),
(147, 'DNA.', '3 minutes 06 seconds', true, 36, 36),
(148, 'LOVE.', '3 minutes 33 seconds', true, 36, 36),
(149, 'Bad Guy', '3 minutes 14 seconds', true, 37, 37),
(150, 'bury a friend', '3 minutes 13 seconds', true, 37, 37),
(151, 'all the good girls go to hell', '2 minutes 48 seconds', true, 37, 37),
(152, 'One More Time', '5 minutes 20 seconds', false, 38, 38),
(153, 'Around the World', '7 minutes 10 seconds', false, 38, 38),
(154, 'Harder, Better, Faster, Stronger', '3 minutes 45 seconds', false, 38, 38),
(155, 'Someone You Loved', '3 minutes 2 seconds', false, 39, 39),
(156, 'Before You Go', '3 minutes 35 seconds', false, 39, 39),
(157, 'Hold Me While You Wait', '3 minutes 25 seconds', false, 39, 39),
(158, 'Circles', '3 minutes 35 seconds', false, 40, 40),
(159, 'Wow.', '2 minutes 29 seconds', false, 40, 40),
(160, 'Sunflower', '2 minutes 38 seconds', false, 40, 40),
(161, 'Vechernyaya Moskva', '4 minutes 12 seconds', false, null, null),
(162, 'Katyusha', '3 minutes 5 seconds', false, null, null),
(163, 'Podmoskovnye Vechera', '4 minutes 30 seconds', false, null, null),
(164, 'Kalinka', '2 minutes 56 seconds', false, null, null),
(165, 'Dorogoy Dlinnoyu', '4 minutes 21 seconds', false, null, null),
(166, 'Till I Collapse', '4 minutes 57 seconds', true, 1, 1),
(167, 'Without Me', '4 minutes 50 seconds', true, 1, 1),
(168, 'Mockingbird', '4 minutes 11 seconds', true, 1, 1),
(169, 'Levitating', '3 minutes 23 seconds', false, 2, 2),
(170, 'Don''t Start Now', '3 minutes 3 seconds', false, 2, 2),
(171, 'Hallucinate', '3 minutes 28 seconds', false, 2, 2),
(172, 'Dusha', '4 minutes 18 seconds', false, 3, 3),
(173, 'Sonce vo tvoite rusi kosi', '3 minutes 47 seconds', false, 3, 3),
(174, 'Tajno moja', '4 minutes 1 second', false, 3, 3),
(175, 'Rude Boy', '3 minutes 43 seconds', false, 4, 4),
(176, 'Only Girl (In the World)', '3 minutes 55 seconds', false, 4, 4),
(177, 'S&M', '4 minutes 3 seconds', true, 4, 4),
(178, 'You Belong with Me', '3 minutes 51 seconds', false, 5, 5),
(179, 'Blank Space', '3 minutes 52 seconds', false, 5, 5),
(180, 'Shake It Off', '3 minutes 39 seconds', false, 5, 5),
(181, 'Where Them Girls At', '3 minutes 14 seconds', false, 6, 6),
(182, 'Turn Me On', '3 minutes 19 seconds', false, 6, 6),
(183, 'Little Bad Girl', '3 minutes 14 seconds', false, 6, 6),
(184, 'Waka Waka (This Time for Africa)', '3 minutes 22 seconds', false, 7, 7),
(185, 'Try Everything', '3 minutes 16 seconds', false, 7, 7),
(186, 'Chantaje', '3 minutes 16 seconds', false, 7, 7),
(187, 'In My Feelings', '3 minutes 38 seconds', true, 8, 8),
(188, 'Hotline Bling', '4 minutes 27 seconds', true, 8, 8),
(189, 'Started from the Bottom', '2 minutes 53 seconds', true, 8, 8),
(190, 'Brad Pitt', '3 minutes 20 seconds', false, 9, 9),
(191, 'Tarapana', '3 minutes 36 seconds', false, 9, 9),
(192, 'Gas Gas', '3 minutes 28 seconds', false, 9, 9),
(193, 'Sviraj Sviraj', '4 minutes 10 seconds', false, 10, 10),
(194, 'Magla', '4 minutes 6 seconds', false, 10, 10),
(195, 'Zar je to sve sto imam od tebe', '3 minutes 45 seconds', false, 10, 10),
(196, 'Rolling in the Deep', '3 minutes 48 seconds', false, 11, 11),
(197, 'Someone Like You', '4 minutes 45 seconds', false, 11, 11),
(198, 'Set Fire to the Rain', '4 minutes 2 seconds', false, 11, 11),
(199, 'Blinding Lights', '3 minutes 22 seconds', false, 12, 12),
(200, 'Save Your Tears', '3 minutes 35 seconds', false, 12, 12),
(201, 'In Your Eyes', '3 minutes 57 seconds', false, 12, 12),
(202, 'Maki Maki', '3 minutes 55 seconds', false, 13, 13),
(203, 'Ederlezi', '4 minutes 45 seconds', false, 13, 13),
(204, 'Kalasnjikov', '4 minutes 22 seconds', false, 13, 13),
(205, 'Maskarada', '3 minutes 59 seconds', false, 14, 14),
(206, 'Caj za dvoje', '4 minutes 2 seconds', false, 14, 14),
(207, 'Nije ljubav stvar', '3 minutes 43 seconds', false, 14, 14),
(208, 'Insomnia', '4 minutes 28 seconds', true, 15, 15),
(209, 'Ljubomora', '4 minutes 12 seconds', false, 15, 15),
(210, 'Zena zmija', '3 minutes 56 seconds', false, 15, 15),
(211, 'Dva galeba bela', '4 minutes 15 seconds', false, 16, 16),
(212, 'Kralj cigana', '4 minutes 24 seconds', false, 16, 16),
(213, 'Samo me nebo rastavit moze', '4 minutes 32 seconds', false, 16, 16),
(214, 'Formation', '3 minutes 26 seconds', false, 17, 17),
(215, 'Halo', '3 minutes 44 seconds', false, 17, 17),
(216, 'Run the World (Girls)', '3 minutes 56 seconds', false, 17, 17),
(217, 'Paradise', '4 minutes 38 seconds', false, 18, 18),
(218, 'Hymn for the Weekend', '4 minutes 18 seconds', false, 18, 18),
(219, 'Adventure of a Lifetime', '4 minutes 23 seconds', false, 18, 18),
(220, 'Shape of You', '3 minutes 53 seconds', false, 19, 19),
(221, 'Galway Girl', '2 minutes 50 seconds', false, 19, 19),
(222, 'Perfect', '4 minutes 23 seconds', false, 19, 19),
(223, 'Chandelier', '3 minutes 36 seconds', false, 20, 20),
(224, 'Elastic Heart', '4 minutes 17 seconds', false, 20, 20),
(225, 'Cheap Thrills', '3 minutes 44 seconds', false, 20, 20),
(226, 'Born to Run', '4 minutes 31 seconds', false, 21, 21),
(227, 'Dancing in the Dark', '4 minutes 3 seconds', false, 21, 21),
(228, 'The River', '5 minutes 1 second', false, 21, 21),
(229, 'No Tears Left to Cry', '3 minutes 25 seconds', true, 22, 22),
(230, '7 Rings', '2 minutes 58 seconds', true, 22, 22),
(231, 'Positions', '2 minutes 52 seconds', true, 22, 22),
(232, 'So What', '9 minutes 22 seconds', false, 23, 23),
(233, 'Freddie Freeloader', '9 minutes 49 seconds', false, 23, 23),
(234, 'Blue in Green', '5 minutes 37 seconds', false, 23, 23),
(235, 'Gulumse', '4 minutes 14 seconds', false, 24, 24),
(236, 'Keske', '3 minutes 55 seconds', false, 24, 24),
(237, 'Vazgecemem', '4 minutes 35 seconds', false, 24, 24),
(238, 'I Can See You', '4 minutes 12 seconds', false, 25, 25),
(239, 'El Camino', '3 minutes 48 seconds', false, 25, 25),
(240, 'Hey Boy Hey Girl', '5 minutes 20 seconds', false, 25, 25),
(241, 'Run to the Hills', '3 minutes 54 seconds', false, 26, 26),
(242, 'The Trooper', '4 minutes 11 seconds', false, 26, 26),
(243, 'Aces High', '4 minutes 31 seconds', false, 26, 26),
(244, 'Mile voli disko', '3 minutes 26 seconds', false, 27, 27),
(245, 'Jorgovani', '4 minutes 16 seconds', false, 27, 27),
(246, 'Nema vise vremena', '3 minutes 46 seconds', false, 27, 27),
(247, 'Firestone', '4 minutes 33 seconds', false, 28, 28),
(248, 'Stole the Show', '3 minutes 41 seconds', false, 28, 28),
(249, 'Born to be Yours', '3 minutes 12 seconds', false, 28, 28),
(250, 'Porcelain', '4 minutes 01 seconds', false, 29, 29),
(251, 'Natural Blues', '4 minutes 13 seconds', false, 29, 29),
(252, 'Lift Me Up', '3 minutes 57 seconds', false, 29, 29),
(253, 'Do I Wanna Know', '4 minutes 32 seconds', false, 30, 30),
(254, 'Arabella', '3 minutes 29 seconds', false, 30, 30),
(255, 'Snap Out of It', '3 minutes 13 seconds', false, 30, 30),
(256, 'Take Me to Church', '4 minutes 01 seconds', false, 31, 31),
(257, 'From Eden', '4 minutes 43 seconds', false, 31, 31),
(258, 'Cherry Wine', '4 minutes 00 seconds', false, 31, 31),
(259, 'Feeling Good', '2 minutes 53 seconds', false, 32, 32),
(260, 'I Put a Spell on You', '2 minutes 35 seconds', false, 32, 32),
(261, 'Sinnerman', '10 minutes 22 seconds', false, 32, 32),
(262, 'Miljacka', '3 minutes 50 seconds', false, 33, 33),
(263, 'Ja sam jarac', '4 minutes 05 seconds', false, 33, 33),
(264, 'Romanija', '4 minutes 10 seconds', false, 33, 33),
(265, 'Sredinom', '4 minutes 45 seconds', false, 34, 34),
(266, 'Kokuzna Vremena', '4 minutes 22 seconds', false, 34, 34),
(267, 'Lazu Me', '4 minutes 18 seconds', false, 34, 34),
(268, 'Amulette', '4 minutes 02 seconds', false, 35, 35),
(269, 'Dare', '3 minutes 40 seconds', false, 35, 35),
(270, 'Stani Zora', '4 minutes 13 seconds', false, 35, 35),
(271, 'HUMBLE.', '2 minutes 57 seconds', true, 36, 36),
(272, 'DNA.', '3 minutes 06 seconds', true, 36, 36),
(273, 'LOVE.', '3 minutes 33 seconds', true, 36, 36),
(274, 'Bad Guy', '3 minutes 14 seconds', true, 37, 37),
(275, 'bury a friend', '3 minutes 13 seconds', true, 37, 37),
(276, 'all the good girls go to hell', '2 minutes 48 seconds', true, 37, 37),
(277, 'One More Time', '5 minutes 20 seconds', false, 38, 38),
(278, 'Around the World', '7 minutes 10 seconds', false, 38, 38),
(279, 'Harder, Better, Faster, Stronger', '3 minutes 45 seconds', false, 38, 38),
(280, 'Someone You Loved', '3 minutes 2 seconds', false, 39, 39),
(281, 'Before You Go', '3 minutes 35 seconds', false, 39, 39),
(282, 'Hold Me While You Wait', '3 minutes 25 seconds', false, 39, 39),
(283, 'Circles', '3 minutes 35 seconds', false, 40, 40),
(284, 'Wow.', '2 minutes 29 seconds', false, 40, 40),
(285, 'Sunflower', '2 minutes 38 seconds', false, 40, 40),
(286, 'Vechernyaya Moskva', '4 minutes 12 seconds', false, null, null),
(287, 'Katyusha', '3 minutes 5 seconds', false, null, null),
(288, 'Podmoskovnye Vechera', '4 minutes 30 seconds', false, null, null),
(289, 'Kalinka', '2 minutes 56 seconds', false, null, null),
(290, 'Dorogoy Dlinnoyu', '4 minutes 21 seconds', false, null, null),
(291, 'Life is Good', '5 minutes 35 seconds', true, 8, null),
(292, 'Toosie Slide', '4 minutes 7 seconds', true, 8, null),
(293, 'Promiscuous', '4 minutes 2 seconds', true, 8, null),
(294, 'Dance Monkey', '3 minutes 30 seconds', false, null, 9),
(295, 'The Hills', '4 minutes 2 seconds', true, 12, 12),
(296, 'Can''t Feel My Face', '3 minutes 35 seconds', true, 12, null),
(297, 'Earned It', '4 minutes 37 seconds', true, 12, null),
(298, 'Thinking Out Loud', '4 minutes 41 seconds', false, 19, 19),
(299, 'Photograph', '4 minutes 19 seconds', false, 19, null),
(300, 'Castle on the Hill', '4 minutes 21 seconds', false, 19, null),
(301, 'Senza una donna', '4 minutes 27 seconds', false, 24, null),
(302, 'Father Figure', '5 minutes 38 seconds', false, 23, null),
(303, 'Faith', '3 minutes 14 seconds', false, 23, null),
(304, 'Freedom! ''90', '6 minutes 30 seconds', false, 23, null),
(305, 'Don''t Let the Sun Go Down on Me', '5 minutes 47 seconds', false, 23, null),
(306, 'Levitating', '3 minutes 23 seconds', false, 2, 2),
(307, 'Break My Heart', '3 minutes 41 seconds', false, 2, null),
(308, 'Cool', '3 minutes 29 seconds', false, 2, null),
(309, 'We Found Love', '3 minutes 35 seconds', false, 4, 4),
(310, 'Diamonds', '3 minutes 45 seconds', false, 4, 4),
(311, 'Stay', '3 minutes 59 seconds', false, 4, null),
(312, 'Everything I Wanted', '4 minutes 5 seconds', true, 37, null),
(313, 'Your Power', '4 minutes 5 seconds', true, 37, null),
(314, 'Ocean Eyes', '3 minutes 20 seconds', true, 37, null),
(315, 'New York State of Mind', '6 minutes 3 seconds', false, 32, 32),
(316, 'Piano Man', '5 minutes 37 seconds', false, 32, null),
(317, 'Uptown Girl', '3 minutes 15 seconds', false, 32, null),
(318, 'Vienna', '3 minutes 34 seconds', false, 32, null),
(319, 'Bad Romance', '4 minutes 54 seconds', false, 17, 17),
(320, 'Shallow', '3 minutes 35 seconds', false, 17, null),
(321, 'Poker Face', '3 minutes 57 seconds', false, 17, null),
(322, 'Born This Way', '4 minutes 20 seconds', false, 17, null),
(323, 'Alejandro', '4 minutes 34 seconds', false, 17, null),
(324, 'Hold My Hand', '4 minutes 8 seconds', false, 17, null),
(325, 'Thank U, Next', '3 minutes 27 seconds', true, 22, 22),
(326, '7 rings', '2 minutes 59 seconds', true, 22, 22),
(327, 'God is a woman', '3 minutes 17 seconds', true, 22, null),
(328, 'Problem', '3 minutes 14 seconds', true, 22, null),
(329, 'Bang Bang', '3 minutes 19 seconds', true, 22, null),
(330, 'Side to Side', '3 minutes 46 seconds', true, 22, null),
(331, 'IDGAF', '3 minutes 38 seconds', true, 2, 2),
(332, 'New Rules', '3 minutes 29 seconds', true, 2, 2),
(333, 'Physical', '3 minutes 13 seconds', true, 2, null),
(334, 'Electricity', '3 minutes 58 seconds', true, 2, null),
(335, 'Be the One', '3 minutes 22 seconds', true, 2, null),
(336, 'Future Nostalgia', '3 minutes 4 seconds', true, 2, 2),
(337, 'Don''t Stop the Music', '4 minutes 27 seconds', true, 4, 4),
(338, 'Take a Bow', '3 minutes 49 seconds', true, 4, null),
(339, 'Pon de Replay', '4 minutes 7 seconds', true, 4, null),
(340, 'Disturbia', '3 minutes 58 seconds', true, 4, null),
(341, 'Rehab', '4 minutes 35 seconds', true, 4, null),
(342, 'SOS', '4 minutes 20 seconds', true, 4, null),
(343, 'Love on the Brain', '3 minutes 44 seconds', true, 4, 4),
(344, 'Shut Up and Drive', '3 minutes 34 seconds', true, 4, null),
(345, 'Bad Liar', '4 minutes 20 seconds', true, 12, 12),
(346, 'Heartless', '3 minutes 20 seconds', true, 12, null),
(347, 'False Alarm', '3 minutes 40 seconds', true, 12, null),
(348, 'Pray for Me', '3 minutes 31 seconds', true, 12, null),
(349, 'Starboy', '3 minutes 50 seconds', true, 12, 12),
(350, 'Out of Time', '3 minutes 22 seconds', true, 12, 12),
(351, 'Save Your Tears', '3 minutes 35 seconds', true, 12, 12),
(352, 'Can''t Feel My Face', '3 minutes 33 seconds', true, 12, 12),
(353, 'The Hills', '4 minutes 2 seconds', true, 12, 12),
(354, 'Blinding Lights', '3 minutes 22 seconds', true, 12, 12),
(355, 'Do I Wanna Know?', '4 minutes 31 seconds', false, 30, 30),
(356, 'Arabella', '3 minutes 27 seconds', false, 30, 30),
(357, 'R U Mine?', '3 minutes 21 seconds', false, 30, 30),
(358, 'Why''d You Only Call Me When You''re High?', '2 minutes 41 seconds', false, 30, 30),
(359, 'One for the Road', '3 minutes 20 seconds', false, 30, null),
(360, 'Snap Out of It', '3 minutes 13 seconds', false, 30, null),
(361, 'Knee Socks', '4 minutes 17 seconds', false, 30, null),
(362, 'No. 1 Party Anthem', '4 minutes 3 seconds', false, 30, null),
(363, 'I Wanna Be Yours', '3 minutes 4 seconds', false, 30, null),
(364, 'I Want It That Way', '3 minutes 33 seconds', false, null, null),
(365, 'Shape of You', '4 minutes 24 seconds', false, 19, 19),
(366, 'Galway Girl', '2 minutes 50 seconds', false, 19, 19),
(367, 'Perfect', '4 minutes 23 seconds', false, 19, null),
(368, 'Castle on the Hill', '4 minutes 21 seconds', false, 19, null),
(369, 'Photograph', '4 minutes 18 seconds', false, 19, null),
(370, 'All of Me', '4 minutes 30 seconds', false, 24, null),
(371, 'Ordinary People', '4 minutes 41 seconds', false, 24, null),
(372, 'Save Room', '3 minutes 55 seconds', false, 24, null),
(373, 'Green Light', '5 minutes 12 seconds', false, 24, null),
(374, 'You & I (Nobody in the World)', '4 minutes 12 seconds', false, 24, null),
(375, 'What Lovers Do', '3 minutes 19 seconds', false, 24, null),
(376, 'Like I''m Gonna Lose You', '3 minutes 45 seconds', false, 24, null),
(377, 'Glory', '4 minutes 32 seconds', false, 24, null),
(378, 'Can''t Help Falling in Love', '3 minutes 2 seconds', false, 35, null),
(379, 'Hallelujah', '4 minutes 12 seconds', false, 35, null),
(380, 'Say You Won''t Let Go', '3 minutes 31 seconds', false, 35, null),
(381, 'Let Her Go', '4 minutes 12 seconds', false, 35, null),
(382, 'Stay with Me', '2 minutes 52 seconds', false, 35, null),
(383, 'Stand by Me', '3 minutes 1 second', false, 35, null),
(384, 'Tears in Heaven', '4 minutes 36 seconds', false, 35, null),
(385, 'Tennessee Whiskey', '4 minutes 53 seconds', false, 35, null),
(386, 'If I Ain''t Got You', '3 minutes 48 seconds', false, 35, null),
(387, 'Gravity', '4 minutes 6 seconds', false, 35, null);

INSERT INTO song_lyrics (id, lyrics, song_id) VALUES 
(1, 'Look, if you had one shot, or one opportunity...', 1),
(2, 'Talking in my sleep at night, making myself crazy...', 2),
(3, 'Ti si meni jedina u dusi...', 3),
(4, 'Now that its raining more than ever, know that well still have each other...', 4),
(5, 'We were both young when I first saw you...', 5),
(6, 'You shout it out, But I cant hear a word you say...', 6),
(7, 'Ladies up in here tonight, No fighting, we got the refugees up in here...', 7),
(8, 'I been moving calm, dont start no trouble with me...', 8),
(9, 'Sama sam da nemam nikog, sve bih dala da si tu...', 9),
(10, 'Ti si mi u krvi, zivim da te volim...', 10),
(11, 'Hello, its me, I was wondering...', 11),
(12, 'Ive been tryna call, Ive been on my own for long enough...', 12),
(13, 'Moj je zivot Svicarska: Djosla bih no da nema, nesretna ljubav sto u Sarajevu...', 13),
(14, 'Baby, bice sve u redu, prolazna je ovo tuga...', 14),
(15, 'Lazu te, lazu te, o lazu te...', 15),
(16, 'Dva galeba bela, nocas slecu na Balkan...', 16),
(17, 'Remember those walls I built, Well, baby theyre tumbling down...', 17),
(18, 'When she was just a girl, She expected the world...', 18),
(19, 'The club isnt the best place to find a lover so the bar is where I go...', 19),
(20, 'Party girls dont get hurt, Cant feel anything, when will I learn...', 20),
(21, 'In the day we sweat it out on the streets of a runaway American dream...', 21),
(22, 'Yeah, breakfast at Tiffanys and bottles of bubbles...', 22),
(23, 'I go out walking, after midnight, out in the moonlight...', 23),
(24, 'Seni yazdim kalbime kara kalemle yarim...', 24),
(25, 'O Gurbet, moj dilbere...', 25),
(26, 'I am a man who walks alone, and when Im walking a dark road...', 26),
(27, 'Hej, Jugosloveni, zajedno smo jaci...', 27),
(28, 'Im a flame, youre a fire, Im the dark in need of light...', 28),
(29, 'In my dreams Im dying all the time...', 29),
(30, 'Have you got colour in your cheeks?...', 30),
(31, 'My lovers got humor, she is the giggle at a funeral...', 31),
(32, 'Birds flying high, you know how I feel...', 32),
(33, 'Kad prodjem bascom, zastane tisina...', 33),
(34, 'Dabogda umro da te ja ne vidim, dabogda umro...', 34),
(35, 'Moj dilbere, kud se seces...', 35),
(36, 'Nobody pray for me, It been that day for me...', 36),
(37, 'White shirt now red, my bloody nose...', 37),
(38, 'One more time, were gonna celebrate...', 38),
(39, 'Im going under, and this time I fear theres no one to save me...', 39),
(40, 'Seasons change and our love went cold...', 40),
(48, 'Despacito, quiero respirar tu cuello despacito...', NULL),
(49, 'Besame, besame mucho, como si fuera esta noche la ultima vez...', NULL),
(50, 'La vida es un carnaval y las penas se van cantando...', NULL),
(51, 'Eres tu, como una mañana de verano...', NULL),
(52, 'Vivir mi vida, la la la la...', NULL),
(53, 'La camisa negra, porque negra tengo el alma...', NULL),
(54, 'Bailando, bailando, amigos adios, adios el silencio loco...', NULL),
(55, 'La bamba, para bailar la bamba se necesita una poca de gracia...', NULL),
(56, 'Volvere, volvere a tus brazos otra vez...', NULL),
(57, 'Amor eterno e inolvidable...', NULL),
(58, 'Take me to church, I''ll worship like a dog...', 256),
(59, 'My lover''s got humor...', 257),
(60, 'She''s the giggle at a funeral...', 258),
(61, 'If I could only find the words...', 379),
(62, 'Oh, won''t you stay with me...', 382),
(63, 'Tears in heaven, would it be the same...', 384),
(64, 'You''re as smooth as Tennessee whiskey...', 385),
(65, 'If I ain''t got you, baby...', 386),
(66, 'Working on the weekend like usual...', 291),
(67, 'Black leather gloves, no sequins...', 292),
(68, 'You see us in the club goin'' all night...', 293),
(69, 'I can''t feel my face when I''m with you...', 296),
(70, 'You deserve to be appreciated, lady...', 297),
(71, 'When your legs don''t work like they used to before...', 298),
(72, 'We keep this love in a photograph...', 299),
(73, 'For all the times that you rain on my parade...', 300),
(74, 'Father figure, treat her like a mother...', 302),
(75, 'Freedom! Freedom! I can''t move...', 304),
(76, 'Some people want it all, but I don''t want nothing at all...', 370),
(77, 'Ordinary people, we don''t know which way to go...', 371),
(78, 'Save room for my love...', 372),
(79, 'We found love in a hopeless place...', 309),
(80, 'Shut up and drive, drive, drive...', 344),
(81, 'Why''d you only call me when you''re high...', 358),
(82, 'Snap out of it...', 360);

INSERT INTO playlist (id, title) VALUES 
(1, 'Workout Hits'),
(2, 'Soft Pop Hits'),
(3, 'Balkan Ballads'),
(4, 'Top Hits 2020'),
(5, 'Dance Floor Hits'),
(6, 'Classic Rock Favorites'),
(7, 'Ultimate Pop Playlist'),
(8, 'Jazz and Blues'),
(9, 'Balkan Beats'),
(10, 'Chill Vibes'),
(11, 'Listen on the road');

INSERT INTO playlists_songs (playlist_id, song_id) VALUES 
(1, 1),
(1, 6),
(1, 8),
(2, 2),
(2, 5),
(2, 11),
(3, 3),
(3, 9),
(3, 10),
(3, 14),
(4, 12),
(4, 18),
(4, 20),
(5, 7),
(5, 17),
(5, 19),
(6, 21),
(6, 26),
(7, 22),
(7, 31),
(7, 37),
(8, 23),
(8, 32),
(9, 24),
(9, 25),
(9, 33),
(9, 34),
(10, 28),
(10, 29),
(10, 35),
(10, 38);

INSERT INTO genre (id, name) VALUES 
(1, 'Hip Hop'),
(2, 'Pop'),
(3, 'Rock'),
(4, 'Dance'),
(5, 'R&B'),
(6, 'Classical'),
(7, 'Folk'),
(8, 'Electronic'),
(9, 'Reggaeton'),
(10, 'Jazz'),
(11, 'Blues'),
(12, 'Country'),
(13, 'Soul'),
(14, 'Heavy Metal'),
(15, 'Electro Pop'),
(16, 'Alternative Rock'),
(17, 'Indie'),
(18, 'Gospel'),
(19, 'Black Metal'),
(20, 'Polka');

INSERT INTO songs_genres (song_id, genre_id) VALUES 
(1, 1),
(2, 2),
(3, 7),
(4, 2),
(4, 5),
(5, 2),
(6, 4),
(7, 2),
(7, 5),
(8, 1),
(8, 2),
(9, 7),
(10, 7),
(11, 2),
(12, 2),
(13, 3),
(14, 7),
(15, 2),
(16, 7),
(17, 5),
(18, 3),
(19, 2),
(20, 2),
(6, 8),
(1, 3),
(5, 3),
(10, 3),
(21, 11),
(22, 12),
(23, 11),
(24, 14),
(25, 14),
(26, 16),
(27, 14),
(28, 17),
(29, 17),
(30, 18),
(31, 18),
(32, 13),
(33, 14),
(34, 14),
(35, 14),
(36, 13),
(37, 12),
(38, 17),
(39, 12),
(40, 12),
(21, 6),
(26, 6),
(31, 9),
(22, 2),
(37, 4),
(39, 2);


-- 1/6

-- Show all details for artists born before 01-04-1992
SELECT * FROM artist_details
WHERE date_of_birth < '01-04-1992'

-- Show all details for artists from Germany
SELECT * FROM artist_details
WHERE country = 'Germany'

-- Show all songs longer than 4 minutes
SELECT * FROM song
WHERE duration > '4m'

-- Show all explicit songs
SELECT * FROM song
WHERE explicit = true

-- Show all genres having ‘o’ in the name
SELECT * FROM genre
WHERE name ILIKE '%o%'

-- Show all lyrics having the word ‘that’

SELECT * FROM song_lyrics
WHERE lyrics LIKE '% that %'


-- 2/6

-- Show all details from artists that have ‘e’ in their full name, ordered by date of birth by the oldest one to the youngest one
SELECT * FROM artist_details
WHERE full_name ILIKE '%e%'
ORDER BY date_of_birth ASC

-- Show all non-explicit songs sorted by duration from shortest to longest
SELECT * FROM song
WHERE explicit = false
ORDER BY duration ASC

-- Show albums that have ‘u’ in their name sorted by rating, with worst rating on top
SELECT * FROM album
WHERE name ILIKE '%u%'
ORDER BY rating ASC


-- 3/6

-- List all artist names and artist full names without duplicates
SELECT name FROM artist
UNION 
SELECT full_name FROM artist_details

-- List all artist names and artist full names with duplicates
SELECT name FROM artist 
UNION ALL
SELECT full_name FROM artist_details

-- List all common artist names and artist full names
SELECT name FROM artist
INTERSECT
SELECT full_name FROM artist_details


-- 4/6

-- Show all album names and its rating
SELECT name, rating FROM album

-- Show all artists with their name and full name side by side
SELECT artist.name as artist_name, artist_details.full_name as artist_full_name
FROM artist
INNER JOIN artist_details ON artist.id = artist_details.artist_id

-- Show all songs with their lyrics side by side
SELECT song.name as song_name, lyrics
FROM song
INNER JOIN song_lyrics ON song.id = song_lyrics.song_id


-- 5/6

-- Show artist names with album names side by side
SELECT artist.name as artist_name, album.name as album_name
FROM artist
INNER JOIN song ON artist.id = song.artist_id
INNER JOIN album ON song.album_id = album.id

-- Show the artist names and their spouse name for all artists including ones that don’t have details
SELECT artist.name as artist_name, artist_details.spouse_name
FROM artist
LEFT OUTER JOIN artist_details ON artist.id = artist_details.artist_id

SELECT artist.name as artist_name, artist_details.spouse_name
FROM artist_details
RIGHT OUTER JOIN artist ON artist_details.artist_id = artist.id

-- Show artist names and list of countries for all, including missing artist and missing details info
SELECT artist.name as artist_name, artist_details.country
FROM artist
FULL OUTER JOIN artist_details ON artist.id = artist_details.artist_id


-- 6/6

-- List all song names with genre names
SELECT song.name as song_name, genre.name as genre_name
FROM song
INNER JOIN songs_genres ON song.id = songs_genres.song_id
INNER JOIN genre ON songs_genres.genre_id = genre.id

-- List all song names with playlist names
SELECT song.name as song_name, playlist.title as playlist_name
FROM song
INNER JOIN playlists_songs ON song.id = playlists_songs.song_id
INNER JOIN playlist ON playlists_songs.playlist_id = playlist.id

-- List all album names and rating that have rating above 4 with the artist name
SELECT DISTINCT album.name as album_name, rating, artist.name as artist_name
FROM album 
INNER JOIN song ON album.id = song.album_id
INNER JOIN artist ON song.artist_id = artist.id
WHERE rating > 4
ORDER BY rating ASC

-- List all explicit song names and artist names without missing data
SELECT song.name as song_name, artist.name as artist_name
FROM song
INNER JOIN artist ON song.artist_id = artist.id
WHERE song.explicit = true


