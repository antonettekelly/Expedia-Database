-- QUERY | EXPEDIA
CREATE DATABASE "Table_Expedia"
USE "Table_Expedia"

-- // DROP DATABASE //
-- DROP DATABASE "Table_Expedia"

-- CREATE TABLE
-- Tabel users
CREATE TABLE users
(
 id VARCHAR(11) PRIMARY KEY,
 name VARCHAR(50) NOT NULL,
 password VARCHAR(255) NOT NULL,
 email VARCHAR(50) NOT NULL,
 role CHAR(10) NOT NULL,
 join_date DATE
);

-- Tabel daftar_alamat_pengirim
CREATE TABLE daftar_alamat_pengirim
(
 id_alamatpengirim VARCHAR(11) PRIMARY KEY,
 nama VARCHAR(50) NOT NULL,
 telpon VARCHAR(20) NOT NULL,
 alamat_lengkap VARCHAR(250) NOT NULL,
 provinsi VARCHAR(30) NOT NULL,
 kota VARCHAR(30) NOT NULL,
 kodepos INT NOT NULL,
 latitude FLOAT NOT NULL,
 longtitude FLOAT NOT NULL,
 notes_tambahan VARCHAR(250) NOT NULL
);

 -- Tabel daftar_alamat_penerima
CREATE TABLE daftar_alamat_penerima
(
 id_alamatpenerima VARCHAR(11) PRIMARY KEY,
 nama VARCHAR(50) NOT NULL,
 telpon VARCHAR(20) NOT NULL,
 alamat_lengkap VARCHAR(250) NOT NULL,
 provinsi VARCHAR(30) NOT NULL,
 kota VARCHAR(30) NOT NULL,
 kodepos INT NOT NULL,
 latitude FLOAT NOT NULL,
 longtitude FLOAT NOT NULL,
 notes_tambahan VARCHAR(250) NOT NULL
);

-- TABEL transaksi_paket
CREATE TABLE transaksi_paket
(
 id_transaksi VARCHAR(11) PRIMARY KEY,
 id_pengirim VARCHAR(11) NOT NULL
 CONSTRAINT FK_transaksi_paket_id_pengirim REFERENCES daftar_alamat_pengirim(id_alamatpengirim),
 id_penerima VARCHAR(11) NOT NULL
 CONSTRAINT FK_transaksi_paket_id_penerima REFERENCES daftar_alamat_penerima(id_alamatpenerima),
 id_user VARCHAR(11) NOT NULL
 CONSTRAINT FK_transaksi_paket_id_user REFERENCES users(id),
 nama_barang VARCHAR(30) NOT NULL,
 kuantitas INT NOT NULL,
 unit_paket INT NOT NULL,
 berat DECIMAL(15,2) NOT NULL,
 fragile INT NOT NULL,
 asuransibarang INT NOT NULL,
 tipe_pengambilan VARCHAR(20) NOT NULL,
 jarak DECIMAL(15,2) NOT NULL,
 harga DECIMAL(15,3) NOT NULL,
 status_paket VARCHAR(50) NOT NULL,
 tanggal_pickup DATE,
 tanggal_deliveredtopost DATE,
 tanggal_warehousetransit DATE,
 tanggal_acceptedbykurir DATE,
 tanggal_ongoing DATE,
 tanggal_arrived DATE,
 tanggal_failed DATE
);

 -- INSERT DATA
 -- Tabel users
INSERT INTO users VALUES('US001','Abbey Heracles','abbeyh2804','abbeyhera@gmail.com','user','2021-10-03');
INSERT INTO users VALUES('US002','Klemens Rosalina','klemens0608','klemens6@gmail.com','user','2021-10-11');
INSERT INTO users VALUES('US003','Dexter Costa','dexcosta14081980','dexter.14@gmail.com','kurir','2021-09-29');
INSERT INTO users VALUES('US004','Caden Spears','spears026','cad.spears@gmail.com','user','2021-09-30');
INSERT INTO users VALUES('US005','Jody Morley','jodyyy123','jodmorley@gmail.com','user','2021-10-05');
INSERT INTO users VALUES('US006','Ervin Lamia','ervnlm1122','ervin.lamia@gmail.com','user','2021-10-06');
INSERT INTO users VALUES('US007','Marcianus Younes','marcyoun1996','marc.y@gmail.com','kurir','2021-10-10');
INSERT INTO users VALUES('US008','Morton Camillus','mortoncam00','morton.camillus@gmail.com','user','2021-10-15');
INSERT INTO users VALUES('US009','Jake Octavian','jakeoctavian1806','jakeoctaviannn@gmail.com','user','2021-10-17');
INSERT INTO users VALUES('US010','Chandra Maina','chandramainaa88','chanmania@gmail.com','user','2021-10-20');
INSERT INTO users VALUES('US011','Manila Maria','Mar12','MariaMan@gmail.com','user','2021-10-26');

