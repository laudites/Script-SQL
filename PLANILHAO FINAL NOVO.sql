
--13-08-2018
-- Criando tabela temporaria com os acessorios e acessorios obrigatorios
create procedure [dbo].[marge3]
as
with Append1 as (
select distinct
	gab_gabacsg.corte,
	gab_obracsg.acessorio_obrigatorio as acessorio
from gab_gabacsg
	inner join gab_obracsg
		on gab_gabacsg.acessorio = gab_obracsg.acessorio

union all
select corte,acessorio from gab_gabacsg
)
select distinct
	
	replace(replace(replace(GAB_ACSG.chave_busca,'<MODELO>',Append1.corte),'<COMPR>',GAB_PARAM_MED_CRT.medida),'<ANGULO>',GAB_PARAM_MED_CRT.tipo_med) as chave_busca

	
from Append1
		inner join GAB_PARAM_MED_CRT
			on Append1.corte = GAB_PARAM_MED_CRT.Corte
		inner join GAB_ACSG
			on Append1.acessorio = GAB_ACSG.acessorio


-- Criando a funcao para dar um "split" (|) nos parametros
create FUNCTION [dbo].[Split3]
(
    @String NVARCHAR(4000),
    @Delimiter NCHAR(1)
)
RETURNS TABLE
AS
RETURN
(
    WITH Split(stpos,endpos)
    AS(
        SELECT 0 AS stpos, CHARINDEX(@Delimiter,@String) AS endpos
        UNION ALL
        SELECT endpos+1, CHARINDEX(@Delimiter,@String,endpos+1)
            FROM Split
            WHERE endpos > 0
    )
    SELECT 'Id' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
        'Data' = SUBSTRING(@String,stpos,COALESCE(NULLIF(endpos,0),LEN(@String)+1)-stpos)
    FROM Split
)

--Criando as procedures de cada parametro. obs: para alterar os parametros é so alterar os PARxx que desejar
create procedure [dbo].[PAR12] as
with Append1 as (
select distinct
	gab_gabacsg.corte,
	gab_obracsg.acessorio_obrigatorio as acessorio
from gab_gabacsg
	inner join gab_obracsg
		on gab_gabacsg.acessorio = gab_obracsg.acessorio

union all
select corte,acessorio from gab_gabacsg
)
select distinct
	
	replace(replace(replace(GAB_ACSG.chave_busca,'<MODELO>',Append1.corte),'<COMPR>',GAB_PARAM_MED_CRT.medida),'<ANGULO>',GAB_PARAM_MED_CRT.tipo_med) as chave_busca

	
from Append1
		inner join GAB_PARAM_MED_CRT
			on Append1.corte = GAB_PARAM_MED_CRT.Corte
		inner join GAB_ACSG
			on Append1.acessorio = GAB_ACSG.acessorio
where chave_busca like '%<par12>%'

create table #marge3
(chave_busca varchar (100))
insert into #marge3
exec marge3
;
create table #ACSG_PAR2
(chave_busca varchar (100))
insert into #ACSG_PAR2 (chave_busca )
exec par2
;
create table #ACSG_PAR5
(chave_busca varchar (100))
insert into #ACSG_PAR5 (chave_busca )
exec par5
;
create table #ACSG_PAR7
(chave_busca varchar (100))
insert into #ACSG_PAR7 (chave_busca )
exec par7
;
create table #ACSG_PAR8
(chave_busca varchar (100))
insert into #ACSG_PAR8 (chave_busca )
exec par8
;
create table #ACSG_PAR9
(chave_busca varchar (100))
insert into #ACSG_PAR9 (chave_busca )
exec par9
;
create table #ACSG_PAR11
(chave_busca varchar (100))
insert into #ACSG_PAR11 (chave_busca )
exec par11
;
create table #ACSG_PAR12
(chave_busca varchar (100))
insert into #ACSG_PAR12 (chave_busca )
exec par12
;
--TABELA PAR1
	DECLARE @DelimitedString1 NVARCHAR(128)
		SET @DelimitedString1 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR1')
Create table 
	#PAR1 ( PAR1 varchar (128))
			insert into #PAR1
		SELECT 
			a.data as PAR1
		FROM dbo.split3(@DelimitedString1,'|') A			
;
-- TABELA PAR2
	DECLARE @DelimitedString2 NVARCHAR(128)
		SET @DelimitedString2 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR2')
Create table
	#PAR2 ( PAR2 varchar (128))
			insert into #PAR2
		select 
			b.data as PAR2
		from dbo.Split3(@DelimitedString2,'|') B
;
-- TABELA PAR3
	DECLARE @DelimitedString3 NVARCHAR(128)
		SET @DelimitedString3 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR3')
create table
	#PAR3 ( PAR3 varchar (128))
			insert into #PAR3
		select 
			C.data as PAR3
		from dbo.Split3(@DelimitedString3,'|') C
;
-- TABELA PAR4
	DECLARE @DelimitedString4 NVARCHAR(128)
		SET @DelimitedString4 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR4')
