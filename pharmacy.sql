BEGIN;


CREATE TABLE IF NOT EXISTS public."Category"
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "description " character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT "Category _pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Category_pill"
(
    id integer NOT NULL,
    pill_id integer NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT "Category_pill_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Manufacturer "
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "country " character varying(40) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Manyfacturer _pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Pill"
(
    id integer NOT NULL,
    "manufacturer_id " integer NOT NULL,
    name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    price integer NOT NULL,
    CONSTRAINT "Pill_pkey" PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Category_pill"
    ADD CONSTRAINT fk_category_pill_category FOREIGN KEY (category_id)
    REFERENCES public."Category" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Category_pill"
    ADD CONSTRAINT fk_category_pill_pill FOREIGN KEY (pill_id)
    REFERENCES public."Pill" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Pill"
    ADD CONSTRAINT fk_pill_manufacturer FOREIGN KEY ("manufacturer_id ")
    REFERENCES public."Manufacturer " (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;