alter table Address add uuid_ varchar(75);

update BlogsEntry set status = 2 where status = 9;

alter table BookmarksEntry add treePath lvarchar;
alter table BookmarksEntry add status int;
alter table BookmarksEntry add statusByUserId int8;
alter table BookmarksEntry add statusByUserName varchar(75);
alter table BookmarksEntry add statusDate datetime YEAR TO FRACTION;



update BookmarksEntry set status = 0;
update BookmarksEntry set statusByUserId = userId;
update BookmarksEntry set statusByUserName = userName;
update BookmarksEntry set statusDate = modifiedDate;

alter table BookmarksFolder add treePath lvarchar;
alter table BookmarksFolder add status int;
alter table BookmarksFolder add statusByUserId int8;
alter table BookmarksFolder add statusByUserName varchar(75);
alter table BookmarksFolder add statusDate datetime YEAR TO FRACTION;



update BookmarksFolder set status = 0;
update BookmarksFolder set statusByUserId = userId;
update BookmarksFolder set statusByUserName = userName;
update BookmarksFolder set statusDate = modifiedDate;

create table BackgroundTask (
	backgroundTaskId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	servletContextNames varchar(255),
	taskExecutorClassName varchar(200),
	taskContext text,
	completed boolean,
	completionDate datetime YEAR TO FRACTION,
	status int,
	statusMessage text
)
extent size 16 next size 16
lock mode row;

alter table Contact_ add classNameId int8;
alter table Contact_ add classPK int8;
alter table Contact_ add emailAddress varchar(75);

