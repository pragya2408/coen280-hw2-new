
CREATE TABLE YelpUser(YELP_ID VARCHAR(15) NOT NULL PRIMARY KEY,
Email VARCHAR(35) NOT NULL,
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
DOB DATE,
BirthPlace VARCHAR(2) DEFAULT 'NA',
Gender VARCHAR(1),
CONSTRAINT user_info UNIQUE(YELP_ID, Email));

CREATE TABLE YelpBusiness(
Business_Id VARCHAR(15) NOT NULL PRIMARY KEY,
B_Name VARCHAR(40),
S_Address VARCHAR(100) NOT NULL,
City VARCHAR(30) NOT NULL,
State VARCHAR(2) NOT NULL,
Zipcode INTEGER NOT NULL,
DOO VARCHAR(40),
Ambient VARCHAR(15),
CONSTRAINT business_info UNIQUE(S_Address, City, State, Zipcode));

CREATE TABLE Checkin(
C_ID INTEGER NOT NULL,
INFO VARCHAR(30),
BUSN_ID VARCHAR(15),
CONSTRAINT B_ID
	FOREIGN KEY(BUSN_ID)
	REFERENCES YelpBusiness(Business_Id)
	ON DELETE CASCADE
);

CREATE TABLE Friendlist(
YELP_ID VARCHAR(15) NOT NULL,
Friends VARCHAR(15) NOT NULL,
Complimented VARCHAR(3) DEFAULT 'N/A',
CONSTRAINT user_id
	FOREIGN KEY(YELP_ID)
	REFERENCES YelpUser(YELP_ID)
	ON DELETE CASCADE
);

CREATE TABLE Reviews(
REVIEW_ID VARCHAR(30) NOT NULL PRIMARY KEY,
Stars INTEGER DEFAULT '0',
Author VARCHAR(15) NOT NULL,
Publish_Date TIMESTAMP NOT NULL,
BUSINESS_ID VARCHAR(30) NOT NULL,
FOREIGN KEY (Author) REFERENCES YelpUser(YELP_ID)
);
ALTER TABLE Reviews
ADD CONSTRAINT auth FOREIGN KEY (BUSINESS_ID) REFERENCES YelpBusiness(Business_Id) ON DELETE CASCADE;
ALTER TABLE Reviews
ADD CONSTRAINT keys UNIQUE(Author,BUSINESS_ID);

CREATE TABLE Votefunny(
REVIEW_ID VARCHAR(20) NOT NULL,
BUSINESS_ID VARCHAR(30) NOT NULL,
FVotes INTEGER DEFAULT 0
);
ALTER TABLE Votefunny
ADD CONSTRAINT freview FOREIGN KEY(REVIEW_ID) REFERENCES Reviews(REVIEW_ID) ON DELETE CASCADE;
ALTER TABLE Votefunny
ADD CONSTRAINT fbusiness FOREIGN KEY(BUSINESS_ID) REFERENCES YelpBusiness(Business_Id) ON DELETE CASCADE;

CREATE TABLE VoteCool(
REVIEW_ID VARCHAR(20) NOT NULL PRIMARY KEY,
BUSINESS_ID VARCHAR(30) NOT NULL,
CVotes INTEGER DEFAULT 0
);
ALTER TABLE VoteCool
ADD CONSTRAINT creview FOREIGN KEY(REVIEW_ID) REFERENCES Reviews(REVIEW_ID) ON DELETE CASCADE;
ALTER TABLE VoteCool
ADD CONSTRAINT cbusiness FOREIGN KEY(BUSINESS_ID) REFERENCES YelpBusiness(Business_Id) ON DELETE CASCADE;

CREATE TABLE VoteUseful(
REVIEW_ID VARCHAR(20) NOT NULL,
BUSINESS_ID VARCHAR(30) NOT NULL,
UVotes INTEGER DEFAULT 0
);
ALTER TABLE VoteUseful
ADD CONSTRAINT ureview FOREIGN KEY(REVIEW_ID) REFERENCES Reviews(REVIEW_ID) ON DELETE CASCADE;
ALTER TABLE VoteUseful
ADD CONSTRAINT ubusiness FOREIGN KEY(BUSINESS_ID) REFERENCES YelpBusiness(Business_Id) ON DELETE CASCADE;

