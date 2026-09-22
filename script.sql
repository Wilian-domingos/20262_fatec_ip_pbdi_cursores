CREATE TABLE tb_top_youtubers(
	cod_top_youtubers SERIAL PRIMARY KEY,
RANK INT,
youtuber VARCHAR(200)NULL,
subscribers INT NULL,
video_views INT NULL,
category VARCHAR(200) NULL,
started INT NULL
);