update Country set name = 'canada' where name = 'Canada';
update Country set name = 'china' where name = 'China';
update Country set name = 'france' where name = 'France';
update Country set name = 'germany' where name = 'Germany';
update Country set name = 'hong-kong' where name = 'Hong Kong';
update Country set name = 'hungary' where name = 'Hungary';
update Country set name = 'israel' where name = 'Israel';
update Country set name = 'italy' where name = 'Italy';
update Country set name = 'japan' where name = 'Japan';
update Country set name = 'south-korea' where name = 'South Korea';
update Country set name = 'netherlands' where name = 'Netherlands';
update Country set name = 'portugal' where name = 'Portugal';
update Country set name = 'russia' where name = 'Russia';
update Country set name = 'singapore' where name = 'Singapore';
update Country set name = 'spain' where name = 'Spain';
update Country set name = 'turkey' where name = 'Turkey';
update Country set name = 'vietnam' where name = 'Vietnam';
update Country set name = 'united-kingdom' where name = 'United Kingdom';
update Country set name = 'united-states' where name = 'United States';
update Country set name = 'afghanistan' where name = 'Afghanistan';
update Country set name = 'albania' where name = 'Albania';
update Country set name = 'algeria' where name = 'Algeria';
update Country set name = 'american-samoa' where name = 'American Samoa';
update Country set name = 'andorra' where name = 'Andorra';
update Country set name = 'angola' where name = 'Angola';
update Country set name = 'anguilla' where name = 'Anguilla';
update Country set name = 'antarctica' where name = 'Antarctica';
update Country set name = 'antigua-barbuda' where name = 'Antigua';
update Country set name = 'argentina' where name = 'Argentina';
update Country set name = 'armenia' where name = 'Armenia';
update Country set name = 'aruba' where name = 'Aruba';
update Country set name = 'australia' where name = 'Australia';
update Country set name = 'austria' where name = 'Austria';
update Country set name = 'azerbaijan' where name = 'Azerbaijan';
update Country set name = 'bahamas' where name = 'Bahamas';
update Country set name = 'bahrain' where name = 'Bahrain';
update Country set name = 'bangladesh' where name = 'Bangladesh';
update Country set name = 'barbados' where name = 'Barbados';
update Country set name = 'belarus' where name = 'Belarus';
update Country set name = 'belgium' where name = 'Belgium';
update Country set name = 'belize' where name = 'Belize';
update Country set name = 'benin' where name = 'Benin';
update Country set name = 'bermuda' where name = 'Bermuda';
update Country set name = 'bhutan' where name = 'Bhutan';
update Country set name = 'bolivia' where name = 'Bolivia';
update Country set name = 'bosnia-herzegovina' where name = 'Bosnia-Herzegovina';
update Country set name = 'botswana' where name = 'Botswana';
update Country set name = 'brazil' where name = 'Brazil';
update Country set name = 'british-virgin-islands' where name = 'British Virgin Islands';
update Country set name = 'brunei' where name = 'Brunei';
update Country set name = 'bulgaria' where name = 'Bulgaria';
update Country set name = 'burkina-faso' where name = 'Burkina Faso';
update Country set name = 'burma-myanmar' where name = 'Burma (Myanmar)';
update Country set name = 'burundi' where name = 'Burundi';
update Country set name = 'cambodia' where name = 'Cambodia';
update Country set name = 'cameroon' where name = 'Cameroon';
update Country set name = 'cape-verde-island' where name = 'Cape Verde Island';
update Country set name = 'cayman-islands' where name = 'Cayman Islands';
update Country set name = 'central-african-republic' where name = 'Central African Republic';
update Country set name = 'chad' where name = 'Chad';
update Country set name = 'chile' where name = 'Chile';
update Country set name = 'christmas-island' where name = 'Christmas Island';
update Country set name = 'cocos-islands' where name = 'Cocos Islands';
update Country set name = 'colombia' where name = 'Colombia';
update Country set name = 'comoros' where name = 'Comoros';
update Country set name = 'republic-of-congo' where name = 'Republic of Congo';
update Country set name = 'democratic-republic-of-congo' where name = 'Democratic Republic of Congo';
update Country set name = 'cook-islands' where name = 'Cook Islands';
update Country set name = 'costa-rica' where name = 'Costa Rica';
update Country set name = 'croatia' where name = 'Croatia';
update Country set name = 'cuba' where name = 'Cuba';
update Country set name = 'cyprus' where name = 'Cyprus';
update Country set name = 'czech-republic' where name = 'Czech Republic';
update Country set name = 'denmark' where name = 'Denmark';
update Country set name = 'djibouti' where name = 'Djibouti';
update Country set name = 'dominica' where name = 'Dominica';
update Country set name = 'dominican-republic' where name = 'Dominican Republic';
update Country set name = 'ecuador' where name = 'Ecuador';
update Country set name = 'egypt' where name = 'Egypt';
update Country set name = 'el-salvador' where name = 'El Salvador';
update Country set name = 'equatorial-guinea' where name = 'Equatorial Guinea';
update Country set name = 'eritrea' where name = 'Eritrea';
update Country set name = 'estonia' where name = 'Estonia';
update Country set name = 'ethiopia' where name = 'Ethiopia';
update Country set name = 'faeroe-islands' where name = 'Faeroe Islands';
update Country set name = 'falkland-islands' where name = 'Falkland Islands';
update Country set name = 'fiji-islands' where name = 'Fiji Islands';
update Country set name = 'finland' where name = 'Finland';
update Country set name = 'french-guiana' where name = 'French Guiana';
update Country set name = 'french-polynesia' where name = 'French Polynesia';
update Country set name = 'gabon' where name = 'Gabon';
update Country set name = 'gambia' where name = 'Gambia';
update Country set name = 'georgia' where name = 'Georgia';
update Country set name = 'ghana' where name = 'Ghana';
update Country set name = 'gibraltar' where name = 'Gibraltar';
update Country set name = 'greece' where name = 'Greece';
update Country set name = 'greenland' where name = 'Greenland';
update Country set name = 'grenada' where name = 'Grenada';
update Country set name = 'guadeloupe' where name = 'Guadeloupe';
update Country set name = 'guam' where name = 'Guam';
update Country set name = 'guatemala' where name = 'Guatemala';
update Country set name = 'guinea' where name = 'Guinea';
update Country set name = 'guinea-bissau' where name = 'Guinea-Bissau';
update Country set name = 'guyana' where name = 'Guyana';
update Country set name = 'haiti' where name = 'Haiti';
update Country set name = 'honduras' where name = 'Honduras';
update Country set name = 'iceland' where name = 'Iceland';
update Country set name = 'india' where name = 'India';
update Country set name = 'indonesia' where name = 'Indonesia';
update Country set name = 'iran' where name = 'Iran';
update Country set name = 'iraq' where name = 'Iraq';
update Country set name = 'ireland' where name = 'Ireland';
update Country set name = 'ivory-coast' where name = 'Ivory Coast';
update Country set name = 'jamaica' where name = 'Jamaica';
update Country set name = 'jordan' where name = 'Jordan';
update Country set name = 'kazakhstan' where name = 'Kazakhstan';
update Country set name = 'kenya' where name = 'Kenya';
update Country set name = 'kiribati' where name = 'Kiribati';
update Country set name = 'kuwait' where name = 'Kuwait';
update Country set name = 'north-korea' where name = 'North Korea';
update Country set name = 'kyrgyzstan' where name = 'Kyrgyzstan';
update Country set name = 'laos' where name = 'Laos';
update Country set name = 'latvia' where name = 'Latvia';
update Country set name = 'lebanon' where name = 'Lebanon';
update Country set name = 'lesotho' where name = 'Lesotho';
update Country set name = 'liberia' where name = 'Liberia';
update Country set name = 'libya' where name = 'Libya';
update Country set name = 'liechtenstein' where name = 'Liechtenstein';
update Country set name = 'lithuania' where name = 'Lithuania';
update Country set name = 'luxembourg' where name = 'Luxembourg';
update Country set name = 'macau' where name = 'Macau';
update Country set name = 'macedonia' where name = 'Macedonia';
update Country set name = 'madagascar' where name = 'Madagascar';
update Country set name = 'malawi' where name = 'Malawi';
update Country set name = 'malaysia' where name = 'Malaysia';
update Country set name = 'maldives' where name = 'Maldives';
update Country set name = 'mali' where name = 'Mali';
update Country set name = 'malta' where name = 'Malta';
update Country set name = 'marshall-islands' where name = 'Marshall Islands';
update Country set name = 'martinique' where name = 'Martinique';
update Country set name = 'mauritania' where name = 'Mauritania';
update Country set name = 'mauritius' where name = 'Mauritius';
update Country set name = 'mayotte-island' where name = 'Mayotte Island';
update Country set name = 'mexico' where name = 'Mexico';
update Country set name = 'micronesia' where name = 'Micronesia';
update Country set name = 'moldova' where name = 'Moldova';
update Country set name = 'monaco' where name = 'Monaco';
update Country set name = 'mongolia' where name = 'Mongolia';
update Country set name = 'montenegro' where name = 'Montenegro';
update Country set name = 'montserrat' where name = 'Montserrat';
update Country set name = 'morocco' where name = 'Morocco';
update Country set name = 'mozambique' where name = 'Mozambique';
update Country set name = 'namibia' where name = 'Namibia';
update Country set name = 'nauru' where name = 'Nauru';
update Country set name = 'nepal' where name = 'Nepal';
update Country set name = 'netherlands-antilles' where name = 'Netherlands Antilles';
update Country set name = 'new-caledonia' where name = 'New Caledonia';
update Country set name = 'new-zealand' where name = 'New Zealand';
update Country set name = 'nicaragua' where name = 'Nicaragua';
update Country set name = 'niger' where name = 'Niger';
update Country set name = 'nigeria' where name = 'Nigeria';
update Country set name = 'niue' where name = 'Niue';
update Country set name = 'norfolk-island' where name = 'Norfolk Island';
update Country set name = 'norway' where name = 'Norway';
update Country set name = 'oman' where name = 'Oman';
update Country set name = 'pakistan' where name = 'Pakistan';
update Country set name = 'palau' where name = 'Palau';
update Country set name = 'palestine' where name = 'Palestine';
update Country set name = 'panama' where name = 'Panama';
update Country set name = 'papua-new-guinea' where name = 'Papua New Guinea';
update Country set name = 'paraguay' where name = 'Paraguay';
update Country set name = 'peru' where name = 'Peru';
update Country set name = 'philippines' where name = 'Philippines';
update Country set name = 'poland' where name = 'Poland';
update Country set name = 'puerto-rico' where name = 'Puerto Rico';
update Country set name = 'qatar' where name = 'Qatar';
update Country set name = 'reunion-island' where name = 'Reunion Island';
update Country set name = 'romania' where name = 'Romania';
update Country set name = 'rwanda' where name = 'Rwanda';
update Country set name = 'st-helena' where name = 'St. Helena';
update Country set name = 'st-kitts' where name = 'St. Kitts';
update Country set name = 'st-lucia' where name = 'St. Lucia';
update Country set name = 'st-pierre-miquelon' where name = 'St. Pierre & Miquelon';
update Country set name = 'st-vincent' where name = 'St. Vincent';
update Country set name = 'san-marino' where name = 'San Marino';
update Country set name = 'sao-tome-principe' where name = 'Sao Tome & Principe';
update Country set name = 'saudi-arabia' where name = 'Saudi Arabia';
update Country set name = 'senegal' where name = 'Senegal';
update Country set name = 'serbia' where name = 'Serbia';
update Country set name = 'seychelles' where name = 'Seychelles';
update Country set name = 'sierra-leone' where name = 'Sierra Leone';
update Country set name = 'slovakia' where name = 'Slovakia';
update Country set name = 'slovenia' where name = 'Slovenia';
update Country set name = 'solomon-islands' where name = 'Solomon Islands';
update Country set name = 'somalia' where name = 'Somalia';
update Country set name = 'south-africa' where name = 'South Africa';
update Country set name = 'sri-lanka' where name = 'Sri Lanka';
update Country set name = 'sudan' where name = 'Sudan';
update Country set name = 'suriname' where name = 'Suriname';
update Country set name = 'swaziland' where name = 'Swaziland';
update Country set name = 'sweden' where name = 'Sweden';
update Country set name = 'switzerland' where name = 'Switzerland';
update Country set name = 'syria' where name = 'Syria';
update Country set name = 'taiwan' where name = 'Taiwan';
update Country set name = 'tajikistan' where name = 'Tajikistan';
update Country set name = 'tanzania' where name = 'Tanzania';
update Country set name = 'thailand' where name = 'Thailand';
update Country set name = 'togo' where name = 'Togo';
update Country set name = 'tonga' where name = 'Tonga';
update Country set name = 'trinidad-tobago' where name = 'Trinidad & Tobago';
update Country set name = 'tunisia' where name = 'Tunisia';
update Country set name = 'turkmenistan' where name = 'Turkmenistan';
update Country set name = 'turks-caicos' where name = 'Turks & Caicos';
update Country set name = 'tuvalu' where name = 'Tuvalu';
update Country set name = 'uganda' where name = 'Uganda';
update Country set name = 'ukraine' where name = 'Ukraine';
update Country set name = 'united-arab-emirates' where name = 'United Arab Emirates';
update Country set name = 'uruguay' where name = 'Uruguay';
update Country set name = 'uzbekistan' where name = 'Uzbekistan';
update Country set name = 'vanuatu' where name = 'Vanuatu';
update Country set name = 'vatican-city' where name = 'Vatican City';
update Country set name = 'venezuela' where name = 'Venezuela';
update Country set name = 'wallis-futuna' where name = 'Wallis & Futuna';
update Country set name = 'western-samoa' where name = 'Western Samoa';
update Country set name = 'yemen' where name = 'Yemen';
update Country set name = 'zambia' where name = 'Zambia';
update Country set name = 'zimbabwe' where name = 'Zimbabwe';

