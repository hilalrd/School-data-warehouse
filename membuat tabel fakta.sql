-- Tabel Fakta Absensi Siswa
CREATE TABLE fakta_absensi_siswa (
    siswa_id INT REFERENCES dim_siswa(siswa_id),
    guru_id INT REFERENCES dim_guru(guru_id),
    mata_pelajaran_id INT REFERENCES dim_mata_pelajaran(mata_pelajaran_id),
    status_kehadiran VARCHAR(10),
	tanggal DATE,
    PRIMARY KEY (siswa_id, guru_id, mata_pelajaran_id, tanggal_id)
);