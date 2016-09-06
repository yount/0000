create table Account_ (
	mvccVersion bigint default 0 not null,
	accountId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	parentAccountId bigint,
	name varchar(75) null,
	legalName varchar(75) null,
	legalId varchar(75) null,
	legalType varchar(75) null,
	sicCode varchar(75) null,
	tickerSymbol varchar(75) null,
	industry varchar(75) null,
	type_ varchar(75) null,
	size_ varchar(75) null
) engine InnoDB;

create table Address (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	addressId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	street1 varchar(75) null,
	street2 varchar(75) null,
	street3 varchar(75) null,
	city varchar(75) null,
	zip varchar(75) null,
	regionId bigint,
	countryId bigint,
	typeId bigint,
	mailing tinyint,
	primary_ tinyint
) engine InnoDB;

create table AnnouncementsDelivery (
	deliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(75) null,
	email tinyint,
	sms tinyint,
	website tinyint
) engine InnoDB;

create table AnnouncementsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	title varchar(75) null,
	content longtext null,
	url longtext null,
	type_ varchar(75) null,
	displayDate datetime null,
	expirationDate datetime null,
	priority integer,
	alert tinyint
) engine InnoDB;

create table AnnouncementsFlag (
	flagId bigint not null primary key,
	companyId bigint,
	userId bigint,
	createDate datetime null,
	entryId bigint,
	value integer
) engine InnoDB;

create table AssetCategory (
	uuid_ varchar(75) null,
	categoryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	parentCategoryId bigint,
	leftCategoryId bigint,
	rightCategoryId bigint,
	name varchar(75) null,
	title longtext null,
	description longtext null,
	vocabularyId bigint,
	lastPublishDate datetime null
) engine InnoDB;

create table AssetCategoryProperty (
	categoryPropertyId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	categoryId bigint,
	key_ varchar(75) null,
	value varchar(75) null
) engine InnoDB;

create table AssetEntries_AssetCategories (
	companyId bigint not null,
	categoryId bigint not null,
	entryId bigint not null,
	primary key (categoryId, entryId)
) engine InnoDB;

create table AssetEntries_AssetTags (
	companyId bigint not null,
	entryId bigint not null,
	tagId bigint not null,
	primary key (entryId, tagId)
) engine InnoDB;

create table AssetEntry (
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	classUuid varchar(75) null,
	classTypeId bigint,
	listable tinyint,
	visible tinyint,
	startDate datetime null,
	endDate datetime null,
	publishDate datetime null,
	expirationDate datetime null,
	mimeType varchar(75) null,
	title longtext null,
	description longtext null,
	summary longtext null,
	url longtext null,
	layoutUuid varchar(75) null,
	height integer,
	width integer,
	priority double,
	viewCount integer
) engine InnoDB;

create table AssetLink (
	linkId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	entryId1 bigint,
	entryId2 bigint,
	type_ integer,
	weight integer
) engine InnoDB;

create table AssetTag (
	uuid_ varchar(75) null,
	tagId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	assetCount integer,
	lastPublishDate datetime null
) engine InnoDB;

create table AssetTagStats (
	tagStatsId bigint not null primary key,
	companyId bigint,
	tagId bigint,
	classNameId bigint,
	assetCount integer
) engine InnoDB;

create table AssetVocabulary (
	uuid_ varchar(75) null,
	vocabularyId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	title longtext null,
	description longtext null,
	settings_ longtext null,
	lastPublishDate datetime null
) engine InnoDB;

create table BlogsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	title varchar(150) null,
	subtitle longtext null,
	urlTitle varchar(150) null,
	description longtext null,
	content longtext null,
	displayDate datetime null,
	allowPingbacks tinyint,
	allowTrackbacks tinyint,
	trackbacks longtext null,
	coverImageCaption longtext null,
	coverImageFileEntryId bigint,
	coverImageURL longtext null,
	smallImage tinyint,
	smallImageFileEntryId bigint,
	smallImageId bigint,
	smallImageURL longtext null,
	lastPublishDate datetime null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table BlogsStatsUser (
	statsUserId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	entryCount integer,
	lastPostDate datetime null,
	ratingsTotalEntries integer,
	ratingsTotalScore double,
	ratingsAverageScore double
) engine InnoDB;