CREATE TABLE CheckedIn(
YELP_ID VARCHAR(15) NOT NULL,
Checkedin_Business VARCHAR(30) NOT NULL
);
ALTER TABLE CheckedIn
ADD CONSTRAINT cr FOREIGN KEY(YELP_ID) REFERENCES YelpUser(YELP_ID) ON DELETE CASCADE;
ALTER TABLE CheckedIn
ADD CONSTRAINT cb FOREIGN KEY(Checkedin_Business) REFERENCES YelpBusiness(Business_Id) ON DELETE CASCADE;

CREATE TABLE BusnCatg(
Busn_Catg_Id VARCHAR(30) NOT NULL PRIMARY KEY,
Busn_Catg_Name VARCHAR(30) NOT NULL,
Subcategories VARCHAR(100) DEFAULT 'N/A'
);

CREATE TABLE CatgList(
Business_Id VARCHAR(30) NOT NULL,
B_Catg_ID VARCHAR(10) NOT NULL,
CONSTRAINT catgry UNIQUE(Business_Id,B_Catg_ID)
);
ALTER TABLE CatgList
ADD CONSTRAINT ctgb FOREIGN KEY(Business_Id) REFERENCES YelpBusiness(Business_Id) ON DELETE CASCADE;
ALTER TABLE CatgList
ADD CONSTRAINT ctgbn FOREIGN KEY(B_Catg_ID) REFERENCES BusnCatg(Busn_Catg_Id) ON DELETE CASCADE;

CREATE TABLE CommentList(
REVIEW_ID VARCHAR(30) NOT NULL,
YELP_ID VARCHAR(15) NOT NULL,
FOREIGN KEY(REVIEW_ID) REFERENCES Reviews(REVIEW_ID) ON DELETE CASCADE
);
ALTER TABLE CommentList
ADD CONSTRAINT clu FOREIGN KEY(YELP_ID) REFERENCES YelpUser(YELP_ID) ON DELETE CASCADE;

INSERT ALL
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y1','john@yahoo.com','John ','Smith',TO_DATE('12/12/1992','MM/DD/YYYY'),'FL','M')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y2','juan@gmail.com','Juan ','Carlos',TO_DATE('02/07/1988','MM/DD/YYYY'),'AK','M')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y3','Jane@gmail.com','Jane ','Chapel',TO_DATE('06/01/1980','MM/DD/YYYY'),'IL','F')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y4','adi@yahoo.com','Aditya','Awasthi',TO_DATE('04/12/1994','MM/DD/YYYY'),'CA','M')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y5','james@hotmail.com','James ','Williams',TO_DATE('05/05/1991','MM/DD/YYYY'),'NY','M')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y6','mike@yahoo.com','Mike ','Brown',TO_DATE('03/01/1988','MM/DD/YYYY'),'NC','M')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y7','bob@yahoo.com','Bob ','Jones',TO_DATE('02/19/1970','MM/DD/YYYY'),'NY','M')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y8','wei@gmail.com',' Wei ','Zhang ',TO_DATE('03/18/1975','MM/DD/YYYY'),'NV','F')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y9','mark@gmail.com','Mark ','Davis',TO_DATE('11/02/1993','MM/DD/YYYY'),'CA','M')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y10','daniel@yahoo.com','Daniel  ','Garcia',TO_DATE('05/10/1984','MM/DD/YYYY'),'NJ','M')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y11','maria@hotmail.com','Maria','Rodriguez',TO_DATE('08/12/1985','MM/DD/YYYY'),'CA','F')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y12','freya@yahoo.com','Freya','Wilson',TO_DATE('10/05/1995','MM/DD/YYYY'),'NJ','F')
	INTO YelpUser(YELP_ID,Email ,First_Name,Last_Name,DOB,BirthPlace,Gender) VALUES ('Y13','jzhang@gmail.com','John ','Zhang ',TO_DATE('12/12/1995','MM/DD/YYYY'),'NJ','M')
