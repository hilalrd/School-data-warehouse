SELECT
    DS.Nama AS Nama_Siswa,
    COUNT(FA.siswa_id) AS Jumlah_Kehadiran
FROM
    school_data_warehouse.Fakta_Absensi_Siswa AS FA
JOIN
    school_data_warehouse.Dim_Siswa AS DS ON FA.siswa_id = DS.Siswa_ID
WHERE
    FA.status_kehadiran = 'Hadir'
GROUP BY
    DS.Nama
ORDER BY
    Jumlah_Kehadiran DESC
LIMIT 1;