create table
	#PAR4 ( PAR4 varchar (128))
			insert into #PAR4
		select 
			d.data as PAR4
		from dbo.Split3(@DelimitedString4,'|') D
;
-- TABELA PAR5
	DECLARE @DelimitedString5 NVARCHAR(128)
		SET @DelimitedString5 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR5')
create table
	#PAR5 ( PAR5 varchar (128))
			insert into #PAR5
		select 
			e.data as PAR5
		from dbo.Split3(@DelimitedString5,'|') E
;
-- TABELA PAR6
	DECLARE @DelimitedString6 NVARCHAR(128)
		SET @DelimitedString6 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR6')
create table
	#PAR6 ( PAR6 varchar (128))
			insert into #PAR6
		select 
			f.data as PAR6
		from dbo.Split3(@DelimitedString6,'|') F
;
-- TABELA PAR7
	DECLARE @DelimitedString7 NVARCHAR(128)
		SET @DelimitedString7 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR7')
create table
	#PAR7 ( PAR7 varchar (128))
			insert into #PAR7
		select 
			g.data as PAR7
		from dbo.Split3(@DelimitedString7,'|') G
;
-- TABELA PAR8
	DECLARE @DelimitedString8 NVARCHAR(128)
		SET @DelimitedString8 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR8') 
create table
	#par8 ( par8 varchar (128))
			insert into #par8
		select 
			h.data as PAR8
		from dbo.Split3(@DelimitedString8,'|') H
;
-- TABELA PAR9
	DECLARE @DelimitedString9 NVARCHAR(128)
		SET @DelimitedString9 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR9')
create table
	#PAR9 ( PAR9 varchar (128))
			insert into #PAR9
		select 
			i.data as PAR9
		from dbo.Split3(@DelimitedString9,'|') I
;
-- TABELA PAR10
	DECLARE @DelimitedString10 NVARCHAR(128)
		SET @DelimitedString10 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR10')
create table
	#PAR10 ( PAR10 varchar (128))
			insert into #PAR10
		select 
			J.data as PAR10
		from dbo.Split3(@DelimitedString10,'|') J
;
-- TABELA PAR11
	DECLARE @DelimitedString11 NVARCHAR(128)
		SET @DelimitedString11 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR11')
create table
	#PAR11 ( PAR11 varchar (128))
			insert into #PAR11
		select 
			K.data as PAR11
		from dbo.Split3(@DelimitedString11,'|') K
;
-- TABELA PAR12
	DECLARE @DelimitedString12 NVARCHAR(128)
		SET @DelimitedString12 = (select distinct  lista from tblDados_projeto where grupo like 'não usar' and codigochave = 'PAR12')
create table
	#PAR12 ( PAR12 varchar (128))
			insert into #PAR12
		select 
			L.data as PAR12
		from dbo.Split3(@DelimitedString12,'|') L
;
create table #chave_busca_teste1
	(chave_busca varchar (100))
insert into #chave_busca_teste1
	select distinct replace(replace(chave_busca,'<PAR2>',#PAR2.PAR2),'<PAR8>',#par8.par8) from #ACSG_PAR2
		cross join #PAR2
		cross join #par8
			union all
	select replace(chave_busca,'<par5>',#PAR5.PAR5) from #ACSG_PAR5
		cross join #PAR5
			union all
	select replace(chave_busca,'<par7>',#PAR7.PAR7) from #ACSG_PAR7
		cross join #PAR7
			union all
	select replace(replace(chave_busca,'<par8>',#par8.par8),'<par2>',#PAR2.PAR2) from #ACSG_PAR8
		cross join #PAR2
		cross join #par8
			union all
	select replace(chave_busca,'<par9>',#PAR9.PAR9) from #ACSG_PAR9
		cross join #PAR9
			union all
	select replace(chave_busca,'<par11>',#PAR11.PAR11) from #ACSG_PAR11
		cross join #PAR11
			union all
	select replace(chave_busca,'<par12>',#PAR12.PAR12) from #ACSG_PAR12
		cross join #PAR12
;
create table #chave_busca_final
(chave_busca varchar (100))
insert into #chave_busca_final
	select * from #chave_busca_teste1 where chave_busca is not null
		union all
	select * from #marge3 where chave_busca not like '%<PAR%'
		union all
	select chave_busca from GAB_CAB
		union all
	select replace(chave_busca,'<COMPR>',GAB_PARAM_MED_CRT.medida) from GAB_CRTGAB
		inner join GAB_PARAM_MED_CRT
			on GAB_CRTGAB.codigo = GAB_PARAM_MED_CRT.Corte
;
select distinct
	#chave_busca_final.chave_busca,
	prdchb.chave_busca_montada,
	prdchb.produto,
	prdorc.descricao
from #chave_busca_final
	full outer join prdchb
		on #chave_busca_final.chave_busca = prdchb.chave_busca_montada
	left join prdorc
		on prdchb.produto = prdorc.produto