-- Tabel daftar_alamat_pengirim
INSERT INTO daftar_alamat_pengirim VALUES('AD001','Abbey Heracles','081287390467',
'Jalan Taman Patra Kuningan No. 4, Kuningan Timur, Kuningan, Jakarta Selatan, DKI Jakarta - Indonesia 12114','DKI Jakarta',
'Jakarta Selatan',12114,-6.261493,106.834570,'Lokasi tepi jalan');

INSERT INTO daftar_alamat_pengirim VALUES('AD002','Marcianus Younes','0811965582',
'Jalan Iskander Muda No. 11, Sungai Asam, Pasar Jambi, Jambi, Jambi - Indonesia 36134','Jambi',
'Jambi',36134,-1.597980,103.616190,'-');

INSERT INTO daftar_alamat_pengirim VALUES('AD003','Chandra Maina','082188396471',
'Jalan Jenderal Ahmad Yani No. 6, Jaruju, Tatah Makmur, Banjar, Kalimantan Selatan - Indonesia 70650','Kalimantan Selatan',
'Banjar',70650,-3.401390,114.641520,'Sebelah Alfamart KM17');

-- // UPDATE DATA //
-- UPDATE daftar_alamat_pengirim
-- SET provinsi = 'DKI Jakarta'
-- WHERE id_alamatpengirim = 'AD001';

-- Tabel daftar_alamat_penerima
INSERT INTO daftar_alamat_penerima VALUES('AP001','Klemens Rosalina','08119733086',
'Jalan H. M. Kasim No. 9, Baji Pamai, Maros Baru, Maros, Sulawesi - Indonesia 90516','Sulawesi Selatan','Maros',90516,
-5.005840,119.574310,'Seberang Museum Maros');

INSERT INTO daftar_alamat_penerima VALUES('AP002','Jody Morley','036193065811',
'Jalan Teureundam No. 3, Kubu, Arongan Lambalek, Aceh Barat, Aceh - Indonesia 23652','Aceh','Aceh Barat',23652,
4.140620,96.160560,'Rumah di sebelah kiri jembatan besi');

INSERT INTO daftar_alamat_penerima VALUES('AP003','Morton Camillus','082182496204',
'Jalan Hakim Samad No. 21, Antasari, Tapin Utara, Tapin, Kalimantan Selatan - Indonesia 71114','Kalimantan Selatan','Tapin',71114,
-2.935530,115.135130,'Sebelah Kantor Antasari');

INSERT INTO daftar_alamat_penerima VALUES('AP004','Jake Octavian','03613697534',
'Jalan Hanyar No. 22, Andhika, Tapin Tengah, Tapin, Kalimantan Selatan - Indonesia 71161','Kalimantan Selatan','Tapin',71161,
-2.968160,115.094540,'Lokasi rumah di tepi jalan');

-- Tabel transaksi_paket
INSERT INTO transaksi_paket VALUES('TR001','AD001','AP001','US001','Baju Y2K',2,1,1.783,0,1,'Delivered to Post',2.689,349.000,'Arrived',' ',
'2021-08-13','2021-08-13','2021-08-13','2021-08-14','2021-08-19',' ');

INSERT INTO transaksi_paket VALUES('TR002','AD002','AP002','US007','Stereo JBL',1,1,2.381,1,1,'Pickup',4.182,963.000,'Arrived','2021-09-02',
' ','2021-08-29','2021-09-01','2021-09-01','2021-09-03',' ');

INSERT INTO transaksi_paket VALUES('TR003','AD003','AP003','US010','Album K-Pop',3,1,317.9,1,1,'Delivered to Post',1.168,726.000,'Arrived',' ',
'2021-09-10','2018-09-10','2021-09-12','2021-09-13','2021-09-15',' ');

INSERT INTO transaksi_paket VALUES('TR004','AD003','AP004','US010','Mechanical Keyboard',1,1,1.649,1,1,'Pickup',418.2,963.000,'Failed','2021-09-11',
' ','2021-09-12','2021-09-15','2021-09-15',' ','2021-09-17');

-- // UPDATE DATA //
-- UPDATE transaksi_paket
-- SET harga = 1057
-- WHERE id_transaksi ='TR004';

-- SELECT DATA
SELECT * FROM users;
SELECT * FROM daftar_alamat_pengirim;
SELECT * FROM daftar_alamat_penerima;
SELECT * FROM transaksi_paket;

