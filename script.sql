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


--cursor nao vinculado de query dinamica
--exibindo nomes de youtuber que começaram a partir de um ano especifico


DO $$
DECLARE
--DECLARAR AS VARIAVEIS
	cur_nomes_a_partir_de REFCURSOR;
	v_youtuber VARCHAR (200);
	v_ano int:=2008;
	v_nome_tabela VARCHAR(200):='tb_top_youtubers';
BEGIN
-- ABERTURA DO CURSOR
	OPEN cur_nomes_a_partir_de FOR EXECUTE 
	format ('
	SELECT youtuber FROM %s WHERE started >= $1',
	v_nome_tabela	
	)
	USING v_ano;
	 LOOP
		FETCH cur_nomes_a_partir_de INTO v_youtuber;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '%', v_youtuber;
	END LOOP;
	--ENCERRAR O CURSOR
	CLOSE cur_nomes_a_partir_de;

END;
$$