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
