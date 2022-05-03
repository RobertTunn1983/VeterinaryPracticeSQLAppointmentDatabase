/*ROBERT TUNN, 2015065*/

/*HIGHLIGHT CODE FOR ANSWER BELOW AND THEN EXECUTE*/
/*IF STATEMENT MUST BE RUN TO SELECT DATABASE*/

/*If database already exists, use it*/
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'Coursework_2015065')
	BEGIN
		USE Coursework_2015065;
		PRINT 'Database Coursework_2015065 accessed'
	END

/*If it doesn't exist, don't use it*/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Coursework_2015065')
	BEGIN
		PRINT 'ERROR! Database Coursework_2015065 does not exist'
	END

/*Begin query coding*/
/**/
/*3(a) List all appointments for chihauhaus, output pet's name and breed*/
SELECT pet_name, pet_breed FROM Pets WHERE pet_breed='Chihauhau'

/*OR A MORE EXTENSIVE VERSION*/

/*Delete table on repeat execution*/
/*DROP TABLE tempTable1*/

SELECT pet_name, pet_breed
INTO tempTable1
FROM Pets 
WHERE pet_breed='Chihauhau'

SELECT Appointment.pet_name, tempTable1.pet_breed, Appointment.appointment_date_time, Appointment.appointment_room, Appointment.reason_for_visit 
FROM Appointment, tempTable1
WHERE tempTable1.pet_name = Appointment.pet_name

/*3(b) List all the appointment dates for "William" with vet Steve Rogers*/
/*Output the pet's name, appointment date and the vet's name*/

/*Delete on repeat execution*/
/*DROP TABLE tempTable2*/

SELECT Appointment.pet_name, Appointment.appointment_date_time, Appointment.vet_id
INTO tempTable2
FROM Appointment
WHERE Appointment.pet_name='William' AND Appointment.vet_id='V005'

SELECT tempTable2.pet_name, tempTable2.appointment_date_time, Vet.firstname, Vet.lastname
FROM tempTable2, Vet
WHERE tempTable2.vet_id = Vet.vet_id

/*3(c) List all appointments in January. Output the appointment, the pets name and the vet that it is with*/

/*Delete on repeat execution*/
/*DROP TABLE tempTable3*/

/*Joint appointments also outputted*/

SELECT appointment_date_time, pet_name, reason_for_visit, vet_id
INTO tempTable3
FROM Appointment
WHERE (appointment_date_time BETWEEN '2022-01-01' AND '2022-01-31')

SELECT tempTable3.appointment_date_time, tempTable3.pet_name, tempTable3.reason_for_visit, Vet.firstname, Vet.lastname
FROM tempTable3, Vet
WHERE tempTable3.vet_id = Vet.vet_id

/*3(d) List the number of appointments for every vet. Output the vet names and the total number of appointments for all the vets*/

/*Joint appointments count as one by using DISTINCT apps with same reason_for_visit count as one app*/

PRINT '';
PRINT 'Natasha Romanova has the following number of booked appointments:';
DECLARE @natashaApps INT;
SET @natashaApps = (
	SELECT COUNT (DISTINCT reason_for_visit)
	FROM Appointment
	WHERE vet_id='V001'
);
PRINT(@natashaApps);

PRINT '';
PRINT 'Bruce Banner has the following number of booked appointments:';
DECLARE @bruceApps INT;
SET @bruceApps = ( 
	SELECT COUNT (DISTINCT reason_for_visit)
	FROM Appointment
	WHERE vet_id='V002'
	);
PRINT(@bruceApps);
PRINT '';

PRINT 'Tony Stark has the following number of booked appointments:';
DECLARE @tonyApps INT;
SET @tonyApps = (
	SELECT COUNT (DISTINCT reason_for_visit)
	FROM Appointment
	WHERE vet_id='V003'
	);
PRINT(@tonyApps);

PRINT '';
PRINT 'Peter Parker has the following number of booked appointments:';
DECLARE @peterApps INT;
SET @peterApps = (
	SELECT COUNT (DISTINCT reason_for_visit)
	FROM Appointment
	WHERE vet_id='V004'
	);
PRINT(@peterApps);

PRINT '';
PRINT 'Steve Rogers has the following number of booked appointments:';
DECLARE @steveApps INT;
SET @steveApps = (
	SELECT COUNT (DISTINCT reason_for_visit)
	FROM Appointment
	WHERE vet_id='V005'
	);
PRINT(@steveApps);

/*3(e) List the pets that have multiple visits to the vet. Output all information for pets with more than 1 appointment.
This includes all their treatment information*/

/*Drop table on repeat execution*/
/*DROP TABLE tempTable4;*/

/*Create temporary table with pet_name and number of appointments where greater than 1*/
SELECT pet_name, Count(pet_name) as num_of_apps
INTO tempTable4
FROM Appointment
GROUP BY pet_name
HAVING Count (pet_name) > 1;

/*Select all columns from Treatment matching pet-name in Temp table*/
SELECT Treatment.*
FROM tempTable4, Treatment
WHERE tempTable4.pet_name = Treatment.pet_name 


/*3(f) List all pet names and owner names with annual check-ups in ascending order*/

/*Drop table on repeat execution*/
/*DROP TABLE tempTable5;*/

SELECT pet_name, owner_id, appointment_date_time
INTO tempTable5
FROM Appointment
WHERE Appointment.reason_for_visit = 'Annual Check-Up'

SELECT tempTable5.pet_name, Owner.firstname, Owner.lastname, tempTable5.appointment_date_time
FROM tempTable5, Owner
WHERE tempTable5.owner_id = Owner.owner_id
ORDER BY tempTable5.appointment_date_time



/*CLEAN UP*/
DROP TABLE Treatment;
DROP TABLE Appointment;
DROP TABLE Vet;
DROP TABLE Pets;
DROP TABLE Owner;
DROP TABLE tempTable1;
DROP TABLE tempTable2;
DROP TABLE tempTable3;
DROP TABLE tempTable4;
DROP TABLE tempTable5;
