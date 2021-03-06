alter table AssetCategory add description varchar(4000);

alter table AssetEntry add classTypeId int64;
alter table AssetEntry add layoutUuid varchar(75);


alter table BlogsEntry add description varchar(4000);
alter table BlogsEntry add smallImage smallint;
alter table BlogsEntry add smallImageId int64;
alter table BlogsEntry add smallImageURL varchar(4000);

alter table BookmarksEntry add resourceBlockId int64;
alter table BookmarksEntry add description varchar(4000);

commit;


alter table BookmarksEntry drop column comments;

alter table BookmarksFolder add resourceBlockId int64;

alter table CalEvent add location varchar(4000);


alter table Company add active_ smallint;

commit;


alter table Country add zipRequired smallint;

commit;


create table DDLRecord (
	uuid_ varchar(75),
	recordId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	versionUserId int64,
	versionUserName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	DDMStorageId int64,
	recordSetId int64,
	version varchar(75),
	displayIndex integer
);

create table DDLRecordSet (
	uuid_ varchar(75),
	recordSetId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	DDMStructureId int64,
	recordSetKey varchar(75),
	name varchar(4000),
	description varchar(4000),
	minDisplayRows integer,
	scope integer
);

create table DDLRecordVersion (
	recordVersionId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	DDMStorageId int64,
	recordSetId int64,
	recordId int64,
	version varchar(75),
	displayIndex integer,
	status integer,
	statusByUserId int64,
	statusByUserName varchar(75),
	statusDate timestamp
);

create table DDMContent (
	uuid_ varchar(75),
	contentId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(4000),
	description varchar(4000),
	xml blob
);

create table DDMStorageLink (
	uuid_ varchar(75),
	storageLinkId int64 not null primary key,
	classNameId int64,
	classPK int64,
	structureId int64
);

create table DDMStructure (
	uuid_ varchar(75),
	structureId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	classNameId int64,
	structureKey varchar(75),
	name varchar(4000),
	description varchar(4000),
	xsd blob,
	storageType varchar(75),
	type_ integer
);

create table DDMStructureLink (
	structureLinkId int64 not null primary key,
	classNameId int64,
	classPK int64,
	structureId int64
);

create table DDMTemplate (
	uuid_ varchar(75),
	templateId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	structureId int64,
	name varchar(4000),
	description varchar(4000),
	type_ varchar(75),
	mode_ varchar(75),
	language varchar(75),
	script blob
);

create table DLContent (
	contentId int64 not null primary key,
	groupId int64,
	companyId int64,
	repositoryId int64,
	path_ varchar(255),
	version varchar(75),
	data_ blob,
	size_ int64
);

create table DLFileEntryMetadata (
	uuid_ varchar(75),
	fileEntryMetadataId int64 not null primary key,
	DDMStorageId int64,
	DDMStructureId int64,
	fileEntryTypeId int64,
	fileEntryId int64,
	fileVersionId int64
);

create table DLFileEntryType (
	uuid_ varchar(75),
	fileEntryTypeId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(75),
	description varchar(4000)
);

create table DLFileEntryTypes_DDMStructures (
	fileEntryTypeId int64 not null,
	structureId int64 not null,
	primary key (fileEntryTypeId, structureId)
);

create table DLFileEntryTypes_DLFolders (
	fileEntryTypeId int64 not null,
	folderId int64 not null,
	primary key (fileEntryTypeId, folderId)
);

alter table DLFileEntry add repositoryId int64;
alter table DLFileEntry add fileEntryTypeId int64;
alter table DLFileEntry add smallImageId int64;
alter table DLFileEntry add largeImageId int64;
alter table DLFileEntry add custom1ImageId int64;
alter table DLFileEntry add custom2ImageId int64;

commit;


alter table DLFileShortcut add repositoryId int64;

commit;


alter table DLFileVersion add modifiedDate timestamp;
alter table DLFileVersion add repositoryId int64;
alter table DLFileVersion add folderId int64;
alter table DLFileVersion add fileEntryTypeId int64;

commit;


alter table DLFolder add repositoryId int64;
alter table DLFolder add mountPoint smallint;
alter table DLFolder add defaultFileEntryTypeId int64;
alter table DLFolder add overrideFileEntryTypes smallint;

commit;


create table DLSync (
	syncId int64 not null primary key,
	companyId int64,
	createDate timestamp,
	modifiedDate timestamp,
	fileId int64,
	fileUuid varchar(75),
	repositoryId int64,
	parentFolderId int64,
	name varchar(255),
	event varchar(75),
	type_ varchar(75),
	version varchar(75)
);

