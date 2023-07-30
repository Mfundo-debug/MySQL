-- Active: 1688787340623@@127.0.0.1@3306@my_database
CREATE DATABASE IF NOT EXISTS spotify;

USE spotify;

CREATE Table IF NOT EXISTS artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS songs (
    song_id INT PRIMARY KEY,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE IF NOT EXISTS global_song_rank (
    day INT,
    song_id INT,
    `rank` INT,
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

INSERT INTO artists (artist_id, artist_name)
VALUES (101, 'Ed Sheeran'), (120, 'Drake');

INSERT INTO songs (song_id, artist_id)
VALUES (45202, 101), (19960, 120);

INSERT INTO global_song_rank (day, song_id, `rank`)
VALUES (1, 45202, 5), (3, 45202, 2), (1, 19960, 3), (9, 19960, 15);
/* Assume there are three Spotify tables: artists, songs, and global_song_rank, 
which contain information about the artists, songs, and music charts, respectively.
Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table. 
Display the top 5 artist names in ascending order, along with their song appearance ranking. */
SELECT a.artist_name, COUNT(*) AS song_appearance_rank,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS appearance_rank
FROM artists AS a
JOIN songs s ON a.artist_id = s.artist_id
JOIN global_song_rank AS g ON s.song_id = g.song_id
WHERE g.rank <= 10
GROUP BY a.artist_name
ORDER BY song_appearance_rank DESC, appearance_rank ASC
LIMIT 5;
