/*
INSERT INTO Bands(band_name, foundation_year) VALUES ('Metallica', 1981);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Iron Maiden', 1975);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Judas Priest', 1969);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Linkin Park', 1996);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Before the dawn', 1999);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Pantera', 1981);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Guns n Roses', 1985);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Nirvana', 1981);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Pink Floyd', 1981);
INSERT INTO Bands(band_name, foundation_year) VALUES ('Plain White Ts', 1981);

INSERT INTO Stores(store_name, store_address, store_owner) VALUES('METALHEAD', 'Adrian Marino 8', 'Tuomas Saukkonen');
INSERT INTO Stores(store_name, store_address, store_owner) VALUES('Carturesti', 'Alexandru Vaida-Voevod 53', 'Grebla Mihai');
INSERT INTO Stores(store_name, store_address, store_owner) VALUES('Niche Records', 'Arcu?ului 6A', 'Andrei Tomov');
INSERT INTO Stores(store_name, store_address, store_owner) VALUES('CD Bar Stratford', 'The Mall, London E15 1XQ', 'James Miner');

INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Anthony Martial', 'Phone', 'Android');
INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Chandler Bing', 'Notebook', 'Linux');
INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Tyrion Lannister', 'Phone', 'iOS');
INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Lucas Torreira', 'Notebook', 'Windows');
INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Enoch Thompson', 'Tablet', 'Android');

INSERT INTO Quizzes(creator, difficulty, no_of_songs) VALUES('mjo322', 'hard', 10);
INSERT INTO Quizzes(creator, difficulty, no_of_songs) VALUES('paulmc', 'easy', 17);
INSERT INTO Quizzes(creator, difficulty, no_of_songs) VALUES('tracyhimym', 'medium', 8);
INSERT INTO Quizzes(creator, difficulty, no_of_songs) VALUES('rachelgreen', 'medium', 15);
INSERT INTO Quizzes(creator, difficulty, no_of_songs) VALUES('coopermonster', 'insane', 5);

INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(11, 'James', 'Hetfield', '1963-08-03');
INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(17, 'Axl', 'Rose', '1962-02-06');
INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(13, 'Rob', 'Halford', '1951-08-25');
INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(16, 'Phil', 'Anselmo', '1968-06-30');
INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(18, 'Kurt', 'Cobain', '1967-02-20');
INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(15, 'Tuomas', 'Saukkonen', '1980-03-18');
INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(19, 'Roger', 'Waters', '1943-09-06');
INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(null, 'William', 'Broad', '1955-11-30');

INSERT INTO Albums(album_name, band_id, genre_name, no_of_songs, producer, store_id) VALUES('Appetite for Destruction', 17, null, 12, 'Rumbo Studios', 2);
INSERT INTO Albums(album_name, band_id, genre_name, no_of_songs, producer, store_id) VALUES('Use Your Illusion', 17, null, 16, 'A&M Studios', 1);
INSERT INTO Albums(album_name, band_id, genre_name, no_of_songs, producer, store_id) VALUES('Hardwired...to Self-Destruct', 11, 'Heavy Metal', 12, 'Metallica HQ', 4);
INSERT INTO Albums(album_name, band_id, genre_name, no_of_songs, producer, store_id) VALUES('Halford IV: Made of Metal', null, 'Heavy Metal', 14, 'Roy Z', 4);
INSERT INTO Albums(album_name, band_id, genre_name, no_of_songs, producer, store_id) VALUES('Appetite for Destruction', 17, null, 12, 'A&M Studios', 3);
INSERT INTO Albums(album_name, band_id, genre_name, no_of_songs, producer, store_id) VALUES('The X Factor', 12, 'Heavy Metal', 11, 'A&M Studios', 1);

INSERT INTO Playlist(playlist_name, no_of_songs, device_id) VALUES('Feeling', 5, 5);
INSERT INTO Playlist(playlist_name, no_of_songs, device_id) VALUES('Road Trip', 30, 3);
INSERT INTO Playlist(playlist_name, no_of_songs, device_id) VALUES('Nighty', 10, 1);
INSERT INTO Playlist(playlist_name, no_of_songs, device_id) VALUES('Work', 23, 2);

INSERT INTO Shows(show_name, show_type, production_year, show_director, store_id) VALUES('Friends', 'TV Series', 1994, null, 2);
INSERT INTO Shows(show_name, show_type, production_year, show_director, store_id) VALUES('How I met your mother', 'TV Series', 2005, null, 2);
INSERT INTO Shows(show_name, show_type, production_year, show_director, store_id) VALUES('Mission: Impossible 2', 'Movie', 2000, 'J.J. Abrams', 4);
INSERT INTO Shows(show_name, show_type, production_year, show_director, store_id) VALUES('Boardwalk Empire', 'TV Series', 2010, null, 4);

INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Unforgiven 2', 389, 'Heavy Metal', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Hardwired', 389, 'Heavy Metal', 3);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Dead Horse', 191, null, 2);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('2 AM', 330, 'Heavy Metal', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Faithless', 196, 'Heavy Metal', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('A Lonely September', 270, 'Indie Rock', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Black Dawn', 244, 'Heavy Metal', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('I"ll be there for you', 194, 'Alternative Rock', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Hey Beautiful', 218, null, null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Humlbe', 183, null, null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Lithium', 389, 'Grunge', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Rape me', 171, 'Grunge', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('You"ve got another thing coming', 689, 'Heavy Metal', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('Cemetery Gates', 561, 'Heavy Metal', null);
INSERT INTO Songs(song_name, duration, genre, album_id) VALUES ('In the end', 217, 'Rap Rock', null);

INSERT INTO Links_Song_Artist(song_id, artist_id) VALUES(3, 1);
INSERT INTO Links_Song_Artist(song_id, artist_id) VALUES(4, 1);
INSERT INTO Links_Song_Artist(song_id, artist_id) VALUES(5, 2);
INSERT INTO Links_Song_Artist(song_id, artist_id) VALUES(7, 6);
INSERT INTO Links_Song_Artist(song_id, artist_id) VALUES(9, 6);
INSERT INTO Links_Song_Artist(song_id, artist_id) VALUES(13, 5);
INSERT INTO Links_Song_Artist(song_id, artist_id) VALUES(14, 5);
INSERT INTO Links_Song_Artist(song_id, artist_id) VALUES(15, 3);

INSERT INTO Links_Song_Device(song_id, device_id) VALUES(7, 2);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(15, 5);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(11, 5);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(11, 3);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(5, 3);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(14, 4);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(3, 4);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(16, 5);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(9, 3);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(16, 1);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(8, 3);
INSERT INTO Links_Song_Device(song_id, device_id) VALUES(5, 1);

INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(3, 3);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(15, 4);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(7, 3);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(6, 4);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(14, 3);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(10, 1);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(17, 2);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(11, 2);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(13, 4);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(13, 3);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(17, 4);
INSERT INTO Links_Song_Playlist(song_id, playlist_id) VALUES(14, 2);

INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(13, 4);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(12, 1);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(5, 5);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(12, 5);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(7, 1);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(6, 3);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(15, 1);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(14, 2);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(16, 5);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(5, 3);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(13, 2);
INSERT INTO Links_Song_Quiz(song_id, quiz_id) VALUES(14, 4);

INSERT INTO Links_Song_Show(song_id, show_id) VALUES(10, 1);
INSERT INTO Links_Song_Show(song_id, show_id) VALUES(11, 2);
*/

--INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Isabella Rosselini', 'Phone', 'iOS');
--INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Alex Darie', 'Phone', 'iOS');
--DELETE FROM Devices WHERE device_type = 'Phone' and OS = 'iOS';

--INSERT INTO Playlist(playlist_name, no_of_songs, device_id) VALUES('Pray', 100, 4);
--INSERT INTO Playlist(playlist_name, no_of_songs, device_id) VALUES('Kitsch', 110, 1);
--DELETE FROM Playlist WHERE no_of_songs >= 100;

--INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Monte Cristo', 'Notebook', 'NeXTStep');
--INSERT INTO Devices(device_owner, device_type, OS) VALUES ('Moise', 'Notebook', 'BSD/OS');
--DELETE FROM Devices WHERE OS not in ('Android', 'Linux', 'iOS', 'Windows');

--UPDATE Shows SET show_director = 'no director' WHERE show_director is null and show_type = 'TV Series';
--UPDATE Quizzes SET difficulty = 'insane' WHERE no_of_songs between 0 and 9;
--UPDATE Genres SET country_of_origin = 'USA' WHERE genre_name like '%Rock';

/*
SELECT * FROM Albums;
SELECT * FROM Artists;
SELECT * FROM Bands;
SELECT * FROM Devices;
SELECT * FROM Genres;
SELECT * FROM Playlist;
SELECT * FROM Quizzes;
SELECT * FROM Shows;
SELECT * FROM Songs;
SELECT * FROM Stores;
*/

/*
SELECT * FROM Links_Song_Artist;
SELECT * FROM Links_Song_Device;
SELECT * FROM Links_Song_Playlist;
SELECT * FROM Links_Song_Quiz;
SELECT * FROM Links_Song_Show;
*/

--INSERT INTO Artists(band_id, first_name, last_name, birth_date) VALUES(11, 'James', 'Hetfield', '2006-08-03');
