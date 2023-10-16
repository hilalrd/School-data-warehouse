-- Tabel Dimensi Siswa
CREATE TABLE dim_siswa (
    siswa_id SERIAL PRIMARY KEY,
    nama VARCHAR(255),
    tanggal_lahir DATE,
    alamat TEXT,
    nomor_telepon VARCHAR(15)
);

-- Tabel Dimensi Guru
CREATE TABLE dim_guru (
    guru_id SERIAL PRIMARY KEY,
    nama VARCHAR(255),
    mata_pelajaran VARCHAR(255)
);

-- Tabel Dimensi Mata Pelajaran
CREATE TABLE dim_mata_pelajaran (
    mata_pelajaran_id SERIAL PRIMARY KEY,
    nama_mata_pelajaran VARCHAR(255)
);