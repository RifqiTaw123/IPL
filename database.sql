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

INSERT INTO Bank  (Kode_Bank, Nama_Bank, Alamat)
VALUES ("B001","GangBank Bandung","Bandung"),
	("B002","GangBank Jogjakarta","Jogjakarta"),
	("B003","GangBank Jakarta","jakarta"),
	("B004","GangBank Semarang","Semarang"),
	("B005","GangBank Cilegon","Cilegon"),
	("B006","GangBank Bali","Bali"),
	("B007","GangBank Malang","Malang"),
	("B008","GangBank Bogor","Bogor"),
	("B009","GangBank Bekasi","Bekasi"),
	("B010","GangBank Tanggerang","Tanggerang");

INSERT INTO Rekening  (No_Rekening, Kode_Bank, Saldo)
VALUES ("666256111","B001",1000000),
	("666256112","B002",1500000),
	("666256113","B001",1000000000),
	("666256114","B002",2000000),
	("666256115","B003",3500000),
	("666256116","B001",2360000),
	("666256117","B005",7500000),
	("666256118","B008",10000000),
	("666256119","B007",15000000),
	("666256120","B010",500000);

INSERT INTO Nasabah (Id_Nasabah, No_Rekening, Nama, No_HP, Alamat)
VALUES  ("N671001","666256111","Lukman","08777123666","sukabirus"),
        ("N671002","666256112","Dandi","087771234267","sukapura"),
        ("N671003","666256113","Khairul","08777123454","bojongsoang"),
        ("N671004","666256114","Fikhri","08777127866","dayeuhkolot"),
        ("N671005","666256115","Rifqi","08777123655","sukapura"),
        ("N671006","666256116","Taufik","08777111666","cicaheum"),
        ("N671007","666256117","Siti","08777123897","cimahi"),
        ("N671008","666256118","Diah","08777153666","lembang"),
        ("N671009","666256119","Brenda","08777120886","buah batu"),
        ("N671010","666256120","Amel","08777123098","citeureup");

INSERT INTO Akun (Id_Nasabah, Username, Password)
VALUES  ("N671001","Lukman123","sandilukman"),
        ("N671002","Dandi123","sandidandi"),
        ("N671003","Khairul123","sandikhairul"),
        ("N671004","Fikhri123","sandifikhri"),
        ("N671005","Rifqi123","sandirifqi"),
        ("N671006","Taufik123","sanditaufik"),
        ("N671007","Siti123","sandisiti"),
        ("N671008","Diah123","sandidiah"),
        ("N671009","Brenda123","sandibrenda"),
        ("N671010","Amel123","sandiamel");

INSERT INTO Admin (Id_Admin, Nama_Admin, Alamat)
VALUES ("A001","admin 1","bandung"),
	("A002","admin 2","jakarta"),
	("A003","admin 3","surabaya"),
	("A004","admin 4","Jogjakarta"),
	("A005","admin 5","Bekasi"),
	("A006","admin 6","Depok"),
	("A007","admin 7","Semarang"),
	("A008","admin 8","Padang"),
	("A009","admin 9","Aceh"),
	("A010","admin 10","Bengkulu");
