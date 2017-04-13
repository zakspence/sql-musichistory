INSERT INTO Album 
SELECT null, 
		'Arca', 
		'7/04/2017', 
		2597, 
		'XL', 
		ar.ArtistId, 
		g.GenreId
FROM Artist as ar, Genre as g
WHERE ar.ArtistName == 'Arca' and g.Label == 'Electronic';

Select * from Song as s
Where s.Title == 'Anoche';

Select a.AlbumId from Album as a
Where a.Title == 'Arca';

Insert into Song
Select 	null,
		'Anoche',
		216,
		'02/24/2017',
		g.genreID,
		ar.ArtistId,
		al.AlbumId

From Genre as g, Artist as ar, Album as al
Where g.Label == 'Electronic' and al.Title == 'Arca' and ar.ArtistName == 'Arca';

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT ar.ArtistName, al.Title, s.Title
from Artist as ar
Left Join Album as al on al.ArtistId = ar.ArtistId
Left Join Song as s on s.AlbumId = al.AlbumId;

SELECT al.Title, COUNT(s.SongId) as NumSongs
FROM Album al
LEFT JOIN Song s on s.AlbumId == al.AlbumId
GROUP BY al.Title;

SELECT ar.ArtistName, COUNT(s.SongId) as NumSongs
FROM Artist ar, Album al
LEFT JOIN Song s on s.AlbumId == al.AlbumId and al.ArtistId == ar.ArtistId
GROUP BY ar.ArtistName;

SELECT g.Label, COUNT(s.SongId) as NumSongs
FROM Genre g
LEFT JOIN Song s on g.GenreId == s.GenreId
GROUP BY g.Label;

SELECT al.Title, Max(al.AlbumLength)
from Album al;

SELECT s.Title, Max(s.SongLength)
from Song s;

SELECT s.Title, Max(s.SongLength), al.Title
from Song s, Album al
Where s.AlbumId = al.AlbumId;