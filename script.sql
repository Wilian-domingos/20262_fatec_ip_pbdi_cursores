DROP TABLE IF EXISTS tb_top_youtubers;

CREATE TABLE tb_top_youtubers (
    cod_top_youtubers SERIAL PRIMARY KEY,
    rank INT,
    youtuber VARCHAR(200) NULL,
    subscribers INT NULL,
    video_views BIGINT NULL,
    video_count INT NULL,
    category VARCHAR(200) NULL,
    started INT NULL
);

Select * from tb_top_youtubers;

Do $$
Declare
	cur_nomes_youtubers refcursor;
	v_youtuber Varchar(200);
begin
	open cur_nomes_youtubers FOR
	select youtuber
	from tb_top_youtubers;
	LOOP
		fetch cur_nomes_youtubers into v_youtuber;
		exit when not found;
		Raise notice '%', v_youtuber;
	end loop;
	close cur_nomes_youtubers;

end;
$$