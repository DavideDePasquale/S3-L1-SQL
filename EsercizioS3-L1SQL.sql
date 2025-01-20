CREATE TABLE public.clienti(
id_cliente SERIAL NOT NULL PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
cognome VARCHAR(40) NOT NULL,
anno_di_nascita INT NOT NULL,
regione_residenza VARCHAR(30) NOT NULL
)
ALTER TABLE public.clienti RENAME COLUMN id_cliente TO numero_cliente;
INSERT INTO public.clienti(nome, cognome,anno_di_nascita,regione_residenza)
                  VALUES ('Davide', 'De Pasquale', 1998, 'Puglia'),
				         ('Carlo', 'Conti', 1950, 'Lazio'),
						 ('Filippo', 'Boesso', 1988, 'Veneto'),
						 ('Adele', 'Gropplero', 1999, 'Lazio'),
						 ('Matteo', 'Caschetto', 1998, 'Sicilia'),
						 ('Mario', 'Monti', 1938, 'Umbria'),
						 ('Giuseppe', 'Verdi', 1982, 'Molise'),
						 ('Alessandro', 'Del Piero', 1982, 'Veneto'),
						 ('Mario', 'Giordano', 1946, 'Campania'),
						 ('Rosario', 'Muniz', 1975, 'Trentino Alto Adige')
SELECT * FROM public.clienti;						 
				  
CREATE TABLE public.prodotti(
id_prodotti SERIAL NOT NULL PRIMARY KEY,
descrizione VARCHAR(100) NULL DEFAULT '',
in_produzione BOOLEAN NOT NULL,
in_commercio BOOLEAN NOT NULL,
data_attivazione DATE NOT NULL,
data_disattivazione DATE NULL DEFAULT NULL
)
DROP TABLE public.prodotti;
INSERT INTO public.prodotti(descrizione,in_produzione,in_commercio,data_attivazione, data_disattivazione)
                   VALUES ('Giocattolo Toy Story', true, true, '2015-05-20', NULL),
				          ('Pallone SuperSantos', true,true, '1999-01-01', NULL),
						  ('Barbie e Ken', false, true, '1985-04-05', '2020-01-01'),
						  ('Sapone CR7', true, true,'2007-07-07', NULL),
				          ('Occhiali ADP10', false ,true, '2005-12-03', '2024-01-23'),
						  ('Scarpe Geox', false, true, '2010-12-05','2014-11-05'),
						  ('PS4', true, true, '2009-10-07', NULL),
				          ('PS5', true,true, '2017-09-01', NULL),
						  ('XBOX 360', false, true, '2002-04-14', '2013-03-01'),
						  ('Scarpe Calcio Mercurial', false, true, '2004-08-29', '2021-11-04'),
				          ('FIFA 23', false,true, '2022-10-02', '2023-05-10'),
						  ('EA SPORTS 25', true, true, '2024-10-02',NULL),
						  ('Mouse Wireless', true, true, '2017-05-20', NULL),
				          ('Maglia Inter Stagione 24/25', true,true, '2024-07-10', NULL),
						  ('Computer Lenovo I7', true, true,'2017-05-01', NULL)
						  
SELECT * FROM public.prodotti;


CREATE TABLE public.fornitori(
numero_fornitore SERIAL NOT NULL PRIMARY KEY,
denominazione VARCHAR(50) NOT NULL,
regione_residenza VARCHAR(30) NOT NULL
)

INSERT INTO public.fornitori (denominazione,regione_residenza)
                      VALUES ('Giochi Preziosi', 'Lombardia'),
					         ('EA SPORTS', 'Piemonte'),
							 ('Bauli Pandori', 'Lombardia'),
							 ('GiocoSrl', 'Molise'),
					         ('Sony', 'Trentino Alto Adige'),
							 ('ADP Style Srl', 'Piemonte'),
							 ('Lenovo', 'Liguria'),
					         ('China srl', 'Calabria'),
							 ('Internazionale Milano Srl', 'Lombardia'),
							 ('GEOX Snc', 'Lazio'),
					         ('Adidas', 'Campania')
							 

SELECT * FROM public.fornitori;


CREATE TABLE public.fatture(
numero_fattura SERIAL NOT NULL,
tipologia VARCHAR(40) NOT NULL,
importo NUMERIC(15,2) NOT NULL,
iva INT NOT NULL,
id_cliente INT NOT NULL,
data_fattura DATE NOT NULL,
numero_del_fornitore INT NOT NULL,
CONSTRAINT numero_fattura_pkey PRIMARY KEY (numero_fattura),
CONSTRAINT fattura_id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.clienti(numero_cliente),
CONSTRAINT fattura_numero_del_fornitore_fk FOREIGN KEY (numero_del_fornitore) REFERENCES public.fornitori(numero_fornitore)
);

INSERT INTO public.fatture(tipologia,importo,iva,id_cliente,data_fattura,numero_del_fornitore)
                  VALUES ('Acquisto', 350.00, 23, 2, '2025-01-01', 3),
				         ('Acquisto', 500.00, 20, 6, '2021-10-15', 6),
						 ('Acquisto', 55.75, 20, 9, '2006-06-15', 1),
				         ('Acquisto', 1500.99, 23, 1, '2024-08-02', 5),
						 ('Acquisto', 99.99, 20, 3, '2009-11-01', 2),
				         ('Acquisto', 125.07, 22, 8, '2017-01-11', 8),
						 ('Acquisto', 550.55, 22, 10, '2017-01-05', 11),
				         ('Acquisto', 1500.99, 23, 4, '2009-04-12', 10)
						 
SELECT * FROM public.fatture;				          


--ESERCIZIO 1
SELECT*FROM public.clienti WHERE nome = 'Mario';
--ESERCIZIO 2
SELECT*FROM public.clienti WHERE anno_di_nascita = 1982;
--ESERCIZIO 3
SELECT*FROM public.fatture WHERE iva = 20;
--ESERCIZIO 4
SELECT*FROM public.prodotti WHERE EXTRACT (YEAR FROM data_attivazione) = 2017;
--ESERCIZIO 5
SELECT*FROM public.fatture WHERE importo < 1000;
--ESERCIZIO 6
SELECT*FROM public.fatture a inner join public.fornitori
