update Country set a2 = 'WS', a3 = 'WSM', number_ = '882' where countryId = '224';

insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (228, 'aland-islands', 'AX', 'ALA', '248', '359', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (229, 'bonaire-st-eustatius-saba', 'BQ', 'BES', '535', '599', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (230, 'bouvet-island', 'BV', 'BVT', '74', '047', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (231, 'british-indian-ocean-territory', 'IO', 'IOT', '86', '246', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (232, 'curacao', 'CW', 'CUW', '531', '599', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (233, 'french-southern-territories', 'TF', 'ATF', '260', '033', 'F', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (234, 'guernsey', 'GG', 'GGY', '831', '044', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (235, 'heard-island-mcdonald-islands', 'HM', 'HMD', '334', '061', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (236, 'isle-of-man', 'IM', 'IMN', '833', '044', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (237, 'jersey', 'JE', 'JEY', '832', '044', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (238, 'northern-mariana-islands', 'MP', 'MNP', '580', '670', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (239, 'pitcairn', 'PN', 'PCN', '612', '649', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (240, 'south-georgia-south-sandwich-islands', 'GS', 'SGS', '239', '044', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (241, 'south-sudan', 'SS', 'SSD', '728', '211', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (242, 'sint-maarten', 'SX', 'SXM', '534', '721', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (243, 'st-barthelemy', 'BL', 'BLM', '652', '590', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (244, 'st-martin', 'MF', 'MAF', '663', '590', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (245, 'tokelau', 'TK', 'TKL', '772', '690', 'F', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (246, 'timor-leste', 'TL', 'TLS', '626', '670', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (247, 'united-states-minor-outlying-islands', 'UM', 'UMI', '581', '699', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (248, 'united-states-virgin-islands', 'VI', 'VIR', '850', '340', 'T', 'T');
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (249, 'western-sahara', 'EH', 'ESH', '732', '212', 'T', 'T');

alter table DDMStructure add parentStructureId int8;

drop index IX_490E7A1E;

alter table DDMTemplate add cacheable boolean;
alter table DDMTemplate add smallImage boolean;
alter table DDMTemplate add smallImageId int8;
alter table DDMTemplate add smallImageURL lvarchar;

update DDMTemplate set type_ = 'display' where type_ = 'list';
update DDMTemplate set type_ = 'form' where type_ = 'detail';

alter table DLFileEntry drop column versionUserId;
alter table DLFileEntry drop column versionUserName;

alter table DLFileEntry add classNameId int8;
alter table DLFileEntry add classPK int8;
alter table DLFileEntry add treePath lvarchar;
alter table DLFileEntry add manualCheckInRequired boolean;



update DLFileEntry set classNameId = 0;
update DLFileEntry set classPK = 0;
update DLFileEntry set manualCheckInRequired = 'F';

alter table DLFileRank add active_ boolean;



update DLFileRank set active_ = 'T';

alter table DLFileShortcut add treePath lvarchar;
alter table DLFileShortcut add active_ boolean;



update DLFileShortcut set active_ = 'T';

alter table DLFileVersion add treePath lvarchar;
alter table DLFileVersion add checksum varchar(75);

alter table DLFolder add treePath lvarchar;
alter table DLFolder add hidden_ boolean;
alter table DLFolder add status int;
alter table DLFolder add statusByUserId int8;
alter table DLFolder add statusByUserName varchar(75);
alter table DLFolder add statusDate datetime YEAR TO FRACTION;



update DLFolder set hidden_ = 'F';
update DLFolder set status = 0;
update DLFolder set statusByUserId = userId;
update DLFolder set statusByUserName = userName;
update DLFolder set statusDate = modifiedDate;

drop table DLSync;

create table DLSyncEvent (
	syncEventId int8 not null primary key,
	modifiedTime int8,
	event varchar(75),
	type_ varchar(75),
	typePK int8
)
extent size 16 next size 16
lock mode row;

alter table EmailAddress add uuid_ varchar(75);

alter table ExpandoRow add modifiedDate datetime YEAR TO FRACTION;



update ExpandoRow set modifiedDate = CURRENT YEAR TO FRACTION;

alter table Group_ add uuid_ varchar(75);
alter table Group_ add treePath lvarchar;
alter table Group_ add manualMembership boolean;
alter table Group_ add membershipRestriction int;
alter table Group_ add remoteStagingGroupCount int;



update Group_ set manualMembership = 'T';
update Group_ set membershipRestriction = 0;
update Group_ set site = 'F' where name = 'Control Panel';
update Group_ set site = 'T' where friendlyURL = '/global';

drop table Groups_Permissions;

alter table Image drop column text_;

alter table JournalArticle add folderId int8;
alter table JournalArticle add treePath lvarchar;



update JournalArticle set folderId = 0;

create table JournalFolder (
	uuid_ varchar(75),
	folderId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	parentFolderId int8,
	treePath lvarchar,
	name varchar(100),
	description lvarchar,
	status int,
	statusByUserId int8,
	statusByUserName varchar(75),
	statusDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

alter table Layout add userId int8;
alter table Layout add userName varchar(75);

drop index IX_CED31606;

create table LayoutFriendlyURL (
	uuid_ varchar(75),
	layoutFriendlyURLId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	plid int8,
	privateLayout boolean,
	friendlyURL varchar(255),
	languageId varchar(75)
)
extent size 16 next size 16
lock mode row;

alter table LayoutPrototype add userId int8;
alter table LayoutPrototype add userName varchar(75);
alter table LayoutPrototype add createDate datetime YEAR TO FRACTION;
alter table LayoutPrototype add modifiedDate datetime YEAR TO FRACTION;

alter table LayoutSetPrototype add userId int8;
alter table LayoutSetPrototype add userName varchar(75);

drop index IX_228562AD;
drop index IX_DD635956;

alter table MBBan add uuid_ varchar(75);

alter table MBCategory add status int;
alter table MBCategory add statusByUserId int8;
alter table MBCategory add statusByUserName varchar(75);
alter table MBCategory add statusDate datetime YEAR TO FRACTION;

alter table MBDiscussion add uuid_ varchar(75);
alter table MBDiscussion add groupId int8;
alter table MBDiscussion add companyId int8;
alter table MBDiscussion add userId int8;
alter table MBDiscussion add userName varchar(75);
alter table MBDiscussion add createDate datetime YEAR TO FRACTION;
alter table MBDiscussion add modifiedDate datetime YEAR TO FRACTION;



update MBCategory set status = 0;
update MBCategory set statusByUserId = userId;
update MBCategory set statusByUserName = userName;
update MBCategory set statusDate = modifiedDate;

update MBMessage set status = 2 where status = 9;

alter table MBMessage drop column attachments;

alter table MBThread add uuid_ varchar(75);
alter table MBThread add userId int8;
alter table MBThread add userName varchar(75);
alter table MBThread add createDate datetime YEAR TO FRACTION;
alter table MBThread add modifiedDate datetime YEAR TO FRACTION;

alter table MBThreadFlag add uuid_ varchar(75);
alter table MBThreadFlag add groupId int8;
alter table MBThreadFlag add companyId int8;
alter table MBThreadFlag add userName varchar(75);
alter table MBThreadFlag add createDate datetime YEAR TO FRACTION;

alter table Organization_ add uuid_ varchar(75);
alter table Organization_ add userId int8;
alter table Organization_ add userName varchar(75);
alter table Organization_ add createDate datetime YEAR TO FRACTION;
alter table Organization_ add modifiedDate datetime YEAR TO FRACTION;

drop table OrgGroupPermission;

alter table PasswordPolicy add uuid_ varchar(75);
alter table PasswordPolicy add regex varchar(75);

drop index IX_C3A17327;
drop index IX_ED7CF243;

drop table Permission_;

alter table Phone add uuid_ varchar(75);

alter table PollsChoice add groupId int8;
alter table PollsChoice add companyId int8;
alter table PollsChoice add userId int8;
alter table PollsChoice add userName varchar(75);
alter table PollsChoice add createDate datetime YEAR TO FRACTION;
alter table PollsChoice add modifiedDate datetime YEAR TO FRACTION;

alter table PollsVote add uuid_ varchar(75);
alter table PollsVote add groupId int8;

update Portlet set active_ = 'F' where portletId = '62';
update Portlet set active_ = 'F' where portletId = '98';
update Portlet set active_ = 'F' where portletId = '173';

alter table RepositoryEntry add companyId int8;
alter table RepositoryEntry add userId int8;
alter table RepositoryEntry add userName varchar(75);
alter table RepositoryEntry add createDate datetime YEAR TO FRACTION;
alter table RepositoryEntry add modifiedDate datetime YEAR TO FRACTION;
alter table RepositoryEntry add manualCheckInRequired boolean;

drop table Resource_;

drop table ResourceCode;

drop index IX_88705859;
drop index IX_C94C7708;
drop index IX_8D83D0CE;
drop index IX_4A1F4402;
drop index IX_8DB864A9;

alter table Role_ add uuid_ varchar(75);
alter table Role_ add userId int8;
alter table Role_ add userName varchar(75);
alter table Role_ add createDate datetime YEAR TO FRACTION;
alter table Role_ add modifiedDate datetime YEAR TO FRACTION;

drop table Roles_Permissions;

alter table SocialActivity add activitySetId int8;
alter table SocialActivity add parentClassNameId int8;
alter table SocialActivity add parentClassPK int8;

alter table SocialActivityCounter add active_ boolean;



update SocialActivityCounter set active_ = 'T';

create table SocialActivitySet (
	activitySetId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	createDate int8,
	modifiedDate int8,
	classNameId int8,
	classPK int8,
	type_ int,
	extraData lvarchar,
	activityCount int
)
extent size 16 next size 16
lock mode row;

create table SystemEvent (
	systemEventId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	classUuid varchar(75),
	referrerClassNameId int8,
	parentSystemEventId int8,
	systemEventSetKey int8,
	type_ int,
	extraData text
)
extent size 16 next size 16
lock mode row;

create table TrashEntry (
	entryId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	classNameId int8,
	classPK int8,
	systemEventSetKey int8,
	typeSettings lvarchar(4096),
	status int
)
extent size 16 next size 16
lock mode row;

create table TrashVersion (
	versionId int8 not null primary key,
	entryId int8,
	classNameId int8,
	classPK int8,
	typeSettings lvarchar(4096),
	status int
)
extent size 16 next size 16
lock mode row;

alter table User_ add ldapServerId int8;



update User_ set ldapServerId = -1;

alter table UserGroup add uuid_ varchar(75);
alter table UserGroup add userId int8;
alter table UserGroup add userName varchar(75);
alter table UserGroup add createDate datetime YEAR TO FRACTION;
alter table UserGroup add modifiedDate datetime YEAR TO FRACTION;

create table UserNotificationDelivery (
	userNotificationDeliveryId int8 not null primary key,
	companyId int8,
	userId int8,
	portletId varchar(200),
	classNameId int8,
	notificationType int,
	deliveryType int,
	deliver boolean
)
extent size 16 next size 16
lock mode row;

alter table UserNotificationEvent add delivered boolean;

drop table Users_Permissions;

alter table Website add uuid_ varchar(75);

alter table WikiNode add status int;
alter table WikiNode add statusByUserId int8;
alter table WikiNode add statusByUserName varchar(75);
alter table WikiNode add statusDate datetime YEAR TO FRACTION;



update WikiNode set status = 0;
update WikiNode set statusByUserId = userId;
update WikiNode set statusByUserName = userName;
update WikiNode set statusDate = modifiedDate;
