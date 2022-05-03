/*ROBERT TUNN, 2015065*/

USE Coursework_2015065
Go

/* Populate Owners table */
/*owner-id, firstname, lastname, street-address, town, tel*/
INSERT INTO Owner
VALUES ('N0001', 'Simon', 'Blackquill', '87 Elpis Drive', 'Aberdeen', '01224 496476');
INSERT INTO Owner
VALUES ('N0002', 'Phoenix', 'Wright', '3 Ishgard Close', 'Aberdeen', '01224 496390');
INSERT INTO Owner
VALUES ('N0003', 'Athena', 'Cykes', '23 Thavnair Road', 'Inverurie', '01224 496180');
INSERT INTO Owner
VALUES ('N0004', 'Maya', 'Fey', '11 Sharlayan Street', 'Dyce', '01224 496853');
INSERT INTO Owner
VALUES ('N0005', 'Miles', 'Edgeworth', '57 Tempest Avenue', 'Westhill', '01224 496398');
INSERT INTO Owner
VALUES ('N0006', 'Franziska', 'von Karma', '8 Amaurot Lane', 'Portlethen', '01224 496094');

/*Check that ALTER TABLE CONSTRAINT TO FISH OUT NON CAPITAL N FOR CHAR 1 is working*/
/*INSERT INTO Owner
VALUES ('n0001', 'Chesney', 'Hawkes', '87 Elpis Drive', 'Aberdeen', '01224 496476');
*/

/*Check that ALTER TABLE CONSTRAINT TO check that last four chars of user_id are all integers is working*/
/*INSERT INTO Owner
VALUES ('N0!01', 'Chesney', 'Hawkes', '87 Elpis Drive', 'Aberdeen', '01224 496476');
*/


/* Populate Pets table */
/*owner-id, pet_name, pet_age, pet_species, pet_breed*/
INSERT INTO Pets
VALUES ('N0001', 'Rory', 9, 'Cat', 'Ragdoll');
INSERT INTO Pets
VALUES ('N0001', 'Hades', 14, 'Cat', 'Persian');
INSERT INTO Pets
VALUES ('N0002', 'Maddie', 11, 'Dog', 'Chihauhau');
INSERT INTO Pets
VALUES ('N0002', 'Wease', 11, 'Dog', 'Chihauhau');
INSERT INTO Pets
VALUES ('N0002', 'Phoebe', 1, 'Dog', 'Chihauhau');
INSERT INTO Pets
VALUES ('N0003', 'Chip', 3, 'Guinea Pig', NULL);
INSERT INTO Pets
VALUES ('N0003', 'Dale', 3, 'Guinea Pig', NULL);
INSERT INTO Pets
VALUES ('N0004', 'Evie', 5, 'Cat', 'Tortoiseshell');
INSERT INTO Pets
VALUES ('N0004', 'Izzy', 3, 'Cat', 'Tortoiseshell');
INSERT INTO Pets
VALUES ('N0005', 'Henry', 4, 'Dog', 'Husky');
INSERT INTO Pets
VALUES ('N0006', 'William', 4, 'Horse', 'Appaloosa');

/* Populate Vet table */
/*vet-id, firstname, lastname, speciality*/
INSERT INTO Vet
VALUES ('V001','Natasha','Romanova','Feline');
INSERT INTO Vet
VALUES ('V002','Bruce','Banner','Dentistry');
INSERT INTO Vet
VALUES ('V003','Tony','Stark','Canine');
INSERT INTO Vet
VALUES ('V004','Peter','Parker','Small Animal Care');
INSERT INTO Vet
VALUES ('V005','Steve','Rogers','Equine');

/* Populate Appointment table */
/*pet_name, owner-id, appointment_date_time, appointment_room, reason_for_visit, vet_id*/
INSERT INTO Appointment
/*DATE TIME format 20220111 is 11 Jan 2022*/
VALUES ('Rory','N0001','20220111',4,'Injured from cat fight','V001');
INSERT INTO Appointment
VALUES ('Hades','N0001','20220115',5,'Vaccinations','V001');
INSERT INTO Appointment
VALUES ('Maddie','N0002','20220110',2,'Annual Check-Up','V002');
INSERT INTO Appointment
VALUES ('Wease','N0002','20220110',2,'Annual Check-Up','V002');
INSERT INTO Appointment
VALUES ('Phoebe','N0002','20220202',1,'Puppy Check-Up','V003');
INSERT INTO Appointment
VALUES ('Chip','N0003','20220105',3,'Not Eating','V004');
INSERT INTO Appointment
VALUES ('Dale','N0003','20220105',3,'Not Eating','V004');
INSERT INTO Appointment
VALUES ('Evie','N0004','20220111',3,'Car Accident','V001');
INSERT INTO Appointment
VALUES ('Evie','N0004','20220208',3,'Follow-Up','V001');
INSERT INTO Appointment
VALUES ('Izzy','N0004','20220208',3,'Follow-Up','V001');
INSERT INTO Appointment
VALUES ('Henry','N0005','20211226',2,'Ate Chocolate','V003');
INSERT INTO Appointment
VALUES ('William','N0006','20220127',1,'Vaccinations','V005');
INSERT INTO Appointment
VALUES ('William','N0006','20220203',1,'Injury','V005');
INSERT INTO Appointment
VALUES ('William','N0006','20220207',1,'Follow-Up','V005');

/* Populate Treatment table */
/*pet_name, owner_id, vet_id, diagnosis, treatment, prescription, cost*/
INSERT INTO Treatment
VALUES ('Rory', 'N0001', 'V001', 'Scratches and wounds','Antibiotics and stitches','Painkillers', 150);
INSERT INTO Treatment
VALUES ('Hades', 'N0001', 'V001', NULL, 'Vaccinations', NULL, 50);
INSERT INTO Treatment
VALUES ('Maddie', 'N0002', 'V002', NULL, 'Clean Teeth', NULL, 100);
INSERT INTO Treatment
VALUES ('Wease', 'N0002', 'V002', NULL, 'Clean Teeth', NULL, 100);
INSERT INTO Treatment
VALUES ('Phoebe', 'N0002', 'V003', NULL, 'Vaccinations, Flea and Wormer', NULL, 80);
INSERT INTO Treatment
VALUES ('Chip', 'N0003', 'V004', 'Fussy', 'Offer different food', NULL, 30);
INSERT INTO Treatment
VALUES ('Dale', 'N0003', 'V004', 'Fussy', 'Offer different food', NULL, 30);
INSERT INTO Treatment
VALUES ('Evie', 'N0004', 'V001', 'Broken Leg', 'Surgery and Rest', 'Painkillers and Cone for Head', 450);
INSERT INTO Treatment
VALUES ('Evie', 'N0004', 'V001', 'Healing Well', 'Continue Treatment Plan', NULL, 30);
INSERT INTO Treatment
VALUES ('Izzy', 'N0004', 'V001', 'Healing Well', 'Continue Treatment Plan', NULL, 30);
INSERT INTO Treatment
VALUES ('Henry', 'N0005', 'V003', 'Chocolate Poisoning', 'Stomach Pumped', 'Painkillers and laxatives', 300);
INSERT INTO Treatment
VALUES ('William', 'N0006', 'V005', NULL, 'Vaccinations', NULL, 75);
INSERT INTO Treatment
VALUES ('William', 'N0006', 'V005', 'Kicked, caused lameness', 'Box Rest', 'Painkillers', 85);
INSERT INTO Treatment
VALUES ('William', 'N0006', 'V005', 'Healed', 'Back to Usual Management', NULL, 60);