--QUERY 
-- Menampilkan id transaksi, nama barang yang dikirim, dan nama penerima
SELECT a.id_transaksi, a.nama_barang, b.nama AS 'Nama Penerima'
FROM transaksi_paket a JOIN daftar_alamat_penerima b 
ON a.id_penerima = b.id_alamatpenerima 
WHERE id_transaksi = 'TR001';

-- SUBQUERY
-- Menampilkan ID Pengirim, Nama Pengirim, Inisial Nama pengirim (Didapatkan dari 2 Karakter Pertama Nama Pengirim dengan format uppercase), dan TransactionCount
-- dimana didapatkan dari Banyaknya Pemesanan yang dilakukan oleh Pengirim dan Ditambahkan Kata �Transaction(s)� di Akhir.
SELECT id_alamatpengirim  'ID Pengirim', ad.nama  'Nama Pengirim', UPPER(LEFT(ad.nama, 2)) 'Inisial',
CAST((SELECT COUNT(id_transaksi) FROM transaksi_paket tp
WHERE tp.id_pengirim = ad.id_alamatpengirim) AS VARCHAR) + ' Transaksi' 'Jumlah Transaksi'
FROM daftar_alamat_pengirim ad;


-- Memperbarui (Update) Harga pada Tabel Transaksi Paket dimana Harga Barang ditambahkan dengan Harga termasuk Pajak
-- dan dimana ID Transaksi adalah 'TR003' dan Menampilkan Seluruh Kolom Tabel Transaksi Paket
BEGIN TRAN

UPDATE transaksi_paket
SET harga = harga + harga * 0.1
SELECT id_transaksi, id_user, u.name, nama_barang, harga
FROM transaksi_paket tp
JOIN users u ON tp.id_user = u.id
WHERE harga IN(SELECT harga FROM transaksi_paket
WHERE id_transaksi = 'TR003');

ROLLBACK TRAN

SELECT id_transaksi, id_user, u.name, nama_barang, harga
FROM transaksi_paket tp
JOIN users u ON tp.id_user = u.id
WHERE harga IN(SELECT harga FROM transaksi_paket
WHERE id_transaksi = 'TR003');

-- Menampilkan ID Transaksi, Nama Pengirim, Nama Penerima, Alamat Pengirim, Alamat Penerima, dan Detail Barang
SELECT tp.id_transaksi, ap.nama as 'nama pengirim', ap.alamat_lengkap, ap.telpon, ad.nama as 'nama penerima' , ad.alamat_lengkap, 
ad.telpon, tp.nama_barang, tp.berat, tp.jarak, tp.harga, tp.asuransibarang
FROM transaksi_paket tp
INNER JOIN daftar_alamat_penerima ap ON tp.id_penerima = ap.id_alamatpenerima 
INNER JOIN daftar_alamat_pengirim ad ON tp.id_pengirim = ad.id_alamatpengirim
WHERE(id_transaksi) = (SELECT id_transaksi FROM transaksi_paket tp
WHERE id_transaksi = 'TR001');


-- Tampilkan ID Transaksi, Nama Barang, dan Harga Barang (Didapatkan dengan Menambahkan Kata �Rp.� di Awal)
-- dimana Status Pengiriman tersebut selain tidak sukses atau 'Failed'
SELECT id_transaksi, u.id, ad.nama, nama_barang, 'Rp. ' + CAST(harga AS VARCHAR(20)) 'Harga Barang'
FROM transaksi_paket tp
JOIN users u ON id_user = u.id
JOIN daftar_alamat_pengirim ad ON tp.id_pengirim = ad.id_alamatpengirim 
WHERE NOT EXISTS(SELECT tp.id_transaksi
WHERE tp.status_paket = 'Failed');

-- Menampilkan ID Transaksi, ID User, Nama Pengirim, Tanggal Pickup atau Tanggal Delivered To Post, Tanggal Warehouse Transit, Tanggal Accepted by Kurir,
-- Tanggal Ongoing, Tanggal Arrived, dan Tanggal Failed dimana ID Transaksi adalah 'TR001'
SELECT id_transaksi, u.id, ad.nama, tanggal_pickup, tanggal_deliveredtopost, tanggal_warehousetransit, 
tanggal_acceptedbykurir, tanggal_ongoing, tanggal_arrived, tanggal_failed 
FROM transaksi_paket tp
JOIN users u ON tp.id_user = u.id
JOIN daftar_alamat_pengirim ad ON tp.id_pengirim = ad.id_alamatpengirim
WHERE(id_transaksi) = (
SELECT id_transaksi 
FROM transaksi_paket tp
WHERE id_transaksi = 'TR001');


