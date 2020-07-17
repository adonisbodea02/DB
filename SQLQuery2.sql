--select all artists who are born in the 60's or the 80's
/*
SELECT A.artist_id, A.first_name, A.last_name
FROM Artists A
WHERE year(A.birth_date) between 1960 and 1970
UNION
SELECT A.artist_id, A.first_name, A.last_name
FROM Artists A
WHERE year(A.birth_date) between 1980 and 1990; 
*/

--select all the grunge and alternative rock songs;
/*
SELECT S.song_id, S.song_name
from Songs S
WHERE S.genre = 'Grunge' or S.genre = 'Alternative Rock';
*/

--select all Guns n Roses albums who have more than 10 songs;

/*
SELECT DISTINCT A.album_name
FROM Albums A
WHERE A.no_of_songs > 10 and band_id in
					(SELECT B.band_id
					FROM Bands B
					WHERE B.band_name = 'Guns N Roses');


--select all shows which are TV Series and were made after 2000 inclusively;
*/
SELECT S.show_name
FROM Shows S
WHERE S.production_year >= 2000
INTERSECT
SELECT S.show_name
FROM Shows S
WHERE S.show_type = 'TV Series';


--select all quizzes with with at least 6 questions and at most 10 questions;
/*
SELECT Q.quiz_id, Q.creator
FROM Quizzes Q
WHERE Q.no_of_songs >= 6
EXCEPT
SELECT Q.quiz_id, Q.creator
FROM Quizzes Q
WHERE Q.no_of_songs > 10
*/

--select only the difficult quizzes(hard or insane)
/*
SELECT Q.quiz_id, Q.creator
FROM Quizzes Q
WHERE Q.difficulty not in ('easy', 'medium');
*/

--select the playlists on Chandler's device;
/*
SELECT *
FROM Playlist P LEFT JOIN Devices D on D.device_id = P.device_id and D.device_owner = 'Chandler Bing';
*/

--select all the songs that are on albums from Metallica
/*
Select *
from Songs S inner join Albums A on S.album_id=A.album_id inner join Bands B on A.band_id = B.band_id where B.band_name = 'Metallica'; 
*/

--show for each song its id, name, the playlist in each it is and the show in which it appeared
/*
Select S.song_id, S.song_name, P.playlist_id, P.playlist_name, Sh.show_name
from Playlist P full join Links_Song_Playlist L on P.playlist_id=L.playlist_id 
full join Songs S on L.song_id=S.song_id full join Links_Song_Show LS on LS.song_id=S.song_id full join Shows Sh on Sh.show_id=LS.show_id
*/

--Select all the shows which are in Carturesti;
/*
SELECT *
FROM Shows Sh RIGHT JOIN Stores St on Sh.store_id = St.store_id and St.store_name = 'Carturesti';
*/

--select all the songs written by Kurt Cobain;
/*
SELECT S.song_name
FROM Songs S
WHERE S.song_id in
				(SELECT L.song_id
				FROM Links_Song_Artist L
				WHERE L.artist_id in
								(SELECT A.artist_id
								FROM Artists A
								WHERE A.first_name = 'Kurt' and A.last_name = 'Cobain'))
*/

--select all albums which you can find in METALHEAD
/*
SELECT DISTINCT A.album_name
FROM Albums A
WHERE store_id in
				(SELECT S.store_id
				FROM Stores S
				WHERE S.store_name = 'METALHEAD')
*/

--select all songs which have a known writer
/*
SELECT DISTINCT S.song_name
FROM Songs S
WHERE EXISTS
	(SELECT *
	FROM Links_Song_Artist L
	WHERE S.song_id = L.song_id)*/--select all songs which do not appear in quizzes/*SELECT S.song_name
FROM Songs S
WHERE NOT EXISTS
	(SELECT *
	FROM Links_Song_Quiz L
	WHERE S.song_id = L.song_id)*/--select the longest song written by Tuomas Saukkonen/*SELECT TOP 1 B.sname, B.durfrom (select S.song_name as sname, S.duration as dur from Songs S inner join Links_Song_Artist L on S.song_id = L.song_id inner join Artists A on L.artist_id = A.artist_id where A.first_name = 'Tuomas' and A.last_name = 'Saukkonen') Border by B.dur desc
*/

--select the top 3 oldest artists who have songs in the library
/*SELECT TOP 3 B.fname, B.lname, B.yobfrom (select A.first_name as fname, A.last_name as lname, year(A.birth_date) as yob from Artists A inner join Links_Song_Artist L on A.artist_id = L.artist_id inner join Songs S on L.song_id = S.song_id) Border by B.yob asc
*/

--count all the songs of each particular genre contained by the music library
/*
SELECT S.genre, COUNT(S.song_name) as No_of_Songs
FROM Songs S
GROUP BY S.genre
HAVING S.genre is not null
*/

--find the average duration of all the songs of each particular genre contained by the music library, with the genre appeared after 1980
/*
SELECT S.genre, AVG(S.duration) as Average_duration_of_song
FROM Songs S
GROUP BY S.genre
HAVING S.genre in
				(SELECT G.genre_name
				FROM Genres G
				WHERE G.period_of_origin >= 1980
*/

--find the number of albums of each particular band which was founded after 1980
/*
SELECT A.band_id, COUNT(A.no_of_songs) as No_of_Songs
FROM Albums A
GROUP BY A.band_id
HAVING A.band_id IN
			(SELECT B.band_id
			FROM Bands B
			WHERE B.foundation_year >= 1980)
*/

--count all the devices by type
/*
SELECT D.device_type, COUNT(D.device_id) as No_of_Devices
FROM Devices D
GROUP BY D.device_type
*/

--select all the songs which are after alphabetically than any song name 'In the end';

SELECT *
FROM Songs S
WHERE S.song_name > ANY (SELECT S2.song_name
				  FROM Songs S2
				  WHERE S2.song_name = 'In the end')


SELECT *
FROM Songs S
WHERE S.song_name NOT IN (SELECT S2.song_name
				  FROM Songs S2
				  WHERE S2.song_name <= 'In the end')


--select all the songs which are before alphabetically than any song name 'In the end' or 'Lithium;
/*
SELECT *
FROM Songs S
WHERE S.song_name < ALL (SELECT S2.song_name
						FROM Songs S2
						WHERE S2.song_name = 'In the end' OR S2.song_name = 'Lithium')


SELECT *
FROM Songs S
WHERE S.song_name NOT IN (SELECT S2.song_name
				  FROM Songs S2
				  WHERE S2.song_name >= 'In the end' or S2.song_name >= 'Lithium')
*/

--select all the songs which are last longer than all songs named 'Black Dawn'
/*
SELECT *
FROM Songs S
WHERE S.duration > ALL (SELECT S2.duration
						FROM Songs S2
						WHERE S2.song_name = 'Black Dawn')

SELECT * 
FROM Songs S
WHERE S.duration > (SELECT MAX(S2.duration)
					from Songs S2
					WHERE S2.song_name = 'Black Dawn')
*/