alter table Group_ add site smallint;


alter table JournalArticle add classNameId int64;
alter table JournalArticle add classPK int64;
alter table JournalArticle add layoutUuid varchar(75);

commit;


drop index IX_FAD05595;

alter table Layout drop column layoutPrototypeId;
alter table Layout drop column dlFolderId;

alter table Layout add createDate timestamp;
alter table Layout add modifiedDate timestamp;
alter table Layout add keywords varchar(4000);
alter table Layout add robots varchar(4000);
alter table Layout add layoutPrototypeUuid varchar(75);
alter table Layout add layoutPrototypeLinkEnabled smallint;
alter table Layout add sourcePrototypeLayoutUuid varchar(75);

commit;


create table LayoutBranch (
	LayoutBranchId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	layoutSetBranchId int64,
	plid int64,
	name varchar(75),
	description varchar(4000),
	master smallint
);

alter table LayoutPrototype add uuid_ varchar(75);

create table LayoutRevision (
	layoutRevisionId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	layoutSetBranchId int64,
	layoutBranchId int64,
	parentLayoutRevisionId int64,
	head smallint,
	major smallint,
	plid int64,
	privateLayout smallint,
	name varchar(4000),
	title varchar(4000),
	description varchar(4000),
	keywords varchar(4000),
	robots varchar(4000),
	typeSettings blob,
	iconImage smallint,
	iconImageId int64,
	themeId varchar(75),
	colorSchemeId varchar(75),
	wapThemeId varchar(75),
	wapColorSchemeId varchar(75),
	css varchar(4000),
	status integer,
	statusByUserId int64,
	statusByUserName varchar(75),
	statusDate timestamp
);

alter table LayoutSet drop column layoutSetPrototypeId;

alter table LayoutSet add createDate timestamp;
alter table LayoutSet add modifiedDate timestamp;
alter table LayoutSet add layoutSetPrototypeUuid varchar(75);
alter table LayoutSet add layoutSetPrototypeLinkEnabled smallint;

commit;


create table LayoutSetBranch (
	layoutSetBranchId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	privateLayout smallint,
	name varchar(75),
	description varchar(4000),
	master smallint
);

alter table LayoutSetPrototype add uuid_ varchar(75);
alter table LayoutSetPrototype add createDate timestamp;
alter table LayoutSetPrototype add modifiedDate timestamp;

commit;


alter table MBCategory add displayStyle varchar(75);

commit;


alter table MBMessage add format varchar(75);
alter table MBMessage add answer smallint;

commit;


alter table MBThread add question smallint;

create table MBThreadFlag (
	threadFlagId int64 not null primary key,
	userId int64,
	modifiedDate timestamp,
	threadId int64
);

create table MDRAction (
	uuid_ varchar(75),
	actionId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	classNameId int64,
	classPK int64,
	ruleGroupInstanceId int64,
	name varchar(4000),
	description varchar(4000),
	type_ varchar(255),
	typeSettings blob
);

create table MDRRule (
	uuid_ varchar(75),
	ruleId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	ruleGroupId int64,
	name varchar(4000),
	description varchar(4000),
	type_ varchar(255),
	typeSettings blob
);

create table MDRRuleGroup (
	uuid_ varchar(75),
	ruleGroupId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(4000),
	description varchar(4000)
);

create table MDRRuleGroupInstance (
	uuid_ varchar(75),
	ruleGroupInstanceId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	classNameId int64,
	classPK int64,
	ruleGroupId int64,
	priority integer
);

alter table Organization_ drop column leftOrganizationId;
alter table Organization_ drop column rightOrganizationId;

alter table Organization_ add treePath varchar(4000);

alter table PollsVote add companyId int64;
alter table PollsVote add userName varchar(75);
alter table PollsVote add createDate timestamp;
alter table PollsVote add modifiedDate timestamp;

create table Repository (
	uuid_ varchar(75),
	repositoryId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	classNameId int64,
	name varchar(75),
	description varchar(4000),
	portletId varchar(75),
	typeSettings blob,
	dlFolderId int64
);

create table RepositoryEntry (
	uuid_ varchar(75),
	repositoryEntryId int64 not null primary key,
	groupId int64,
	repositoryId int64,
	mappedId varchar(75)
);

create table ResourceBlock (
	resourceBlockId int64 not null primary key,
	companyId int64,
	groupId int64,
	name varchar(75),
	permissionsHash varchar(75),
	referenceCount int64
);