create table BrowserTracker (
	mvccVersion bigint default 0 not null,
	browserTrackerId bigint not null primary key,
	companyId bigint,
	userId bigint,
	browserKey bigint
) engine InnoDB;

create table ClassName_ (
	mvccVersion bigint default 0 not null,
	classNameId bigint not null primary key,
	value varchar(200) null
) engine InnoDB;

create table ClusterGroup (
	mvccVersion bigint default 0 not null,
	clusterGroupId bigint not null primary key,
	name varchar(75) null,
	clusterNodeIds varchar(75) null,
	wholeCluster tinyint
) engine InnoDB;

create table Company (
	mvccVersion bigint default 0 not null,
	companyId bigint not null primary key,
	accountId bigint,
	webId varchar(75) null,
	key_ longtext null,
	mx varchar(75) null,
	homeURL longtext null,
	logoId bigint,
	system tinyint,
	maxUsers integer,
	active_ tinyint
) engine InnoDB;

create table Contact_ (
	mvccVersion bigint default 0 not null,
	contactId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	accountId bigint,
	parentContactId bigint,
	emailAddress varchar(75) null,
	firstName varchar(75) null,
	middleName varchar(75) null,
	lastName varchar(75) null,
	prefixId bigint,
	suffixId bigint,
	male tinyint,
	birthday datetime null,
	smsSn varchar(75) null,
	facebookSn varchar(75) null,
	jabberSn varchar(75) null,
	skypeSn varchar(75) null,
	twitterSn varchar(75) null,
	employeeStatusId varchar(75) null,
	employeeNumber varchar(75) null,
	jobTitle varchar(100) null,
	jobClass varchar(75) null,
	hoursOfOperation varchar(75) null
) engine InnoDB;

create table Counter (
	name varchar(75) not null primary key,
	currentId bigint
) engine InnoDB;

create table Country (
	mvccVersion bigint default 0 not null,
	countryId bigint not null primary key,
	name varchar(75) null,
	a2 varchar(75) null,
	a3 varchar(75) null,
	number_ varchar(75) null,
	idd_ varchar(75) null,
	zipRequired tinyint,
	active_ tinyint
) engine InnoDB;

create table DLContent (
	contentId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	repositoryId bigint,
	path_ varchar(255) null,
	version varchar(75) null,
	data_ longblob,
	size_ bigint
) engine InnoDB;

create table DLFileEntry (
	uuid_ varchar(75) null,
	fileEntryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	repositoryId bigint,
	folderId bigint,
	treePath longtext null,
	name varchar(255) null,
	fileName varchar(255) null,
	extension varchar(75) null,
	mimeType varchar(75) null,
	title varchar(255) null,
	description longtext null,
	extraSettings longtext null,
	fileEntryTypeId bigint,
	version varchar(75) null,
	size_ bigint,
	readCount integer,
	smallImageId bigint,
	largeImageId bigint,
	custom1ImageId bigint,
	custom2ImageId bigint,
	manualCheckInRequired tinyint,
	lastPublishDate datetime null
) engine InnoDB;

create table DLFileEntryMetadata (
	uuid_ varchar(75) null,
	fileEntryMetadataId bigint not null primary key,
	companyId bigint,
	DDMStorageId bigint,
	DDMStructureId bigint,
	fileEntryId bigint,
	fileVersionId bigint
) engine InnoDB;

create table DLFileEntryType (
	uuid_ varchar(75) null,
	fileEntryTypeId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	fileEntryTypeKey varchar(75) null,
	name longtext null,
	description longtext null,
	lastPublishDate datetime null
) engine InnoDB;

create table DLFileEntryTypes_DLFolders (
	companyId bigint not null,
	fileEntryTypeId bigint not null,
	folderId bigint not null,
	primary key (fileEntryTypeId, folderId)
) engine InnoDB;

create table DLFileRank (
	fileRankId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate datetime null,
	fileEntryId bigint,
	active_ tinyint
) engine InnoDB;

