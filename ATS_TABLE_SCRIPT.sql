CREATE TABLE Category
(
	categoryID varchar(10) PRIMARY KEY,
	shortDescription varchar(100)
)

CREATE TABLE EquipmentItem
	(
	itemNumber varchar(10) PRIMARY KEY, 
	name varchar(32) NOT NULL,
	serialNumber varchar(30) NOT NULL,
	dollarValue decimal(2) NULL,
	categoryID varchar(10) CONSTRAINT fk_ID REFERENCES Category(categoryID),
	keywords varchar(30) NULL,
	entryDate date NULL,
	checkoutLength int NOT NULL,
	comments text NULL,
	lost bit NULL,
	damaged bit NULL,
	stolen bit NULL,
	visible bit NULL,
	sentToSurplus bit NULL
	)

CREATE TABLE UserAccountType
(
	accountType char(2) PRIMARY KEY,
	description varchar(100)
)

CREATE TABLE ATSPersonnel
(
	atsPersonnelId varchar(12) PRIMARY KEY, 
	firstName varchar(32) NULL,
	lastName varchar(32) NULL,
	phoneNumber varchar(14) NULL,
	email varchar(32) NULL,
	userName varchar(10) NOT NULL,
	password varchar(10) NOT NULL,
	accountType char(2) CONSTRAINT fk_actTyp REFERENCES UserAccountType(accountType),
	)



CREATE TABLE Faculty
(
	eNumber varchar(9) PRIMARY KEY,
	firstName varchar(32) NOT NULL,
	lastName varchar(32) NULL,
	phoneNumber varchar(14) NULL,
	email varchar(32) NOT NULL,
	department varchar(32) NULL
	)

CREATE TABLE CheckOut
(
	facultyEnumber varchar(9) NOT NULL,
	equipmentCheckedOut varchar(10) NOT NULL,
	personnelCheckedIn varchar(12) NOT NULL,
	personnelCheckedOut varchar(12) NOT NULL,
	checkoutDate date NOT NULL,
	dateReturned date NULL,
	dueDate date NOT NULL,
	PRIMARY KEY (facultyEnumber, equipmentCheckedOut, checkOutDate),
	Foreign Key (facultyEnumber) REFERENCES Faculty(eNumber),
	Foreign Key (equipmentCheckedOut) REFERENCES EquipmentItem(itemNumber),
	Foreign Key (personnelCheckedIn) REFERENCES ATSPersonnel(atsPersonnelId),
	Foreign Key (personnelCheckedOut) REFERENCES ATSPersonnel(atsPersonnelId)
	)

CREATE TABLE Reserve
(
	facultyReservedName varchar(9) NOT NULL,
	processedBy varchar(12) NOT NULL,
	reservedItem varchar(10) NOT NULL,
	processedDate datetime  NOT NULL,
	startReserveDate date NULL,
	endReserveDate date NULL,
	PRIMARY KEY (facultyReservedName, processedBy, processedDate), 
	Foreign Key (facultyReservedName) REFERENCES Faculty(eNumber),
	Foreign Key (reservedItem) REFERENCES EquipmentItem(itemNumber),
	Foreign Key (processedBy) REFERENCES ATSPersonnel(atsPersonnelId)
)

CREATE TABLE Hold
(
	holdID varchar(8) NOT NULL,
	eNumber varchar(9) NOT NULL,
	processedBy varchar(12) NOT NULL, 
	holdedItem varchar(10) NOT NULL,
	processedDate datetime NOT NULL,
	startHoldDate date NULL,
	endHoldDate date NULL,
	PRIMARY KEY (eNumber, processedBy, processedDate),
	Foreign Key (eNumber) REFERENCES Faculty(eNumber),
	Foreign Key (holdedItem) REFERENCES EquipmentItem(itemNumber),
	Foreign Key (processedBy) REFERENCES ATSPersonnel(atsPersonnelId)
)

CREATE TABLE NewsFeed
(
	ID varchar(8) PRIMARY KEY,
	description varchar(500) NOT NULL,
	pubDate date NOT NULL,
	title varchar(100) NOT  NULL
)
