CREATE TABLE "genres" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "genres_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "songs" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"youtube_link" varchar(255) NOT NULL,
	"score" integer NOT NULL DEFAULT '0',
	CONSTRAINT "songs_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "songs_genres" (
	"id" serial NOT NULL,
	"song_id" integer NOT NULL,
	"genre_id" integer NOT NULL,
	CONSTRAINT "songs_genres_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "songs_genres" ADD CONSTRAINT "songs_genres_fk0" FOREIGN KEY ("song_id") REFERENCES "songs"("id");
ALTER TABLE "songs_genres" ADD CONSTRAINT "songs_genres_fk1" FOREIGN KEY ("genre_id") REFERENCES "genres"("id");