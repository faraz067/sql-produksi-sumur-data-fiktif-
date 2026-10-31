# sql-produksi-sumur-data-fiktif-
# Proyek SQL: Laporan Produksi Tiga Hari
## Tujuan
Menjawab pertanyaan bisnis tentang produksi minyak per sumur dan lapangan
dengan SQL (data fiktif untuk latihan).
## Data
Tiga tabel: produksi_sumur (30 baris), sumur_info (10 baris),
lapangan_info (4 baris). Semua data fiktif.
## Teknik yang dipakai
GROUP BY dan HAVING, CASE WHEN, JOIN (INNER dan LEFT), subquery,
CTE, window function (ROW_NUMBER, RANK, SUM OVER, LAG).

## Temuan
- Total produksi turun dari 895 bbl (1 Okt) menjadi 766 bbl (2 Okt).
- Sumur BKP-002 tidak berproduksi selama tiga hari berturut-turut.
- Data air_bbl untuk BGK-001 kosong, dan BGK-002 belum ada di sumur_info.
