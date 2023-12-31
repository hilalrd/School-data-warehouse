-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.dim_guru
(
    guru_id integer NOT NULL,
    nama character varying(100) COLLATE pg_catalog."default",
    alamat character varying(255) COLLATE pg_catalog."default",
    informasi_kontak text COLLATE pg_catalog."default",
    CONSTRAINT dim_guru_pkey PRIMARY KEY (guru_id)
);

CREATE TABLE IF NOT EXISTS public.dim_kelas
(
    kelas_id integer NOT NULL,
    nama_kelas character varying(50) COLLATE pg_catalog."default",
    tingkat_kelas integer,
    wali_kelas text COLLATE pg_catalog."default",
    CONSTRAINT dim_kelas_pkey PRIMARY KEY (kelas_id)
);

CREATE TABLE IF NOT EXISTS public.dim_matapelajaran
(
    matapelajaran_id integer NOT NULL,
    mata_pelajaran character varying(100) COLLATE pg_catalog."default",
    guru_pengajar integer,
    CONSTRAINT dim_matapelajaran_pkey PRIMARY KEY (matapelajaran_id)
);

CREATE TABLE IF NOT EXISTS public.dim_siswa
(
    siswa_id integer NOT NULL,
    nama character varying(100) COLLATE pg_catalog."default",
    alamat character varying(255) COLLATE pg_catalog."default",
    tanggal_lahir date,
    kontak_darurat text COLLATE pg_catalog."default",
    CONSTRAINT dim_siswa_pkey PRIMARY KEY (siswa_id)
);

CREATE TABLE IF NOT EXISTS public.pencapaianakademik
(
    pelaporan_id integer NOT NULL,
    guru_id integer NOT NULL,
    kelas_id integer NOT NULL,
    siswa_id integer NOT NULL,
    matapelajaran_id integer NOT NULL,
    tanggalpelaporan date NOT NULL,
    nilaiakademik numeric(5, 2) NOT NULL,
    PRIMARY KEY (pelaporan_id)
);

ALTER TABLE IF EXISTS public.dim_matapelajaran
    ADD CONSTRAINT dim_matapelajaran_guru_pengajar_fkey FOREIGN KEY (guru_pengajar)
    REFERENCES public.dim_guru (guru_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.pencapaianakademik
    ADD FOREIGN KEY (guru_id)
    REFERENCES public.dim_guru (guru_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pencapaianakademik
    ADD FOREIGN KEY (kelas_id)
    REFERENCES public.dim_kelas (kelas_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pencapaianakademik
    ADD FOREIGN KEY (siswa_id)
    REFERENCES public.dim_siswa (siswa_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pencapaianakademik
    ADD FOREIGN KEY (matapelajaran_id)
    REFERENCES public.dim_matapelajaran (matapelajaran_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;