create table ResourceBlockPermission (
	resourceBlockPermissionId int64 not null primary key,
	resourceBlockId int64,
	roleId int64,
	actionIds int64
);

drop index IX_8D83D0CE;
drop index IX_4A1F4402;

create table ResourceTypePermission (
	resourceTypePermissionId int64 not null primary key,
	companyId int64,
	groupId int64,
	name varchar(75),
	roleId int64,
	actionIds int64
);

create table SocialActivityAchievement (
	activityAchievementId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	createDate int64,
	name varchar(75),
	firstInGroup smallint
);

create table SocialActivityCounter (
	activityCounterId int64 not null primary key,
	groupId int64,
	companyId int64,
	classNameId int64,
	classPK int64,
	name varchar(75),
	ownerType integer,
	currentValue integer,
	totalValue integer,
	graceValue integer,
	startPeriod integer,
	endPeriod integer
);

create table SocialActivityLimit (
	activityLimitId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	classNameId int64,
	classPK int64,
	activityType integer,
	activityCounterName varchar(75),
	value varchar(75)
);

create table SocialActivitySetting (
	activitySettingId int64 not null primary key,
	groupId int64,
	companyId int64,
	classNameId int64,
	activityType integer,
	name varchar(75),
	value varchar(1024)
);


alter table User_ add emailAddressVerified smallint;
alter table User_ add status int;

commit;


alter table User_ drop column active_;

alter table UserGroup add addedByLDAPImport smallint;

alter table UserNotificationEvent add archived smallint;

alter table WorkflowDefinitionLink add classPK int64;
alter table WorkflowDefinitionLink add typePK int64;

commit;


drop table QUARTZ_BLOB_TRIGGERS;
drop table QUARTZ_CALENDARS;
drop table QUARTZ_CRON_TRIGGERS;
drop table QUARTZ_FIRED_TRIGGERS;
drop table QUARTZ_JOB_DETAILS;
drop table QUARTZ_JOB_LISTENERS;
drop table QUARTZ_LOCKS;
drop table QUARTZ_PAUSED_TRIGGER_GRPS;
drop table QUARTZ_SCHEDULER_STATE;
drop table QUARTZ_SIMPLE_TRIGGERS;
drop table QUARTZ_TRIGGERS;
drop table QUARTZ_TRIGGER_LISTENERS;

create table QUARTZ_BLOB_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(200) not null,
	TRIGGER_GROUP varchar(200) not null,
	BLOB_DATA blob,
	primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

create table QUARTZ_CALENDARS (
	SCHED_NAME varchar(120) not null,
	CALENDAR_NAME varchar(200) not null,
	CALENDAR blob not null,
	primary key (SCHED_NAME,CALENDAR_NAME)
);

create table QUARTZ_CRON_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(200) not null,
	TRIGGER_GROUP varchar(200) not null,
	CRON_EXPRESSION varchar(200) not null,
	TIME_ZONE_ID varchar(80),
	primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

create table QUARTZ_FIRED_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	ENTRY_ID varchar(95) not null,
	TRIGGER_NAME varchar(200) not null,
	TRIGGER_GROUP varchar(200) not null,
	INSTANCE_NAME varchar(200) not null,
	FIRED_TIME int64 not null,
	PRIORITY integer not null,
	STATE varchar(16) not null,
	JOB_NAME varchar(200),
	JOB_GROUP varchar(200),
	IS_NONCONCURRENT smallint NULL,
	REQUESTS_RECOVERY smallint NULL,
	primary key (SCHED_NAME, ENTRY_ID)
);

create table QUARTZ_JOB_DETAILS (
	SCHED_NAME varchar(120) not null,
	JOB_NAME varchar(200) not null,
	JOB_GROUP varchar(200) not null,
	DESCRIPTION varchar(250),
	JOB_CLASS_NAME varchar(250) not null,
	IS_DURABLE smallint not null,
	IS_NONCONCURRENT smallint not null,
	IS_UPDATE_DATA smallint not null,
	REQUESTS_RECOVERY smallint not null,
	JOB_DATA blob,
	primary key (SCHED_NAME, JOB_NAME, JOB_GROUP)
);

create table QUARTZ_LOCKS (
	SCHED_NAME varchar(120) not null,
	LOCK_NAME varchar(40) not null ,
	primary key (SCHED_NAME, LOCK_NAME)
);