SELECT * FROM dual;

INSERT ALL
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y1','Y2','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y1','Y7','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y1','Y9','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y3','Y6','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y3','Y11','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y3','Y5','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y4','Y7','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y4',' Y11','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y6','Y2','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y6',' Y4','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y7','Y1','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y7',' Y3','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y8','Y6','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y8',' Y1','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y9','Y1','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y9','Y2','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y11','Y3','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y11',' Y5','YES')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y12','Y11','')
	INTO Friendlist(YELP_ID,Friends,Complimented) VALUES ('Y13','Y12','YES')
SELECT * FROM dual;

INSERT ALL
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B1','Big Surf','1500 N McClintock Dr','Tempe','AZ',85281,'Mon, Tue, Wed','Touristy')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B2','SMITH THOMSON ','1595 Spring Hill Road Suite 110','Veinna','VA',22182,'Mon, Tue, Wed, Thu','Touristy')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B3','Bay Area Coffee Shop','1522 W. Sam Rayburn Dr','Bonham','CA',95051,'Mon, Tue, Wed','Touristy')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B4','China  Coffee Toffee ','2570 El Camino Real','Santa Clara','CA',95051,'Mon, Tue, Wed','Touristy')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B5','Hastings Water Works','10331 Brecksville Rd.','Brecksville','OH',44141,'Mon, Tue, Wed','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B6','Catch Your Big Break','2341 Roosevelt Ct','Santa Clara','CA',95051,'Mon, Tue, Wed, Thu, Fri, Sat, Sun','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B7','The Cinebar','20285 South Western Ave.','Torrance','CA',90501,'Mon, Tue, Wed, Thu','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B8','Coffee Bar and Bistro','2585 El Camino Real','Santa Clara','CA',95051,'Mon, Tue, Wed','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B9','Hobees','90 Skyport Dr','San Jose','CA',95110,'Mon, Tue, Wed, Thu, Fri','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B10','Cafe Gourmet','80 N Market St','San Jose','CA',95113,'Mon, Tue','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B11','Yellow Stone National Park','Yellow Stone National Park','Cody','WY',82190,'Mon, Fri, Sat, Sun','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B12','Petrified Forest National Park','P.O. Box 221','Sun Valley','AZ',86028,'Mon, Tue, Sun','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B13','Grand Canyon National park','Highway 64','Tusayan','AZ',86023,'Mon, Sat, Sun','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B35','Connecticut Bar','5847 San Felipe','Houston','TX',77057,'Mon, Thu, Sun','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B36','Sherleys Bar and Restaurent','1132 Terry Road','Hartford','CT',6105,'Mon, Wed, Sun','N/A')
	INTO YelpBusiness(Business_Id,B_Name,S_Address,City,State,Zipcode,DOO, Ambient) VALUES ('B14','Connecticut Bar and Restaurent','1133 Terry Road','Hartford','CT',6105,'Mon, Wed, Sun','N/A')
SELECT * FROM dual;

INSERT ALL
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(1,'Checkin Info 1','B1')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(2,'Checkin Info 2','B2')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(3,'Checkin Info 3','B3')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(4,'Checkin Info 4','B4')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(5,'Checkin Info 5','B5')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(6,'Checkin Info 6','B6')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(7,'Checkin Info 7','B7')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(8,'Checkin Info 8','B8')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(9,'Checkin Info 9','B9')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(10,'Checkin Info 10','B10')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(11,'Checkin Info 11','B11')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(12,'Checkin Info 12','B12')
	INTO Checkin(C_ID,INFO,BUSN_ID) VALUES(13,'Checkin Info 13','B13')
SELECT * FROM dual;