-- Menampilkan ID, Nama dan User Join Date (Ditampilkan dengan format mm-dd-yyyy) dari Tabel Users, dan TransactionCount
-- yang didapatkan dari Banyaknya Pemesanan yang dilakukan oleh Pengirim dan Ditambahkan Kata �Transaction(s)� di Akhir,
-- dimana User merupakan User Terlama (User yang sudah Lama Bergabung)
SELECT id, name, CONVERT(VARCHAR(11), join_date, 106) 'User Join Date',
CAST((SELECT COUNT(id_transaksi) FROM transaksi_paket tp
WHERE tp.id_user = u.id) AS VARCHAR) + ' Transaksi' 'Jumlah Transaksi'
FROM users u
WHERE YEAR(join_date) = (SELECT MIN(YEAR(join_date)) 
FROM users u) AND  role = 'user' 
ORDER BY join_date ASC;



-- ADVANCED QUERY
-- VIEW | Menampilkan Data User
-- Create View

CREATE VIEW show_info AS
SELECT id_transaksi, id_user, u.name, u.email, ad.telpon "Telepon Pengirim", ap.id_alamatpenerima, ap.nama, ap.telpon "Telepon Penerima"
FROM transaksi_paket tp
INNER JOIN users u ON tp.id_user = u.id
INNER JOIN daftar_alamat_pengirim ad ON tp.id_pengirim = ad.id_alamatpengirim
INNER JOIN daftar_alamat_penerima ap ON tp.id_penerima = ap.id_alamatpenerima
WHERE id_transaksi = (SELECT id_transaksi FROM transaksi_paket
WHERE id_transaksi = 'TR001');

-- Display View
SELECT * FROM show_info;


-- PROCEDURE | Menampilkan Info Transaksi
-- Create Procedure
CREATE PROCEDURE ShowInfoTrans @id_transaksi VARCHAR(11)
AS
SELECT id_transaksi, id_user, u.name, u.email, ad.telpon 'Telepon Pengirim', 
ap.id_alamatpenerima, ap.nama, ap.telpon 'Telepon Penerima'
FROM transaksi_paket tp
INNER JOIN users u ON tp.id_user = u.id
INNER JOIN daftar_alamat_pengirim ad ON tp.id_pengirim = ad.id_alamatpengirim
INNER JOIN daftar_alamat_penerima ap ON tp.id_penerima = ap.id_alamatpenerima
WHERE id_transaksi = @id_transaksi;

-- Display Data
SELECT * FROM transaksi_paket;

-- Execute Procedure
EXEC ShowInfoTrans @id_transaksi = 'TR003';


-- CURSOR | Menampilkan Data Barang
-- Declare Variable
DECLARE @nama_barang VARCHAR(30);

-- Declare Cursor
DECLARE cursor_barang CURSOR
FOR SELECT nama_barang FROM transaksi_paket;

-- Open Cursor
OPEN cursor_barang;
-- Fetch Rows
FETCH NEXT FROM cursor_barang INTO
@nama_barang;

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @nama_barang;
		FETCH NEXT FROM cursor_barang INTO
			@nama_barang
	END;

-- Close Cursor
CLOSE cursor_barang;

-- Deallocate Cursor
DEALLOCATE cursor_barang;


-- TRIGGER | Memasukkan Data Alamat Pengirim dan Alamat Penerima
-- Create Trigger

CREATE TRIGGER insert_alamat
ON daftar_alamat_pengirim
AFTER INSERT
AS
	INSERT INTO daftar_alamat_penerima
		SELECT * FROM inserted;

-- Select Data for Trigger
SELECT * FROM daftar_alamat_pengirim;
SELECT * FROM daftar_alamat_penerima;

-- Insert Data
INSERT INTO daftar_alamat_pengirim VALUES ('AD005','Manila Mania','082163995391',
'Jalan Tukad Musi No. 1, Renon, Denpasar Selatan, Denpasar, Bali - Indonesia 80226','Bali','Denpasar','80226',
-8.686110,115.240090,'Seberang Gereja Paroki Roh Kudus Katedral Denpasar');

-- Display Data
SELECT * FROM daftar_alamat_pengirim;
SELECT * FROM daftar_alamat_penerima;

-- Drop Trigger
DROP TRIGGER insert_alamat;

-- INDEX | Membuat Indeks ID Transaksi
-- Create Index
CREATE INDEX ix_transaction_id
ON transaksi_paket(id_transaksi);

-- Display Data
SELECT * FROM transaksi_paket
WHERE id_transaksi = 'TR004';

-- Drop Index
DROP INDEX transaksi_paket.ix_transaction_id;