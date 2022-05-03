/*ROBERT TUNN, 2015065*/

/*LEAVE THIS FIRST SECTION OF CODE COMMENTED OUT FOR FIRST RUN OF SCRIPT*/
/*Code for deleting tables if script ran more than once*/
/*DROP TABLE Treatment;
DROP TABLE Appointment;
DROP TABLE Vet;
DROP TABLE Pets;
DROP TABLE Owner;
*/

/*If database already exists, use it*/
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'Coursework_2015065')
	BEGIN
		USE Coursework_2015065;
	END

/*If it doesn't exist, create it*/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Coursework_2015065')
	BEGIN
		CREATE DATABASE Coursework_2015065;
	END

/*If table exists, do nothing*/
IF OBJECT_ID('Owner') IS NOT NULL
	BEGIN
		PRINT 'Owner table already exists';
	END
/*If it doesn't exist, create it*/
ELSE IF OBJECT_ID('Owner') IS NULL
	BEGIN
		PRINT 'Owner table will now be created';
		CREATE TABLE Owner (
			owner_id				NCHAR(5)		NOT NULL	PRIMARY KEY,
			firstname				NCHAR(30)		NOT NULL,	/*People first and last names are set to 30 CHARS throughout*/
			lastname				NCHAR(30)		NOT NULL,
			street_address			NCHAR(50)		NULL,		/*Maybe a homeless person has a dog..*/
			town					NCHAR(30)		NULL,		/*..so anything to do with addresses can be NULL*/
			tel						NCHAR(15)		NULL		/*Need 15 CHARS for foreign tel numbers*/		
			);							
	END

/*Make sure first CHAR of owner_id is capital letter "N"*/
ALTER TABLE Owner
    ADD CONSTRAINT uppercaseCheck CHECK (ASCII(LEFT(owner_id, 1)) = ASCII('N'));
/*Make sure last four digits of of owner_id are integers (albeit stored as chars)*/
ALTER TABLE Owner
	ADD CONSTRAINT checkNums CHECK (CAST(RIGHT(owner_id, 4) AS INT) BETWEEN 0 AND 9999);


IF OBJECT_ID('Pets') IS NOT NULL
	BEGIN
		PRINT 'Pets table already exists';
	END 
ELSE IF OBJECT_ID('Pets') IS NULL
	BEGIN
		PRINT 'Pets table will now be created';
		CREATE TABLE Pets(	
			/*Not able to assign pet_name as a primary key because pet names are not unique...*/
			/*...in any event pets are identified by their name and owner*/
			owner_id				NCHAR(5)		NOT NULL,		
			pet_name				NCHAR(20)		NOT NULL,		
			pet_age					INTEGER			NULL,			/*This may not be known*/
			pet_species				NCHAR(15)		NOT NULL,		/*Species is obvious, NOT NULL...*/
			pet_breed				NCHAR(25)		NULL			/*...whereas breed is ambiguous therefore NULL*/	
			CONSTRAINT fk_Pets_Owner FOREIGN KEY (owner_id) REFERENCES Owner(owner_id),
			);
	END

IF OBJECT_ID('Vet') IS NOT NULL
	BEGIN
		PRINT 'Vet table already exists';
	END 
ELSE IF OBJECT_ID('Vet') IS NULL
	BEGIN
		PRINT 'Vet table will now be created';	
		CREATE TABLE Vet(
			vet_id					NCHAR(4)		NOT NULL	PRIMARY KEY,		/*Nothing should be null in this table*/
			firstname				NCHAR(30)		NOT NULL,
			lastname				NCHAR(30)		NOT NULL,
			speciality				NCHAR(20)		NOT NULL
			);
	END

/*Make sure first CHAR of vet_id is capital letter "V"*/
ALTER TABLE Vet
    ADD CONSTRAINT uppercaseCheck2 CHECK (ASCII(LEFT(vet_id, 1)) = ASCII('V'));
/*Make sure last three digits of of vet_id are integers (albeit stored as chars)*/
ALTER TABLE Vet
	ADD CONSTRAINT checkNums2 CHECK (CAST(RIGHT(vet_id, 3) AS INT) BETWEEN 0 AND 999);

				
IF OBJECT_ID('Appointment') IS NOT NULL
	BEGIN
		PRINT 'Appointment table already exists';
	END 
ELSE IF OBJECT_ID('Appointment') IS NULL
	BEGIN
		PRINT 'Appontment table will now be created';
		/*No primary key required*/
		CREATE TABLE Appointment(
			pet_name				NCHAR(20)		NOT NULL,		/*Pet name set to 20 chars*/		
			owner_id				NCHAR(5)		NOT NULL,
			appointment_date_time	DATETIME		NOT NULL,		/*Needs to be formatted*/
			appointment_room		INTEGER			NULL,
			reason_for_visit		NCHAR(50)		NOT NULL,
			vet_id					NCHAR(4)		NOT NULL
			
			CONSTRAINT fk_Appointment_Owner FOREIGN KEY (owner_id) REFERENCES Owner(owner_id),
			CONSTRAINT fk_Appointment_Vet FOREIGN KEY (vet_id) REFERENCES Vet(vet_id),
			/*pet_name is not a primary key of Pets so is not a foreign key in Appointment*/
			);
		END

IF OBJECT_ID('Treatment ') IS NOT NULL
	BEGIN
		PRINT 'Treatment table already exists';
	END 
ELSE IF OBJECT_ID('Treatment ') IS NULL
	BEGIN
		PRINT 'Treatment table will now be created';
		/*No need for a primary key*/
		CREATE TABLE Treatment(
			pet_name				NCHAR(20)		NOT NULL,		/*Not unique*/
			owner_id				NCHAR(5)		NOT NULL,		/*Not unique*/
			vet_id					NCHAR(4)		NOT NULL,		/*Not unique*/
			diagnosis				NCHAR(50)		NULL,			/*Not unique*/
			treatment				NCHAR(50)		NOT NULL,		/*Not unique*/
			prescription			NCHAR(50)		NULL,			/*Not unique*/
			cost					MONEY			NOT NULL		/*Not unique*/

			CONSTRAINT fk_Treatment_Owner FOREIGN KEY (owner_id) REFERENCES Owner(owner_id),
			CONSTRAINT fk_Treatment_Vet FOREIGN KEY (vet_id) REFERENCES Vet(vet_id)
			);
	END

/*Code for displaying all tables within database*/
SELECT * FROM INFORMATION_SCHEMA.TABLES;