INSERT ALL
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y1','B3')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y1','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y1','B13')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y1','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y1','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y1','B5')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y1','B4')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y1','B9')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y2','B10')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y2','B5')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y2','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y2','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y2','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y2','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y4','B4')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y4','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y4','B12')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y4','B5')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y4','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y4','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y4','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y5','B6')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y5','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y5','B12')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y5','B5')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y5','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y5','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y5','B8')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y6','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y6','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y6','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y6','B3')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y6','B13')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y7','B13')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y7','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y7','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y7','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y7','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y7','B3')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y8','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y8','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y8','B13')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y8','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y8','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y8','B4')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y9','B5')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y9','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y9','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y9','B13')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y9','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y9','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y10','B1')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y10','B5')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y10','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y10','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y10','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y10','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y10','B3')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y11','B3')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y11','B4')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y11','B1')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y11','B5')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y11','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y11','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y11','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y11','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y12','B7')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y12','B10')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y12','B5')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y12','B11')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y12','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y12','B13')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y12','B35')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y12','B36')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y13','B1')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y13','B2')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y13','B3')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y13','B4')
	INTO CheckedIn(YELP_ID,Checkedin_Business) VALUES ('Y13','B5')
SELECT * FROM dual;

INSERT ALL
	INTO BusnCatg(Busn_Catg_Id,Busn_Catg_Name,Subcategories) VALUES ('BCT1','Amusement Parks','Water Parks')
	INTO BusnCatg(Busn_Catg_Id,Busn_Catg_Name,Subcategories) VALUES ('BCT2','National Parks','Wildlife National Parks')
	INTO BusnCatg(Busn_Catg_Id,Busn_Catg_Name,Subcategories) VALUES ('BCT3','Career Counseling','Career Counselling for kids')
	INTO BusnCatg(Busn_Catg_Id,Busn_Catg_Name,Subcategories) VALUES ('BCT4','Food and More','Ice-cream and Yougurt')
	INTO BusnCatg(Busn_Catg_Id,Busn_Catg_Name,Subcategories) VALUES ('BCT5','Bars','Sports bar')
	INTO BusnCatg(Busn_Catg_Id,Busn_Catg_Name,Subcategories) VALUES ('BCT6','Restaurants','Ice-cream and Yougurt')
	INTO BusnCatg(Busn_Catg_Id,Busn_Catg_Name,Subcategories) VALUES ('BCT7','Pool Cleaners','Swimming pool cleaners')
	INTO BusnCatg(Busn_Catg_Id,Busn_Catg_Name,Subcategories) VALUES ('BCT8','Coffee Shops','Cold coffee shops')
SELECT * FROM dual;

INSERT ALL
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B1','BCT1')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B2','BCT6')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B2','BCT4')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B3','BCT8')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B3','BCT6')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B4','BCT4')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B4','BCT6')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B5','BCT7')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B6','BCT3')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B7','BCT5')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B8','BCT5')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B9','BCT6')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B10','BCT6')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B10','BCT4')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B11','BCT2')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B12','BCT2')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B13','BCT2')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B35','BCT5')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B36','BCT5')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B36','BCT6')
	INTO CatgList(Business_Id,B_Catg_ID) VALUES ('B14','BCT5')
SELECT * FROM dual;

INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R1',3,'Y11',TO_TIMESTAMP(' 02/10/2007 09:10:54','MM-DD-YYYY HH24:MI:SS'),'B3');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R2',2,'Y10',TO_TIMESTAMP(' 09/26/2007 13:45:00','MM-DD-YYYY HH24:MI:SS'),'B1');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R3',4,'Y2',TO_TIMESTAMP(' 09/29/2007 10:38:25','MM-DD-YYYY HH24:MI:SS'),'B10');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R4',5,'Y11',TO_TIMESTAMP(' 02/10/2007 13:05:56','MM-DD-YYYY HH24:MI:SS'),'B4');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R5',5,'Y1',TO_TIMESTAMP(' 10/25/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B3');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R6',5,'Y4',TO_TIMESTAMP(' 09/26/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B4');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R7',5,'Y9',TO_TIMESTAMP(' 09/26/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B5');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R8',5,'Y5',TO_TIMESTAMP(' 09/27/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B6');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R9',5,'Y12',TO_TIMESTAMP(' 09/28/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B7');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R10',5,'Y5',TO_TIMESTAMP(' 10/29/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B8');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R11',5,'Y1',TO_TIMESTAMP(' 09/30/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B9');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R12',5,'Y12',TO_TIMESTAMP(' 10/25/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B10');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R13',5,'Y4',TO_TIMESTAMP(' 09/25/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B11');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R14',5,'Y5',TO_TIMESTAMP(' 09/25/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B12');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R15',5,'Y1',TO_TIMESTAMP(' 09/29/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B13');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R16',2,'Y11',TO_TIMESTAMP(' 06/07/2015 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B2');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R17',1,'Y4',TO_TIMESTAMP(' 05/05/2015 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B2');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R18',1,'Y1',TO_TIMESTAMP(' 05/05/2015 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B2');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R19',1,'Y10',TO_TIMESTAMP(' 10/25/2007 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B3');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R20',1,'Y1',TO_TIMESTAMP(' 09/28/2007 00:00:00','MM-DD-YYYY HH24:MI:SS'),'B4');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R21',4,'Y11',TO_TIMESTAMP(' 06/07/2015 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B14');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R22',1,'Y4',TO_TIMESTAMP(' 05/05/2015 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B14');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R23',1,'Y1',TO_TIMESTAMP(' 05/05/2015 17:15:00','MM-DD-YYYY HH24:MI:SS'),'B14');
INSERT INTO Reviews(REVIEW_ID,Stars,Author,Publish_Date,Business_Id) VALUES ('R24',4,'Y13',TO_TIMESTAMP(' 06/10/2018 18:15:00','MM-DD-YYYY HH24:MI:SS'),'B1');


INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R1','B3',2);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R2','B1',0);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R3','B10',3);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R4','B4',2);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R5','B3',3);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R6','B4',5);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R7','B5',7);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R8','B6',3);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R9','B7',2);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R10','B8',6);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R11','B9',2);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R12','B10',2);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R13','B11',5);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R14','B12',2);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R15','B13',0);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R16','B2',1);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R17','B2',2);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R18','B2',1);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R19','B3',4);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R20','B4',5);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R21','B14',5);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R22','B14',7);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R23','B14',8);
INSERT INTO Votefunny(REVIEW_ID,Business_Id,FVotes) VALUES ('R24','B1',2);


INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R1','B3',1);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R2','B1',1);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R3','B10',2);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R4','B4',2);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R5','B3',1);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R6','B4',1);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R7','B5',3);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R8','B6',2);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R9','B7',4);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R10','B8',1);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R11','B9',3);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R12','B10',1);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R13','B11',6);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R14','B12',3);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R15','B13',0);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R16','B2',1);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R17','B2',3);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R18','B2',4);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R19','B3',2);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R20','B4',1);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R21','B14',6);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R22','B14',8);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R23','B14',6);
INSERT INTO VoteCool(REVIEW_ID,Business_Id,CVotes) VALUES ('R24','B1',4);


 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R1','B3',3);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R2','B1',2);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R3','B10',0);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R4','B4',1);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R5','B3',2);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R6','B4',3);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R7','B5',6);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R8','B6',1);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R9','B7',5);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R10','B8',2);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R11','B9',8);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R12','B10',4);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R13','B11',2);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R14','B12',5);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R15','B13',0);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R16','B2',2);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R17','B2',2);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R18','B2',3);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R19','B3',3);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R20','B4',2);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R21','B14',9);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R22','B14',4);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R23','B14',3);
 INSERT INTO Voteuseful(REVIEW_ID,Business_Id,UVotes) VALUES ('R24','B1',5);

INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R2','Y3');
INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R2','Y2');
INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R3','Y3');
INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R7','Y8');
INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R7','Y11');
INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R15','Y8');
INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R16','Y8');
INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R20','Y7');
INSERT INTO CommentList(REVIEW_ID,YELP_ID) VALUES ('R20','Y10');