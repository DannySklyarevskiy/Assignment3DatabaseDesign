--Query 3: "Voodoo", assuming that you don't know the TrackId, 
--so your insert query should specify the TrackId directly.

INSERT INTO music_video(TrackId, VideoDirector)
 SELECT TrackId, "José-Emilio Sagaró"
    FROM tracks
    WHERE Name == "Voodoo";
