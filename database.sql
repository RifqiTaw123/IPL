CREATE TABLE Bank (
	Kode_Bank varchar(50) NOT NULL,
	Nama_Bank varchar(50) NOT NULL,
	Alamat varchar(50) NOT NULL,
	PRIMARY KEY (Kode_Bank)
);

CREATE TABLE Rekening (
	No_Rekening varchar(20) NOT NULL,
	Kode_Bank varchar(50) NOT NULL,
	Saldo int NOT NULL,
	PRIMARY KEY (No_Rekening),
	CONSTRAINT bank_rel FOREIGN KEY (Kode_Bank) REFERENCES Bank(Kode_Bank)
);

CREATE TABLE Nasabah (
	Id_Nasabah varchar(50) NOT NULL,
	No_Rekening varchar(20) NOT NULL,
	Nama varchar(100) NOT NULL,
	No_HP varchar(12) NOT NULL,
	Alamat varchar(100) NOT NULL,
	PRIMARY KEY (Id_Nasabah),
	CONSTRAINT nasa_rek FOREIGN KEY (No_Rekening) REFERENCES Rekening(No_Rekening)
);

CREATE TABLE Akun(
	Id_Nasabah varchar(50) NOT NULL,
	Username varchar(50) NOT NULL,
	Password varchar(50) NOT NULL,
	PRIMARY KEY (Username),
	CONSTRAINT akun_nas FOREIGN KEY (Id_Nasabah) REFERENCES Nasabah(Id_Nasabah)
);

CREATE TABLE Admin (
	Id_Admin varchar(50) NOT NULL,
	Nama_Admin varchar(100) NOT NULL,
	Alamat varchar(50) NOT NULL,
	PRIMARY KEY (Id_Admin)
);

CREATE TABLE Transaksi (
	No_Transaksi varchar(20) NOT NULL,
	Id_Nasabah varchar(50) NOT NULL,
	Id_Admin varchar(50) NOT NULL,
	Tanggal Date NOT NULL,
	Nominal int NOT NULL,
	PRIMARY KEY (No_Transaksi),
	CONSTRAINT trans_nas FOREIGN KEY (Id_Nasabah) REFERENCES  Nasabah(Id_Nasabah),
	CONSTRAINT trans_admin FOREIGN KEY (Id_Admin) REFERENCES Admin(Id_Admin)
);

CREATE TABLE Transfer (
	No_Transaksi varchar(20) NOT NULL,
    Rek_Tujuan varchar(20) NOT NULL,
	CONSTRAINT Trans_tr FOREIGN KEY (No_Transaksi) REFERENCES Transaksi(No_Transaksi)
);

CREATE TABLE Virtual_Akun (
    No_Transaksi varchar(20) NOT NULL,
	Rek_Virtual  varchar(20) NOT NULL,
	CONSTRAINT Trans_vir FOREIGN KEY (No_Transaksi) REFERENCES Transaksi(No_Transaksi)
);
