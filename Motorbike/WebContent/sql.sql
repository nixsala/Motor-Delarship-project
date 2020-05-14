Create database motorbike;
use motorbike;
CReate table user(
id int NOT NULL AUTO_INCREMENT primary key,
firstName varchar(255),
lastName varchar(255),
email varchar(255),
password varchar(255),
isAdmin varchar(255),
phoneNumber varchar(255),
LicenseNumber varchar(255),
CurrentAddress varchar(255));
 

use motorbike;
Create table biketour(
StartDestination varchar(255),
EndDestination varchar (255),
PickUP varchar (255),
placeDrop varchar (255),
MailAddress varchar (255),
PhoneNumber varchar (255),
passengers int(4),
BikeCatogory varchar (255),
MoteristId varchar (255),
MotorBikeNo  varchar (255));
select * from biketour;
 