create table QUARTZ_PAUSED_TRIGGER_GRPS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_GROUP varchar(200) not null,
	primary key (SCHED_NAME, TRIGGER_GROUP)
);

create table QUARTZ_SCHEDULER_STATE (
	SCHED_NAME varchar(120) not null,
	INSTANCE_NAME varchar(200) not null,
	LAST_CHECKIN_TIME int64 not null,
	CHECKIN_INTERVAL int64 not null,
	primary key (SCHED_NAME, INSTANCE_NAME)
);

create table QUARTZ_SIMPLE_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(200) not null,
	TRIGGER_GROUP varchar(200) not null,
	REPEAT_COUNT int64 not null,
	REPEAT_INTERVAL int64 not null,
	TIMES_TRIGGERED int64 not null,
	primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

create table QUARTZ_SIMPROP_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(200) not null,
	TRIGGER_GROUP varchar(200) not null,
	STR_PROP_1 varchar(512),
	STR_PROP_2 varchar(512),
	STR_PROP_3 varchar(512),
	INT_PROP_1 integer,
	INT_PROP_2 integer,
	LONG_PROP_1 int64,
	LONG_PROP_2 int64,
	DEC_PROP_1 NUMERIC(13,4),
	DEC_PROP_2 NUMERIC(13,4),
	BOOL_PROP_1 smallint,
	BOOL_PROP_2 smallint,
	primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

create table QUARTZ_TRIGGERS (
	SCHED_NAME varchar(120) not null,
	TRIGGER_NAME varchar(200) not null,
	TRIGGER_GROUP varchar(200) not null,
	JOB_NAME varchar(200) not null,
	JOB_GROUP varchar(200) not null,
	DESCRIPTION varchar(250),
	NEXT_FIRE_TIME int64,
	PREV_FIRE_TIME int64,
	PRIORITY integer,
	TRIGGER_STATE varchar(16) not null,
	TRIGGER_TYPE varchar(8) not null,
	START_TIME int64 not null,
	END_TIME int64,
	CALENDAR_NAME varchar(200),
	MISFIRE_INSTR integer,
	JOB_DATA blob,
	primary key  (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

commit;

create index IX_88328984 on QUARTZ_JOB_DETAILS (SCHED_NAME, JOB_GROUP);
create index IX_779BCA37 on QUARTZ_JOB_DETAILS (SCHED_NAME, REQUESTS_RECOVERY);

create index IX_BE3835E5 on QUARTZ_FIRED_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);
create index IX_4BD722BM on QUARTZ_FIRED_TRIGGERS (SCHED_NAME, TRIGGER_GROUP);
create index IX_204D31E8 on QUARTZ_FIRED_TRIGGERS (SCHED_NAME, INSTANCE_NAME);
create index IX_339E078M on QUARTZ_FIRED_TRIGGERS (SCHED_NAME, INSTANCE_NAME, REQUESTS_RECOVERY);
create index IX_5005E3AF on QUARTZ_FIRED_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP);
create index IX_BC2F03B0 on QUARTZ_FIRED_TRIGGERS (SCHED_NAME, JOB_GROUP);

create index IX_186442A4 on QUARTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_STATE);
create index IX_1BA1F9DC on QUARTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP);
create index IX_91CA7CCE on QUARTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP, NEXT_FIRE_TIME, TRIGGER_STATE, MISFIRE_INSTR);
create index IX_D219AFDE on QUARTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP, TRIGGER_STATE);
create index IX_A85822A0 on QUARTZ_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP);
create index IX_8AA50BE1 on QUARTZ_TRIGGERS (SCHED_NAME, JOB_GROUP);
create index IX_EEFE382A on QUARTZ_TRIGGERS (SCHED_NAME, NEXT_FIRE_TIME);
create index IX_F026CF4C on QUARTZ_TRIGGERS (SCHED_NAME, NEXT_FIRE_TIME, TRIGGER_STATE);
create index IX_F2DD7C7E on QUARTZ_TRIGGERS (SCHED_NAME, NEXT_FIRE_TIME, TRIGGER_STATE, MISFIRE_INSTR);
create index IX_1F92813C on QUARTZ_TRIGGERS (SCHED_NAME, NEXT_FIRE_TIME, MISFIRE_INSTR);
create index IX_99108B6E on QUARTZ_TRIGGERS (SCHED_NAME, TRIGGER_STATE);
create index IX_CD7132D0 on QUARTZ_TRIGGERS (SCHED_NAME, CALENDAR_NAME);
