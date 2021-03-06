alter table Company add homeURL varchar null;

alter table ExpandoColumn add companyId bigint;
alter table ExpandoColumn add defaultData varchar null;
alter table ExpandoColumn add typeSettings varchar null;

alter table ExpandoRow add companyId bigint;

alter table ExpandoTable add companyId bigint;

alter table ExpandoValue add companyId bigint;

alter table JournalArticleImage add elInstanceId varchar(75) null;

alter table JournalStructure add parentStructureId varchar(75);

create table MBMailingList (
	uuid_ varchar(75) null,
	mailingListId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	categoryId bigint,
	emailAddress varchar(75) null,
	inProtocol varchar(75) null,
	inServerName varchar(75) null,
	inServerPort int,
	inUseSSL boolean,
	inUserName varchar(75) null,
	inPassword varchar(75) null,
	inReadInterval int,
	outEmailAddress varchar(75) null,
	outCustom boolean,
	outServerName varchar(75) null,
	outServerPort int,
	outUseSSL boolean,
	outUserName varchar(75) null,
	outPassword varchar(75) null,
	active_ boolean
);

alter table Organization_ add type_ varchar(75);

alter table Role_ add title varchar null;
alter table Role_ add subtype varchar(75);

alter table TagsAsset add visible boolean;

commit;

update TagsAsset set visible = TRUE;

alter table TagsEntry add groupId bigint;
alter table TagsEntry add parentEntryId bigint;
alter table TagsEntry add vocabularyId bigint;

commit;

update TagsEntry set groupId = 0;
update TagsEntry set parentEntryId = 0;
update TagsEntry set vocabularyId = 0;

create table TagsVocabulary (
	vocabularyId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	description varchar(75) null,
	folksonomy boolean
);

alter table User_ add reminderQueryQuestion varchar(75) null;
alter table User_ add reminderQueryAnswer varchar(75) null;

create table WSRPConfiguredProducer (
	configuredProducerId bigint not null primary key,
	name varchar(75) null,
	portalId varchar(75) null,
	namespace varchar(75) null,
	producerURL varchar(256) null,
	producerVersion varchar(75) null,
	producerMarkupURL varchar(256) null,
	status int,
	registrationData varchar null,
	registrationContext varchar null,
	serviceDescription varchar null,
	userCategoryMapping varchar null,
	customUserProfile varchar null,
	identityPropagationType varchar(75) null,
	lifetimeTerminationTime varchar(75) null,
	sdLastModified bigint,
	entityVersion int
);

create table WSRPConsumerRegistration (
	consumerRegistrationId bigint not null primary key,
	consumerName varchar(100) null,
	status boolean,
	registrationHandle varchar(75) null,
	registrationData varchar null,
	lifetimeTerminationTime varchar(75) null,
	producerKey varchar(75) null
);

create table WSRPPortlet (
	portletId bigint not null primary key,
	name varchar(75) null,
	channelName varchar(75) null,
	title varchar(75) null,
	shortTitle varchar(75) null,
	displayName varchar(75) null,
	keywords varchar(75) null,
	status int,
	producerEntityId varchar(75) null,
	consumerId varchar(75) null,
	portletHandle varchar(75) null,
	mimeTypes varchar null
);

create table WSRPProducer (
	producerId bigint not null primary key,
	portalId varchar(75) null,
	status boolean,
	namespace varchar(75) null,
	instanceName varchar(75) null,
	requiresRegistration boolean,
	supportsInbandRegistration boolean,
	version varchar(75) null,
	offeredPortlets varchar null,
	producerProfileMap varchar(75) null,
	registrationProperties varchar null,
	registrationValidatorClass varchar(200) null
);
