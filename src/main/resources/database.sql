CREATE TABLE users (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	username VARCHAR(32) NOT NULL,
	name VARCHAR(32) NOT NULL,
	password VARCHAR(32) NOT NULL,
	PRIMARY KEY(id, username)
);

CREATE TABLE building (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(32) NOT NULL,
	address VARCHAR(64) NOT NULL,
	style VARCHAR(32) NOT NULL,
	color VARCHAR(9) NOT NULL,
	floors INTEGER NOT NULL,
	rooms INTEGER WITH DEFAULT 0,
	PRIMARY KEY(id),
	CHECK(style in('Suite', 'Community', 'Single User Private Bathroom'))
);

CREATE TABLE camp (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(32) NOT NULL,
	startDate VARCHAR(32) NOT NULL,
	endDate VARCHAR(32) NOT NULL,
	contactName VARCHAR(32) NOT NULL,
	contactPhone VARCHAR(32) NOT NULL,
	contactEmail VARCHAR(32) NOT NULL,
	numberOfCampers INTEGER NOT NULL WITH DEFAULT 0,
	buildingId INTEGER REFERENCES building(id),
	description VARCHAR(1200),
	PRIMARY KEY(id)
);

CREATE TABLE room (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	buildingId INTEGER NOT NULL REFERENCES building(id),
	roomNumber VARCHAR(12) NOT NULL,
	keyNumber VARCHAR(12) NOT NULL UNIQUE,
	maxOccupancy INTEGER WITH DEFAULT 2,
	PRIMARY KEY(id)
);

CREATE TABLE assignment (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	campId INTEGER NOT NULL REFERENCES camp(id),
	buildingId INTEGER NOT NULL REFERENCES building(id),
	roomId INTEGER NOT NULL REFERENCES room(id),
	name VARCHAR(32),
	PRIMARY KEY(id)
);

INSERT INTO users (username, name, password)
VALUES
	('admin', 'Administrator', 'adminpass');

INSERT INTO building (name, address, style, floors, rooms, color)
VALUES
	('Hammons', '1001 E Harrison St, Springfield, MO 65807', 'Suite', 8, 250, '#DC143C'),
	('Hutchens', '1021 E Harrison St, Springfield, MO 65807', 'Suite', 8, 250, '#FF7F50'),
	('Scholars', '1116 E Cherry St, Springfield, MO 65807', 'Suite', 3, 30, '#8A2BE2'),
	('Woods', '1115 Bear Blvd, Springfield, MO 65807', 'Single User Private Bathroom', 10, 140, '#00FFF'),
	('Wells', '1132 E Madison St, Springfield, MO 65807', 'Community', 5, 220, '#F0F8FF'),
	('Blair-Shannon', '1001 E Madison St, Springfield, MO 65807', 'Suite', 9, 380, '#00BFFF'),
	('Freddy', '1000 E Madison St, Springfield, MO 65807', 'Community', 5, 340, '#20B2AA');

