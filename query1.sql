--   Query 1: Create a new Table Music Video, 
--   that is a class of type Track (generalization) but adds the attribute Video director. 
--   A music video is a track. There cannot be a video without a track, 
--   and each track can have either no video or just one. 

CREATE TABLE "music_video" (
	[TrackID] INTEGER PRIMARY KEY NOT NULL,
	[VideoDirector]	TEXT NOT NULL,
	FOREIGN KEY("TrackId") REFERENCES "tracks"("TrackId") ON DELETE NO ACTION ON UPDATE NO ACTION
);