create table DLFileShortcut (
	uuid_ varchar(75) null,
	fileShortcutId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	repositoryId bigint,
	folderId bigint,
	toFileEntryId bigint,
	treePath longtext null,
	active_ tinyint,
	lastPublishDate datetime null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table DLFileVersion (
	uuid_ varchar(75) null,
	fileVersionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	repositoryId bigint,
	folderId bigint,
	fileEntryId bigint,
	treePath longtext null,
	fileName varchar(255) null,
	extension varchar(75) null,
	mimeType varchar(75) null,
	title varchar(255) null,
	description longtext null,
	changeLog varchar(75) null,
	extraSettings longtext null,
	fileEntryTypeId bigint,
	version varchar(75) null,
	size_ bigint,
	checksum varchar(75) null,
	lastPublishDate datetime null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table DLFolder (
	uuid_ varchar(75) null,
	folderId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	repositoryId bigint,
	mountPoint tinyint,
	parentFolderId bigint,
	treePath longtext null,
	name varchar(255) null,
	description longtext null,
	lastPostDate datetime null,
	defaultFileEntryTypeId bigint,
	hidden_ tinyint,
	restrictionType integer,
	lastPublishDate datetime null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table DLSyncEvent (
	syncEventId bigint not null primary key,
	companyId bigint,
	modifiedTime bigint,
	event varchar(75) null,
	type_ varchar(75) null,
	typePK bigint
) engine InnoDB;

create table EmailAddress (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	emailAddressId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	address varchar(75) null,
	typeId bigint,
	primary_ tinyint
) engine InnoDB;

create table ExpandoColumn (
	columnId bigint not null primary key,
	companyId bigint,
	tableId bigint,
	name varchar(75) null,
	type_ integer,
	defaultData longtext null,
	typeSettings longtext null
) engine InnoDB;

create table ExpandoRow (
	rowId_ bigint not null primary key,
	companyId bigint,
	modifiedDate datetime null,
	tableId bigint,
	classPK bigint
) engine InnoDB;

create table ExpandoTable (
	tableId bigint not null primary key,
	companyId bigint,
	classNameId bigint,
	name varchar(75) null
) engine InnoDB;

create table ExpandoValue (
	valueId bigint not null primary key,
	companyId bigint,
	tableId bigint,
	columnId bigint,
	rowId_ bigint,
	classNameId bigint,
	classPK bigint,
	data_ longtext null
) engine InnoDB;

create table ExportImportConfiguration (
	mvccVersion bigint default 0 not null,
	exportImportConfigurationId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(200) null,
	description longtext null,
	type_ integer,
	settings_ longtext null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table Group_ (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	groupId bigint not null primary key,
	companyId bigint,
	creatorUserId bigint,
	classNameId bigint,
	classPK bigint,
	parentGroupId bigint,
	liveGroupId bigint,
	treePath longtext null,
	groupKey varchar(150) null,
	name longtext null,
	description longtext null,
	type_ integer,
	typeSettings longtext null,
	manualMembership tinyint,
	membershipRestriction integer,
	friendlyURL varchar(255) null,
	site tinyint,
	remoteStagingGroupCount integer,
	inheritContent tinyint,
	active_ tinyint
) engine InnoDB;

create table Groups_Orgs (
	companyId bigint not null,
	groupId bigint not null,
	organizationId bigint not null,
	primary key (groupId, organizationId)
) engine InnoDB;

create table Groups_Roles (
	companyId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	primary key (groupId, roleId)
) engine InnoDB;

create table Groups_UserGroups (
	companyId bigint not null,
	groupId bigint not null,
	userGroupId bigint not null,
	primary key (groupId, userGroupId)
) engine InnoDB;

create table Image (
	mvccVersion bigint default 0 not null,
	imageId bigint not null primary key,
	companyId bigint,
	modifiedDate datetime null,
	type_ varchar(75) null,
	height integer,
	width integer,
	size_ integer
) engine InnoDB;

create table Layout (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	plid bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	privateLayout tinyint,
	layoutId bigint,
	parentLayoutId bigint,
	name longtext null,
	title longtext null,
	description longtext null,
	keywords longtext null,
	robots longtext null,
	type_ varchar(75) null,
	typeSettings longtext null,
	hidden_ tinyint,
	friendlyURL varchar(255) null,
	iconImageId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css longtext null,
	priority integer,
	layoutPrototypeUuid varchar(75) null,
	layoutPrototypeLinkEnabled tinyint,
	sourcePrototypeLayoutUuid varchar(75) null,
	lastPublishDate datetime null
) engine InnoDB;

create table LayoutBranch (
	mvccVersion bigint default 0 not null,
	layoutBranchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	layoutSetBranchId bigint,
	plid bigint,
	name varchar(75) null,
	description longtext null,
	master tinyint
) engine InnoDB;

create table LayoutFriendlyURL (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	layoutFriendlyURLId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	plid bigint,
	privateLayout tinyint,
	friendlyURL varchar(255) null,
	languageId varchar(75) null,
	lastPublishDate datetime null
) engine InnoDB;

create table LayoutPrototype (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	layoutPrototypeId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name longtext null,
	description longtext null,
	settings_ longtext null,
	active_ tinyint
) engine InnoDB;

create table LayoutRevision (
	mvccVersion bigint default 0 not null,
	layoutRevisionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	layoutSetBranchId bigint,
	layoutBranchId bigint,
	parentLayoutRevisionId bigint,
	head tinyint,
	major tinyint,
	plid bigint,
	privateLayout tinyint,
	name longtext null,
	title longtext null,
	description longtext null,
	keywords longtext null,
	robots longtext null,
	typeSettings longtext null,
	iconImageId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css longtext null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table LayoutSet (
	mvccVersion bigint default 0 not null,
	layoutSetId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	createDate datetime null,
	modifiedDate datetime null,
	privateLayout tinyint,
	logoId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css longtext null,
	pageCount integer,
	settings_ longtext null,
	layoutSetPrototypeUuid varchar(75) null,
	layoutSetPrototypeLinkEnabled tinyint
) engine InnoDB;

create table LayoutSetBranch (
	mvccVersion bigint default 0 not null,
	layoutSetBranchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	privateLayout tinyint,
	name varchar(75) null,
	description longtext null,
	master tinyint,
	logoId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css longtext null,
	settings_ longtext null,
	layoutSetPrototypeUuid varchar(75) null,
	layoutSetPrototypeLinkEnabled tinyint
) engine InnoDB;

create table LayoutSetPrototype (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	layoutSetPrototypeId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name longtext null,
	description longtext null,
	settings_ longtext null,
	active_ tinyint
) engine InnoDB;

create table ListType (
	mvccVersion bigint default 0 not null,
	listTypeId bigint not null primary key,
	name varchar(75) null,
	type_ varchar(75) null
) engine InnoDB;

create table MBBan (
	uuid_ varchar(75) null,
	banId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	banUserId bigint,
	lastPublishDate datetime null
) engine InnoDB;

create table MBCategory (
	uuid_ varchar(75) null,
	categoryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	parentCategoryId bigint,
	name varchar(75) null,
	description longtext null,
	displayStyle varchar(75) null,
	threadCount integer,
	messageCount integer,
	lastPostDate datetime null,
	lastPublishDate datetime null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table MBDiscussion (
	uuid_ varchar(75) null,
	discussionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	threadId bigint,
	lastPublishDate datetime null
) engine InnoDB;

create table MBMailingList (
	uuid_ varchar(75) null,
	mailingListId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	categoryId bigint,
	emailAddress varchar(75) null,
	inProtocol varchar(75) null,
	inServerName varchar(75) null,
	inServerPort integer,
	inUseSSL tinyint,
	inUserName varchar(75) null,
	inPassword varchar(75) null,
	inReadInterval integer,
	outEmailAddress varchar(75) null,
	outCustom tinyint,
	outServerName varchar(75) null,
	outServerPort integer,
	outUseSSL tinyint,
	outUserName varchar(75) null,
	outPassword varchar(75) null,
	allowAnonymous tinyint,
	active_ tinyint
) engine InnoDB;

create table MBMessage (
	uuid_ varchar(75) null,
	messageId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	categoryId bigint,
	threadId bigint,
	rootMessageId bigint,
	parentMessageId bigint,
	subject varchar(75) null,
	body longtext null,
	format varchar(75) null,
	anonymous tinyint,
	priority double,
	allowPingbacks tinyint,
	answer tinyint,
	lastPublishDate datetime null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table MBStatsUser (
	statsUserId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	messageCount integer,
	lastPostDate datetime null
) engine InnoDB;

create table MBThread (
	uuid_ varchar(75) null,
	threadId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	categoryId bigint,
	rootMessageId bigint,
	rootMessageUserId bigint,
	messageCount integer,
	viewCount integer,
	lastPostByUserId bigint,
	lastPostDate datetime null,
	priority double,
	question tinyint,
	lastPublishDate datetime null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;

create table MBThreadFlag (
	uuid_ varchar(75) null,
	threadFlagId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	threadId bigint,
	lastPublishDate datetime null
) engine InnoDB;

create table MembershipRequest (
	mvccVersion bigint default 0 not null,
	membershipRequestId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate datetime null,
	comments longtext null,
	replyComments longtext null,
	replyDate datetime null,
	replierUserId bigint,
	statusId bigint
) engine InnoDB;

create table Organization_ (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	organizationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	parentOrganizationId bigint,
	treePath longtext null,
	name varchar(100) null,
	type_ varchar(75) null,
	recursable tinyint,
	regionId bigint,
	countryId bigint,
	statusId bigint,
	comments longtext null,
	logoId bigint
) engine InnoDB;

create table OrgGroupRole (
	mvccVersion bigint default 0 not null,
	organizationId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	companyId bigint,
	primary key (organizationId, groupId, roleId)
) engine InnoDB;

create table OrgLabor (
	mvccVersion bigint default 0 not null,
	orgLaborId bigint not null primary key,
	companyId bigint,
	organizationId bigint,
	typeId bigint,
	sunOpen integer,
	sunClose integer,
	monOpen integer,
	monClose integer,
	tueOpen integer,
	tueClose integer,
	wedOpen integer,
	wedClose integer,
	thuOpen integer,
	thuClose integer,
	friOpen integer,
	friClose integer,
	satOpen integer,
	satClose integer
) engine InnoDB;

create table PasswordPolicy (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	passwordPolicyId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	defaultPolicy tinyint,
	name varchar(75) null,
	description longtext null,
	changeable tinyint,
	changeRequired tinyint,
	minAge bigint,
	checkSyntax tinyint,
	allowDictionaryWords tinyint,
	minAlphanumeric integer,
	minLength integer,
	minLowerCase integer,
	minNumbers integer,
	minSymbols integer,
	minUpperCase integer,
	regex varchar(75) null,
	history tinyint,
	historyCount integer,
	expireable tinyint,
	maxAge bigint,
	warningTime bigint,
	graceLimit integer,
	lockout tinyint,
	maxFailure integer,
	lockoutDuration bigint,
	requireUnlock tinyint,
	resetFailureCount bigint,
	resetTicketMaxAge bigint
) engine InnoDB;

create table PasswordPolicyRel (
	mvccVersion bigint default 0 not null,
	passwordPolicyRelId bigint not null primary key,
	companyId bigint,
	passwordPolicyId bigint,
	classNameId bigint,
	classPK bigint
) engine InnoDB;

create table PasswordTracker (
	mvccVersion bigint default 0 not null,
	passwordTrackerId bigint not null primary key,
	companyId bigint,
	userId bigint,
	createDate datetime null,
	password_ varchar(75) null
) engine InnoDB;

create table Phone (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	phoneId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	number_ varchar(75) null,
	extension varchar(75) null,
	typeId bigint,
	primary_ tinyint
) engine InnoDB;

create table PluginSetting (
	mvccVersion bigint default 0 not null,
	pluginSettingId bigint not null primary key,
	companyId bigint,
	pluginId varchar(75) null,
	pluginType varchar(75) null,
	roles longtext null,
	active_ tinyint
) engine InnoDB;

create table PortalPreferences (
	mvccVersion bigint default 0 not null,
	portalPreferencesId bigint not null primary key,
	ownerId bigint,
	ownerType integer,
	preferences longtext null
) engine InnoDB;

create table Portlet (
	mvccVersion bigint default 0 not null,
	id_ bigint not null primary key,
	companyId bigint,
	portletId varchar(200) null,
	roles longtext null,
	active_ tinyint
) engine InnoDB;

create table PortletItem (
	mvccVersion bigint default 0 not null,
	portletItemId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	portletId varchar(200) null,
	classNameId bigint
) engine InnoDB;

create table PortletPreferences (
	mvccVersion bigint default 0 not null,
	portletPreferencesId bigint not null primary key,
	companyId bigint,
	ownerId bigint,
	ownerType integer,
	plid bigint,
	portletId varchar(200) null,
	preferences longtext null
) engine InnoDB;

create table RatingsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	score double
) engine InnoDB;

create table RatingsStats (
	statsId bigint not null primary key,
	companyId bigint,
	classNameId bigint,
	classPK bigint,
	totalEntries integer,
	totalScore double,
	averageScore double
) engine InnoDB;

create table RecentLayoutBranch (
	mvccVersion bigint default 0 not null,
	recentLayoutBranchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	layoutBranchId bigint,
	layoutSetBranchId bigint,
	plid bigint
) engine InnoDB;

create table RecentLayoutRevision (
	mvccVersion bigint default 0 not null,
	recentLayoutRevisionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	layoutRevisionId bigint,
	layoutSetBranchId bigint,
	plid bigint
) engine InnoDB;

create table RecentLayoutSetBranch (
	mvccVersion bigint default 0 not null,
	recentLayoutSetBranchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	layoutSetBranchId bigint,
	layoutSetId bigint
) engine InnoDB;

create table Region (
	mvccVersion bigint default 0 not null,
	regionId bigint not null primary key,
	countryId bigint,
	regionCode varchar(75) null,
	name varchar(75) null,
	active_ tinyint
) engine InnoDB;

create table Release_ (
	mvccVersion bigint default 0 not null,
	releaseId bigint not null primary key,
	createDate datetime null,
	modifiedDate datetime null,
	servletContextName varchar(75) null,
	schemaVersion varchar(75) null,
	buildNumber integer,
	buildDate datetime null,
	verified tinyint,
	state_ integer,
	testString varchar(1024) null
) engine InnoDB;

create table Repository (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	repositoryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	name varchar(75) null,
	description longtext null,
	portletId varchar(200) null,
	typeSettings longtext null,
	dlFolderId bigint,
	lastPublishDate datetime null
) engine InnoDB;

create table RepositoryEntry (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	repositoryEntryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	repositoryId bigint,
	mappedId varchar(255) null,
	manualCheckInRequired tinyint,
	lastPublishDate datetime null
) engine InnoDB;

create table ResourceAction (
	mvccVersion bigint default 0 not null,
	resourceActionId bigint not null primary key,
	name varchar(255) null,
	actionId varchar(75) null,
	bitwiseValue bigint
) engine InnoDB;

create table ResourceBlock (
	mvccVersion bigint default 0 not null,
	resourceBlockId bigint not null primary key,
	companyId bigint,
	groupId bigint,
	name varchar(75) null,
	permissionsHash varchar(75) null,
	referenceCount bigint
) engine InnoDB;

create table ResourceBlockPermission (
	mvccVersion bigint default 0 not null,
	resourceBlockPermissionId bigint not null primary key,
	companyId bigint,
	resourceBlockId bigint,
	roleId bigint,
	actionIds bigint
) engine InnoDB;

create table ResourcePermission (
	mvccVersion bigint default 0 not null,
	resourcePermissionId bigint not null primary key,
	companyId bigint,
	name varchar(255) null,
	scope integer,
	primKey varchar(255) null,
	primKeyId bigint,
	roleId bigint,
	ownerId bigint,
	actionIds bigint,
	viewActionId tinyint
) engine InnoDB;

create table ResourceTypePermission (
	mvccVersion bigint default 0 not null,
	resourceTypePermissionId bigint not null primary key,
	companyId bigint,
	groupId bigint,
	name varchar(75) null,
	roleId bigint,
	actionIds bigint
) engine InnoDB;

create table Role_ (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	roleId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	name varchar(75) null,
	title longtext null,
	description longtext null,
	type_ integer,
	subtype varchar(75) null
) engine InnoDB;

create table ServiceComponent (
	mvccVersion bigint default 0 not null,
	serviceComponentId bigint not null primary key,
	buildNamespace varchar(75) null,
	buildNumber bigint,
	buildDate bigint,
	data_ longtext null
) engine InnoDB;

create table SocialActivity (
	activityId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate bigint,
	activitySetId bigint,
	mirrorActivityId bigint,
	classNameId bigint,
	classPK bigint,
	parentClassNameId bigint,
	parentClassPK bigint,
	type_ integer,
	extraData longtext null,
	receiverUserId bigint
) engine InnoDB;

create table SocialActivityAchievement (
	activityAchievementId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate bigint,
	name varchar(75) null,
	firstInGroup tinyint
) engine InnoDB;

create table SocialActivityCounter (
	activityCounterId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	classNameId bigint,
	classPK bigint,
	name varchar(75) null,
	ownerType integer,
	currentValue integer,
	totalValue integer,
	graceValue integer,
	startPeriod integer,
	endPeriod integer,
	active_ tinyint
) engine InnoDB;

create table SocialActivityLimit (
	activityLimitId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	classNameId bigint,
	classPK bigint,
	activityType integer,
	activityCounterName varchar(75) null,
	value varchar(75) null
) engine InnoDB;

create table SocialActivitySet (
	activitySetId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate bigint,
	modifiedDate bigint,
	classNameId bigint,
	classPK bigint,
	type_ integer,
	extraData longtext null,
	activityCount integer
) engine InnoDB;

create table SocialActivitySetting (
	activitySettingId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	classNameId bigint,
	activityType integer,
	name varchar(75) null,
	value varchar(1024) null
) engine InnoDB;

create table SocialRelation (
	uuid_ varchar(75) null,
	relationId bigint not null primary key,
	companyId bigint,
	createDate bigint,
	userId1 bigint,
	userId2 bigint,
	type_ integer
) engine InnoDB;

create table SocialRequest (
	uuid_ varchar(75) null,
	requestId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate bigint,
	modifiedDate bigint,
	classNameId bigint,
	classPK bigint,
	type_ integer,
	extraData longtext null,
	receiverUserId bigint,
	status integer
) engine InnoDB;

create table Subscription (
	mvccVersion bigint default 0 not null,
	subscriptionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	frequency varchar(75) null
) engine InnoDB;

create table SystemEvent (
	mvccVersion bigint default 0 not null,
	systemEventId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	classNameId bigint,
	classPK bigint,
	classUuid varchar(75) null,
	referrerClassNameId bigint,
	parentSystemEventId bigint,
	systemEventSetKey bigint,
	type_ integer,
	extraData longtext null
) engine InnoDB;

create table Team (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	teamId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	groupId bigint,
	name varchar(75) null,
	description longtext null,
	lastPublishDate datetime null
) engine InnoDB;

create table Ticket (
	mvccVersion bigint default 0 not null,
	ticketId bigint not null primary key,
	companyId bigint,
	createDate datetime null,
	classNameId bigint,
	classPK bigint,
	key_ varchar(75) null,
	type_ integer,
	extraInfo longtext null,
	expirationDate datetime null
) engine InnoDB;

create table TrashEntry (
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	classNameId bigint,
	classPK bigint,
	systemEventSetKey bigint,
	typeSettings longtext null,
	status integer
) engine InnoDB;

create table TrashVersion (
	versionId bigint not null primary key,
	companyId bigint,
	entryId bigint,
	classNameId bigint,
	classPK bigint,
	typeSettings longtext null,
	status integer
) engine InnoDB;

create table UserNotificationDelivery (
	mvccVersion bigint default 0 not null,
	userNotificationDeliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	portletId varchar(200) null,
	classNameId bigint,
	notificationType integer,
	deliveryType integer,
	deliver tinyint
) engine InnoDB;

create table User_ (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	userId bigint not null primary key,
	companyId bigint,
	createDate datetime null,
	modifiedDate datetime null,
	defaultUser tinyint,
	contactId bigint,
	password_ varchar(75) null,
	passwordEncrypted tinyint,
	passwordReset tinyint,
	passwordModifiedDate datetime null,
	digest varchar(255) null,
	reminderQueryQuestion varchar(75) null,
	reminderQueryAnswer varchar(75) null,
	graceLoginCount integer,
	screenName varchar(75) null,
	emailAddress varchar(75) null,
	facebookId bigint,
	googleUserId varchar(75) null,
	ldapServerId bigint,
	openId varchar(1024) null,
	portraitId bigint,
	languageId varchar(75) null,
	timeZoneId varchar(75) null,
	greeting varchar(255) null,
	comments longtext null,
	firstName varchar(75) null,
	middleName varchar(75) null,
	lastName varchar(75) null,
	jobTitle varchar(100) null,
	loginDate datetime null,
	loginIP varchar(75) null,
	lastLoginDate datetime null,
	lastLoginIP varchar(75) null,
	lastFailedLoginDate datetime null,
	failedLoginAttempts integer,
	lockout tinyint,
	lockoutDate datetime null,
	agreedToTermsOfUse tinyint,
	emailAddressVerified tinyint,
	status integer
) engine InnoDB;

create table UserGroup (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	userGroupId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	parentUserGroupId bigint,
	name varchar(75) null,
	description longtext null,
	addedByLDAPImport tinyint
) engine InnoDB;

create table UserGroupGroupRole (
	mvccVersion bigint default 0 not null,
	userGroupId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	companyId bigint,
	primary key (userGroupId, groupId, roleId)
) engine InnoDB;

create table UserGroupRole (
	mvccVersion bigint default 0 not null,
	userId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	companyId bigint,
	primary key (userId, groupId, roleId)
) engine InnoDB;

create table UserGroups_Teams (
	companyId bigint not null,
	teamId bigint not null,
	userGroupId bigint not null,
	primary key (teamId, userGroupId)
) engine InnoDB;

create table UserIdMapper (
	mvccVersion bigint default 0 not null,
	userIdMapperId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(75) null,
	description varchar(75) null,
	externalUserId varchar(75) null
) engine InnoDB;

create table UserNotificationEvent (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	userNotificationEventId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(200) null,
	timestamp bigint,
	deliveryType integer,
	deliverBy bigint,
	delivered tinyint,
	payload longtext null,
	actionRequired tinyint,
	archived tinyint
) engine InnoDB;

create table Users_Groups (
	companyId bigint not null,
	groupId bigint not null,
	userId bigint not null,
	primary key (groupId, userId)
) engine InnoDB;

create table Users_Orgs (
	companyId bigint not null,
	organizationId bigint not null,
	userId bigint not null,
	primary key (organizationId, userId)
) engine InnoDB;

create table Users_Roles (
	companyId bigint not null,
	roleId bigint not null,
	userId bigint not null,
	primary key (roleId, userId)
) engine InnoDB;

create table Users_Teams (
	companyId bigint not null,
	teamId bigint not null,
	userId bigint not null,
	primary key (teamId, userId)
) engine InnoDB;

create table Users_UserGroups (
	companyId bigint not null,
	userId bigint not null,
	userGroupId bigint not null,
	primary key (userId, userGroupId)
) engine InnoDB;

create table UserTracker (
	mvccVersion bigint default 0 not null,
	userTrackerId bigint not null primary key,
	companyId bigint,
	userId bigint,
	modifiedDate datetime null,
	sessionId varchar(200) null,
	remoteAddr varchar(75) null,
	remoteHost varchar(75) null,
	userAgent varchar(200) null
) engine InnoDB;

create table UserTrackerPath (
	mvccVersion bigint default 0 not null,
	userTrackerPathId bigint not null primary key,
	companyId bigint,
	userTrackerId bigint,
	path_ longtext null,
	pathDate datetime null
) engine InnoDB;

create table VirtualHost (
	mvccVersion bigint default 0 not null,
	virtualHostId bigint not null primary key,
	companyId bigint,
	layoutSetId bigint,
	hostname varchar(75) null
) engine InnoDB;

create table WebDAVProps (
	mvccVersion bigint default 0 not null,
	webDavPropsId bigint not null primary key,
	companyId bigint,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	props longtext null
) engine InnoDB;

create table Website (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	websiteId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	url longtext null,
	typeId bigint,
	primary_ tinyint,
	lastPublishDate datetime null
) engine InnoDB;

create table WorkflowDefinitionLink (
	mvccVersion bigint default 0 not null,
	workflowDefinitionLinkId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	typePK bigint,
	workflowDefinitionName varchar(75) null,
	workflowDefinitionVersion integer
) engine InnoDB;

create table WorkflowInstanceLink (
	mvccVersion bigint default 0 not null,
	workflowInstanceLinkId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	classNameId bigint,
	classPK bigint,
	workflowInstanceId bigint
) engine InnoDB;