INSERT INTO camp (name, startDate, endDate, contactName, contactPhone, contactEmail, numberOfCampers, buildingId, description)
VALUES
	('Camp A', '2020-04-08', '2020-04-12', 'Contact A', '(111) 111-1111', 'contact1@gmail.com', 10, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet risus nullam eget felis eget. Cras fermentum odio eu feugiat pretium nibh. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. Facilisis leo vel fringilla est ullamcorper.'),
	('Camp B', '2020-04-09', '2020-04-10', 'Contact B', '(222) 222-2222', 'contact2@gmail.com', 10, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac placerat vestibulum lectus mauris. Potenti nullam ac tortor vitae purus faucibus ornare suspendisse sed. Vel pharetra vel turpis nunc eget lorem. Ut etiam sit amet nisl purus in mollis nunc sed.'),
	('Camp C', '2020-04-11', '2020-05-02', 'Contact C', '(333) 333-3333', 'contact3@gmail.com', 10, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mattis nunc sed blandit libero volutpat. Amet consectetur adipiscing elit duis tristique. Egestas diam in arcu cursus euismod quis viverra. Faucibus interdum posuere lorem ipsum dolor sit.');
	
INSERT INTO room (buildingId, roomNumber, keyNumber, maxOccupancy)
VALUES
-- Hammons
	(1, '101A', '1-133', 2),
	(1, '101B', '1-427', 2),
	(1, '102A', '1-295', 2),
	(1, '102B', '1-210', 2),
	(1, '103A', '1-443', 2),
	(1, '103B', '1-214', 2),
	(1, '104A', '1-664', 2),
	(1, '104B', '1-456', 2),
	(1, '105A', '1-142', 2),
	(1, '105B', '1-093', 2),
-- Hutchens
	(2, '201A', '2-133', 2),
	(2, '201B', '2-427', 2),
	(2, '202A', '2-295', 2),
	(2, '202B', '2-210', 2),
	(2, '203A', '2-443', 2),
	(2, '203B', '2-214', 2),
	(2, '204A', '2-664', 2),
	(2, '204B', '2-456', 2),
	(2, '205A', '2-142', 2),
	(2, '205B', '2-093', 2),
-- Scholars
	(3, '301A', '3-133', 2),
	(3, '301B', '3-427', 2),
	(3, '302A', '3-295', 2),
	(3, '302B', '3-210', 2),
	(3, '303A', '3-443', 2),
	(3, '303B', '3-214', 2),
	(3, '304A', '3-664', 2),
	(3, '304B', '3-456', 2),
	(3, '305A', '3-142', 2),
	(3, '305B', '3-093', 2),
-- Woods
	(4, '101', '4-133', 2),
	(4, '201', '4-427', 2),
	(4, '302', '4-295', 2),
	(4, '402', '4-210', 2),
	(4, '503', '4-443', 2),
	(4, '604', '4-214', 2),
	(4, '704', '4-664', 2),
	(4, '804', '4-456', 2),
	(4, '905', '4-142', 2),
	(4, '906', '4-093', 2),
-- Wells
	(5, '301', '5-133', 2),
	(5, '302', '5-427', 2),
	(5, '303', '5-295', 2),
	(5, '304', '5-210', 2),
	(5, '305', '5-443', 2),
	(5, '306', '5-214', 2),
	(5, '307', '5-664', 2),
	(5, '308', '5-456', 2),
	(5, '309', '5-142', 2),
	(5, '111', '5-093', 2),
-- Blair-Shannon
	(6, '201A', '6-133', 2),
	(6, '201B', '6-427', 2),
	(6, '201C', '6-295', 2),
	(6, '302A', '6-210', 2),
	(6, '302B', '6-443', 2),
	(6, '302C', '6-214', 2),
	(6, '402A', '6-664', 2),
	(6, '402B', '6-456', 2),
	(6, '402C', '6-142', 2),
	(6, '502A', '6-093', 2),
-- Freddy
	(7, '205', '7-133', 2),
	(7, '207', '7-427', 2),
	(7, '209', '7-295', 2),
	(7, '211', '7-210', 2),
	(7, '213', '7-443', 2),
	(7, '215', '7-214', 2),
	(7, '217', '7-664', 2),
	(7, '219', '7-456', 2),
	(7, '221', '7-142', 2),
	(7, '223', '7-093', 2);
	
INSERT INTO assignment (campId, buildingId, roomId, name)
VALUES
	(1, 5, 51, 'Netti Constable');
	--(2, 7, 71, 'Turner Dredge'), 
--	(2, 7, 72, 'Jemimah Brookzie'), 
--	(3, 6, 61, 'Sallyann Parkinson'), 
--	(2, 7, 73, 'Casandra Grouen'), 
--	(1, 5, 52, 'Sauveur Chastagnier'), 
--	(3, 6, 62, 'Arlana Jeffcoat'), 
--	(3, 6, 63, 'Bobbe Wastie'), 
--	(1, 5, 53, 'Erny Sandeford'), 
--	(1, 5, 54, 'Harald Szymanzyk'), 
--	(2, 7, 74, 'Nero Blakey'), 
--	(2, 7, 75, 'Kaia Neathway'), 
--	(3, 6, 64, 'Krissie Redwin'), 
--	(1, 5, 55, 'Yalonda Webberley'), 
--	(2, 7, 76, 'Sigismond Heal'), 
--	(1, 5, 56, 'Dion Dowles'), 
--	(3, 6, 65, 'Griffie Rodson'), 
--	(1, 5, 57, 'Lyndy Lernihan'), 
--	(3, 6, 66, 'Liane Gouldsmith'), 
--	(3, 6, 67, 'Roberta Broggio'), 
--	(1, 5, 58, 'Jarred Yakov'), 
--	(3, 6, 68, 'Kirstin Das'), 
--	(2, 7, 77, 'Brien Gouley'), 
--	(1, 5, 59, 'Margaretha Lydden'), 
--	(1, 5, 60, 'Cullie Meron'), 
--	(2, 7, 78, 'Tamarra Newgrosh'), 
--	(3, 6, 69, 'Rowen Dewar'), 
--	(3, 6, 70, 'Joy Daftor'), 
--	(2, 7, 78, 'Darice Glanvill'), 
--	(2, 7, 80, 'Michaeline Ephgrave');