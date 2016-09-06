drop database lportal;
create database lportal encoding = 'UNICODE';
\c lportal;

create table Account_ (
	mvccVersion bigint default 0 not null,
	accountId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
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
);

create table Address (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	addressId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
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
	mailing bool,
	primary_ bool
);

create table AnnouncementsDelivery (
	deliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(75) null,
	email bool,
	sms bool,
	website bool
);

create table AnnouncementsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	title varchar(75) null,
	content text null,
	url text null,
	type_ varchar(75) null,
	displayDate timestamp null,
	expirationDate timestamp null,
	priority integer,
	alert bool
);

create table AnnouncementsFlag (
	flagId bigint not null primary key,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	entryId bigint,
	value integer
);

create table AssetCategory (
	uuid_ varchar(75) null,
	categoryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentCategoryId bigint,
	leftCategoryId bigint,
	rightCategoryId bigint,
	name varchar(75) null,
	title text null,
	description text null,
	vocabularyId bigint,
	lastPublishDate timestamp null
);

create table AssetCategoryProperty (
	categoryPropertyId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	categoryId bigint,
	key_ varchar(75) null,
	value varchar(75) null
);

create table AssetEntries_AssetCategories (
	companyId bigint not null,
	categoryId bigint not null,
	entryId bigint not null,
	primary key (categoryId, entryId)
);

create table AssetEntries_AssetTags (
	companyId bigint not null,
	entryId bigint not null,
	tagId bigint not null,
	primary key (entryId, tagId)
);

create table AssetEntry (
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	classUuid varchar(75) null,
	classTypeId bigint,
	listable bool,
	visible bool,
	startDate timestamp null,
	endDate timestamp null,
	publishDate timestamp null,
	expirationDate timestamp null,
	mimeType varchar(75) null,
	title text null,
	description text null,
	summary text null,
	url text null,
	layoutUuid varchar(75) null,
	height integer,
	width integer,
	priority double precision,
	viewCount integer
);

create table AssetLink (
	linkId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	entryId1 bigint,
	entryId2 bigint,
	type_ integer,
	weight integer
);

create table AssetTag (
	uuid_ varchar(75) null,
	tagId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	assetCount integer,
	lastPublishDate timestamp null
);

create table AssetTagStats (
	tagStatsId bigint not null primary key,
	companyId bigint,
	tagId bigint,
	classNameId bigint,
	assetCount integer
);

create table AssetVocabulary (
	uuid_ varchar(75) null,
	vocabularyId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	title text null,
	description text null,
	settings_ text null,
	lastPublishDate timestamp null
);

create table BlogsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	title varchar(150) null,
	subtitle text null,
	urlTitle varchar(150) null,
	description text null,
	content text null,
	displayDate timestamp null,
	allowPingbacks bool,
	allowTrackbacks bool,
	trackbacks text null,
	coverImageCaption text null,
	coverImageFileEntryId bigint,
	coverImageURL text null,
	smallImage bool,
	smallImageFileEntryId bigint,
	smallImageId bigint,
	smallImageURL text null,
	lastPublishDate timestamp null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table BlogsStatsUser (
	statsUserId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	entryCount integer,
	lastPostDate timestamp null,
	ratingsTotalEntries integer,
	ratingsTotalScore double precision,
	ratingsAverageScore double precision
);

create table BrowserTracker (
	mvccVersion bigint default 0 not null,
	browserTrackerId bigint not null primary key,
	companyId bigint,
	userId bigint,
	browserKey bigint
);

create table ClassName_ (
	mvccVersion bigint default 0 not null,
	classNameId bigint not null primary key,
	value varchar(200) null
);

create table ClusterGroup (
	mvccVersion bigint default 0 not null,
	clusterGroupId bigint not null primary key,
	name varchar(75) null,
	clusterNodeIds varchar(75) null,
	wholeCluster bool
);

create table Company (
	mvccVersion bigint default 0 not null,
	companyId bigint not null primary key,
	accountId bigint,
	webId varchar(75) null,
	key_ text null,
	mx varchar(75) null,
	homeURL text null,
	logoId bigint,
	system bool,
	maxUsers integer,
	active_ bool
);

create table Contact_ (
	mvccVersion bigint default 0 not null,
	contactId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
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
	male bool,
	birthday timestamp null,
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
);

create table Counter (
	name varchar(75) not null primary key,
	currentId bigint
);

create table Country (
	mvccVersion bigint default 0 not null,
	countryId bigint not null primary key,
	name varchar(75) null,
	a2 varchar(75) null,
	a3 varchar(75) null,
	number_ varchar(75) null,
	idd_ varchar(75) null,
	zipRequired bool,
	active_ bool
);

create table DLContent (
	contentId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	repositoryId bigint,
	path_ varchar(255) null,
	version varchar(75) null,
	data_ oid,
	size_ bigint
);

create table DLFileEntry (
	uuid_ varchar(75) null,
	fileEntryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	repositoryId bigint,
	folderId bigint,
	treePath text null,
	name varchar(255) null,
	fileName varchar(255) null,
	extension varchar(75) null,
	mimeType varchar(75) null,
	title varchar(255) null,
	description text null,
	extraSettings text null,
	fileEntryTypeId bigint,
	version varchar(75) null,
	size_ bigint,
	readCount integer,
	smallImageId bigint,
	largeImageId bigint,
	custom1ImageId bigint,
	custom2ImageId bigint,
	manualCheckInRequired bool,
	lastPublishDate timestamp null
);

create table DLFileEntryMetadata (
	uuid_ varchar(75) null,
	fileEntryMetadataId bigint not null primary key,
	companyId bigint,
	DDMStorageId bigint,
	DDMStructureId bigint,
	fileEntryId bigint,
	fileVersionId bigint
);

create table DLFileEntryType (
	uuid_ varchar(75) null,
	fileEntryTypeId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	fileEntryTypeKey varchar(75) null,
	name text null,
	description text null,
	lastPublishDate timestamp null
);

create table DLFileEntryTypes_DLFolders (
	companyId bigint not null,
	fileEntryTypeId bigint not null,
	folderId bigint not null,
	primary key (fileEntryTypeId, folderId)
);

create table DLFileRank (
	fileRankId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	fileEntryId bigint,
	active_ bool
);

create table DLFileShortcut (
	uuid_ varchar(75) null,
	fileShortcutId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	repositoryId bigint,
	folderId bigint,
	toFileEntryId bigint,
	treePath text null,
	active_ bool,
	lastPublishDate timestamp null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table DLFileVersion (
	uuid_ varchar(75) null,
	fileVersionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	repositoryId bigint,
	folderId bigint,
	fileEntryId bigint,
	treePath text null,
	fileName varchar(255) null,
	extension varchar(75) null,
	mimeType varchar(75) null,
	title varchar(255) null,
	description text null,
	changeLog varchar(75) null,
	extraSettings text null,
	fileEntryTypeId bigint,
	version varchar(75) null,
	size_ bigint,
	checksum varchar(75) null,
	lastPublishDate timestamp null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table DLFolder (
	uuid_ varchar(75) null,
	folderId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	repositoryId bigint,
	mountPoint bool,
	parentFolderId bigint,
	treePath text null,
	name varchar(255) null,
	description text null,
	lastPostDate timestamp null,
	defaultFileEntryTypeId bigint,
	hidden_ bool,
	restrictionType integer,
	lastPublishDate timestamp null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table DLSyncEvent (
	syncEventId bigint not null primary key,
	companyId bigint,
	modifiedTime bigint,
	event varchar(75) null,
	type_ varchar(75) null,
	typePK bigint
);

create table EmailAddress (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	emailAddressId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	address varchar(75) null,
	typeId bigint,
	primary_ bool
);

create table ExpandoColumn (
	columnId bigint not null primary key,
	companyId bigint,
	tableId bigint,
	name varchar(75) null,
	type_ integer,
	defaultData text null,
	typeSettings text null
);

create table ExpandoRow (
	rowId_ bigint not null primary key,
	companyId bigint,
	modifiedDate timestamp null,
	tableId bigint,
	classPK bigint
);

create table ExpandoTable (
	tableId bigint not null primary key,
	companyId bigint,
	classNameId bigint,
	name varchar(75) null
);

create table ExpandoValue (
	valueId bigint not null primary key,
	companyId bigint,
	tableId bigint,
	columnId bigint,
	rowId_ bigint,
	classNameId bigint,
	classPK bigint,
	data_ text null
);

create table ExportImportConfiguration (
	mvccVersion bigint default 0 not null,
	exportImportConfigurationId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(200) null,
	description text null,
	type_ integer,
	settings_ text null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

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
	treePath text null,
	groupKey varchar(150) null,
	name text null,
	description text null,
	type_ integer,
	typeSettings text null,
	manualMembership bool,
	membershipRestriction integer,
	friendlyURL varchar(255) null,
	site bool,
	remoteStagingGroupCount integer,
	inheritContent bool,
	active_ bool
);

create table Groups_Orgs (
	companyId bigint not null,
	groupId bigint not null,
	organizationId bigint not null,
	primary key (groupId, organizationId)
);

create table Groups_Roles (
	companyId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	primary key (groupId, roleId)
);

create table Groups_UserGroups (
	companyId bigint not null,
	groupId bigint not null,
	userGroupId bigint not null,
	primary key (groupId, userGroupId)
);

create table Image (
	mvccVersion bigint default 0 not null,
	imageId bigint not null primary key,
	companyId bigint,
	modifiedDate timestamp null,
	type_ varchar(75) null,
	height integer,
	width integer,
	size_ integer
);

create table Layout (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	plid bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	privateLayout bool,
	layoutId bigint,
	parentLayoutId bigint,
	name text null,
	title text null,
	description text null,
	keywords text null,
	robots text null,
	type_ varchar(75) null,
	typeSettings text null,
	hidden_ bool,
	friendlyURL varchar(255) null,
	iconImageId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css text null,
	priority integer,
	layoutPrototypeUuid varchar(75) null,
	layoutPrototypeLinkEnabled bool,
	sourcePrototypeLayoutUuid varchar(75) null,
	lastPublishDate timestamp null
);

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
	description text null,
	master bool
);

create table LayoutFriendlyURL (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	layoutFriendlyURLId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	plid bigint,
	privateLayout bool,
	friendlyURL varchar(255) null,
	languageId varchar(75) null,
	lastPublishDate timestamp null
);

create table LayoutPrototype (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	layoutPrototypeId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name text null,
	description text null,
	settings_ text null,
	active_ bool
);

create table LayoutRevision (
	mvccVersion bigint default 0 not null,
	layoutRevisionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	layoutSetBranchId bigint,
	layoutBranchId bigint,
	parentLayoutRevisionId bigint,
	head bool,
	major bool,
	plid bigint,
	privateLayout bool,
	name text null,
	title text null,
	description text null,
	keywords text null,
	robots text null,
	typeSettings text null,
	iconImageId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css text null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table LayoutSet (
	mvccVersion bigint default 0 not null,
	layoutSetId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	privateLayout bool,
	logoId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css text null,
	pageCount integer,
	settings_ text null,
	layoutSetPrototypeUuid varchar(75) null,
	layoutSetPrototypeLinkEnabled bool
);

create table LayoutSetBranch (
	mvccVersion bigint default 0 not null,
	layoutSetBranchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	privateLayout bool,
	name varchar(75) null,
	description text null,
	master bool,
	logoId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css text null,
	settings_ text null,
	layoutSetPrototypeUuid varchar(75) null,
	layoutSetPrototypeLinkEnabled bool
);

create table LayoutSetPrototype (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	layoutSetPrototypeId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name text null,
	description text null,
	settings_ text null,
	active_ bool
);

create table ListType (
	mvccVersion bigint default 0 not null,
	listTypeId bigint not null primary key,
	name varchar(75) null,
	type_ varchar(75) null
);

create table MBBan (
	uuid_ varchar(75) null,
	banId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	banUserId bigint,
	lastPublishDate timestamp null
);

create table MBCategory (
	uuid_ varchar(75) null,
	categoryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentCategoryId bigint,
	name varchar(75) null,
	description text null,
	displayStyle varchar(75) null,
	threadCount integer,
	messageCount integer,
	lastPostDate timestamp null,
	lastPublishDate timestamp null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table MBDiscussion (
	uuid_ varchar(75) null,
	discussionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	threadId bigint,
	lastPublishDate timestamp null
);

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
	inServerPort integer,
	inUseSSL bool,
	inUserName varchar(75) null,
	inPassword varchar(75) null,
	inReadInterval integer,
	outEmailAddress varchar(75) null,
	outCustom bool,
	outServerName varchar(75) null,
	outServerPort integer,
	outUseSSL bool,
	outUserName varchar(75) null,
	outPassword varchar(75) null,
	allowAnonymous bool,
	active_ bool
);

create table MBMessage (
	uuid_ varchar(75) null,
	messageId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	categoryId bigint,
	threadId bigint,
	rootMessageId bigint,
	parentMessageId bigint,
	subject varchar(75) null,
	body text null,
	format varchar(75) null,
	anonymous bool,
	priority double precision,
	allowPingbacks bool,
	answer bool,
	lastPublishDate timestamp null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table MBStatsUser (
	statsUserId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	messageCount integer,
	lastPostDate timestamp null
);

create table MBThread (
	uuid_ varchar(75) null,
	threadId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	categoryId bigint,
	rootMessageId bigint,
	rootMessageUserId bigint,
	messageCount integer,
	viewCount integer,
	lastPostByUserId bigint,
	lastPostDate timestamp null,
	priority double precision,
	question bool,
	lastPublishDate timestamp null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table MBThreadFlag (
	uuid_ varchar(75) null,
	threadFlagId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	threadId bigint,
	lastPublishDate timestamp null
);

create table MembershipRequest (
	mvccVersion bigint default 0 not null,
	membershipRequestId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	comments text null,
	replyComments text null,
	replyDate timestamp null,
	replierUserId bigint,
	statusId bigint
);

create table Organization_ (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	organizationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentOrganizationId bigint,
	treePath text null,
	name varchar(100) null,
	type_ varchar(75) null,
	recursable bool,
	regionId bigint,
	countryId bigint,
	statusId bigint,
	comments text null,
	logoId bigint
);

create table OrgGroupRole (
	mvccVersion bigint default 0 not null,
	organizationId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	companyId bigint,
	primary key (organizationId, groupId, roleId)
);

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
);

create table PasswordPolicy (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	passwordPolicyId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	defaultPolicy bool,
	name varchar(75) null,
	description text null,
	changeable bool,
	changeRequired bool,
	minAge bigint,
	checkSyntax bool,
	allowDictionaryWords bool,
	minAlphanumeric integer,
	minLength integer,
	minLowerCase integer,
	minNumbers integer,
	minSymbols integer,
	minUpperCase integer,
	regex varchar(75) null,
	history bool,
	historyCount integer,
	expireable bool,
	maxAge bigint,
	warningTime bigint,
	graceLimit integer,
	lockout bool,
	maxFailure integer,
	lockoutDuration bigint,
	requireUnlock bool,
	resetFailureCount bigint,
	resetTicketMaxAge bigint
);

create table PasswordPolicyRel (
	mvccVersion bigint default 0 not null,
	passwordPolicyRelId bigint not null primary key,
	companyId bigint,
	passwordPolicyId bigint,
	classNameId bigint,
	classPK bigint
);

create table PasswordTracker (
	mvccVersion bigint default 0 not null,
	passwordTrackerId bigint not null primary key,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	password_ varchar(75) null
);

create table Phone (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	phoneId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	number_ varchar(75) null,
	extension varchar(75) null,
	typeId bigint,
	primary_ bool
);

create table PluginSetting (
	mvccVersion bigint default 0 not null,
	pluginSettingId bigint not null primary key,
	companyId bigint,
	pluginId varchar(75) null,
	pluginType varchar(75) null,
	roles text null,
	active_ bool
);

create table PortalPreferences (
	mvccVersion bigint default 0 not null,
	portalPreferencesId bigint not null primary key,
	ownerId bigint,
	ownerType integer,
	preferences text null
);

create table Portlet (
	mvccVersion bigint default 0 not null,
	id_ bigint not null primary key,
	companyId bigint,
	portletId varchar(200) null,
	roles text null,
	active_ bool
);

create table PortletItem (
	mvccVersion bigint default 0 not null,
	portletItemId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	portletId varchar(200) null,
	classNameId bigint
);

create table PortletPreferences (
	mvccVersion bigint default 0 not null,
	portletPreferencesId bigint not null primary key,
	companyId bigint,
	ownerId bigint,
	ownerType integer,
	plid bigint,
	portletId varchar(200) null,
	preferences text null
);

create table RatingsEntry (
	uuid_ varchar(75) null,
	entryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	score double precision
);

create table RatingsStats (
	statsId bigint not null primary key,
	companyId bigint,
	classNameId bigint,
	classPK bigint,
	totalEntries integer,
	totalScore double precision,
	averageScore double precision
);

create table RecentLayoutBranch (
	mvccVersion bigint default 0 not null,
	recentLayoutBranchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	layoutBranchId bigint,
	layoutSetBranchId bigint,
	plid bigint
);

create table RecentLayoutRevision (
	mvccVersion bigint default 0 not null,
	recentLayoutRevisionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	layoutRevisionId bigint,
	layoutSetBranchId bigint,
	plid bigint
);

create table RecentLayoutSetBranch (
	mvccVersion bigint default 0 not null,
	recentLayoutSetBranchId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	layoutSetBranchId bigint,
	layoutSetId bigint
);

create table Region (
	mvccVersion bigint default 0 not null,
	regionId bigint not null primary key,
	countryId bigint,
	regionCode varchar(75) null,
	name varchar(75) null,
	active_ bool
);

create table Release_ (
	mvccVersion bigint default 0 not null,
	releaseId bigint not null primary key,
	createDate timestamp null,
	modifiedDate timestamp null,
	servletContextName varchar(75) null,
	schemaVersion varchar(75) null,
	buildNumber integer,
	buildDate timestamp null,
	verified bool,
	state_ integer,
	testString varchar(1024) null
);

create table Repository (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	repositoryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	name varchar(75) null,
	description text null,
	portletId varchar(200) null,
	typeSettings text null,
	dlFolderId bigint,
	lastPublishDate timestamp null
);

create table RepositoryEntry (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	repositoryEntryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	repositoryId bigint,
	mappedId varchar(255) null,
	manualCheckInRequired bool,
	lastPublishDate timestamp null
);

create table ResourceAction (
	mvccVersion bigint default 0 not null,
	resourceActionId bigint not null primary key,
	name varchar(255) null,
	actionId varchar(75) null,
	bitwiseValue bigint
);

create table ResourceBlock (
	mvccVersion bigint default 0 not null,
	resourceBlockId bigint not null primary key,
	companyId bigint,
	groupId bigint,
	name varchar(75) null,
	permissionsHash varchar(75) null,
	referenceCount bigint
);

create table ResourceBlockPermission (
	mvccVersion bigint default 0 not null,
	resourceBlockPermissionId bigint not null primary key,
	companyId bigint,
	resourceBlockId bigint,
	roleId bigint,
	actionIds bigint
);

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
	viewActionId bool
);

create table ResourceTypePermission (
	mvccVersion bigint default 0 not null,
	resourceTypePermissionId bigint not null primary key,
	companyId bigint,
	groupId bigint,
	name varchar(75) null,
	roleId bigint,
	actionIds bigint
);

create table Role_ (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	roleId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	name varchar(75) null,
	title text null,
	description text null,
	type_ integer,
	subtype varchar(75) null
);

create table ServiceComponent (
	mvccVersion bigint default 0 not null,
	serviceComponentId bigint not null primary key,
	buildNamespace varchar(75) null,
	buildNumber bigint,
	buildDate bigint,
	data_ text null
);

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
	extraData text null,
	receiverUserId bigint
);

create table SocialActivityAchievement (
	activityAchievementId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate bigint,
	name varchar(75) null,
	firstInGroup bool
);

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
	active_ bool
);

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
);

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
	extraData text null,
	activityCount integer
);

create table SocialActivitySetting (
	activitySettingId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	classNameId bigint,
	activityType integer,
	name varchar(75) null,
	value varchar(1024) null
);

create table SocialRelation (
	uuid_ varchar(75) null,
	relationId bigint not null primary key,
	companyId bigint,
	createDate bigint,
	userId1 bigint,
	userId2 bigint,
	type_ integer
);

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
	extraData text null,
	receiverUserId bigint,
	status integer
);

create table Subscription (
	mvccVersion bigint default 0 not null,
	subscriptionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	frequency varchar(75) null
);

create table SystemEvent (
	mvccVersion bigint default 0 not null,
	systemEventId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	classNameId bigint,
	classPK bigint,
	classUuid varchar(75) null,
	referrerClassNameId bigint,
	parentSystemEventId bigint,
	systemEventSetKey bigint,
	type_ integer,
	extraData text null
);

create table Team (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	teamId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	groupId bigint,
	name varchar(75) null,
	description text null,
	lastPublishDate timestamp null
);

create table Ticket (
	mvccVersion bigint default 0 not null,
	ticketId bigint not null primary key,
	companyId bigint,
	createDate timestamp null,
	classNameId bigint,
	classPK bigint,
	key_ varchar(75) null,
	type_ integer,
	extraInfo text null,
	expirationDate timestamp null
);

create table TrashEntry (
	entryId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	classNameId bigint,
	classPK bigint,
	systemEventSetKey bigint,
	typeSettings text null,
	status integer
);

create table TrashVersion (
	versionId bigint not null primary key,
	companyId bigint,
	entryId bigint,
	classNameId bigint,
	classPK bigint,
	typeSettings text null,
	status integer
);

create table UserNotificationDelivery (
	mvccVersion bigint default 0 not null,
	userNotificationDeliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	portletId varchar(200) null,
	classNameId bigint,
	notificationType integer,
	deliveryType integer,
	deliver bool
);

create table User_ (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	userId bigint not null primary key,
	companyId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	defaultUser bool,
	contactId bigint,
	password_ varchar(75) null,
	passwordEncrypted bool,
	passwordReset bool,
	passwordModifiedDate timestamp null,
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
	comments text null,
	firstName varchar(75) null,
	middleName varchar(75) null,
	lastName varchar(75) null,
	jobTitle varchar(100) null,
	loginDate timestamp null,
	loginIP varchar(75) null,
	lastLoginDate timestamp null,
	lastLoginIP varchar(75) null,
	lastFailedLoginDate timestamp null,
	failedLoginAttempts integer,
	lockout bool,
	lockoutDate timestamp null,
	agreedToTermsOfUse bool,
	emailAddressVerified bool,
	status integer
);

create table UserGroup (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	userGroupId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentUserGroupId bigint,
	name varchar(75) null,
	description text null,
	addedByLDAPImport bool
);

create table UserGroupGroupRole (
	mvccVersion bigint default 0 not null,
	userGroupId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	companyId bigint,
	primary key (userGroupId, groupId, roleId)
);

create table UserGroupRole (
	mvccVersion bigint default 0 not null,
	userId bigint not null,
	groupId bigint not null,
	roleId bigint not null,
	companyId bigint,
	primary key (userId, groupId, roleId)
);

create table UserGroups_Teams (
	companyId bigint not null,
	teamId bigint not null,
	userGroupId bigint not null,
	primary key (teamId, userGroupId)
);

create table UserIdMapper (
	mvccVersion bigint default 0 not null,
	userIdMapperId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(75) null,
	description varchar(75) null,
	externalUserId varchar(75) null
);

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
	delivered bool,
	payload text null,
	actionRequired bool,
	archived bool
);

create table Users_Groups (
	companyId bigint not null,
	groupId bigint not null,
	userId bigint not null,
	primary key (groupId, userId)
);

create table Users_Orgs (
	companyId bigint not null,
	organizationId bigint not null,
	userId bigint not null,
	primary key (organizationId, userId)
);

create table Users_Roles (
	companyId bigint not null,
	roleId bigint not null,
	userId bigint not null,
	primary key (roleId, userId)
);

create table Users_Teams (
	companyId bigint not null,
	teamId bigint not null,
	userId bigint not null,
	primary key (teamId, userId)
);

create table Users_UserGroups (
	companyId bigint not null,
	userId bigint not null,
	userGroupId bigint not null,
	primary key (userId, userGroupId)
);

create table UserTracker (
	mvccVersion bigint default 0 not null,
	userTrackerId bigint not null primary key,
	companyId bigint,
	userId bigint,
	modifiedDate timestamp null,
	sessionId varchar(200) null,
	remoteAddr varchar(75) null,
	remoteHost varchar(75) null,
	userAgent varchar(200) null
);

create table UserTrackerPath (
	mvccVersion bigint default 0 not null,
	userTrackerPathId bigint not null primary key,
	companyId bigint,
	userTrackerId bigint,
	path_ text null,
	pathDate timestamp null
);

create table VirtualHost (
	mvccVersion bigint default 0 not null,
	virtualHostId bigint not null primary key,
	companyId bigint,
	layoutSetId bigint,
	hostname varchar(75) null
);

create table WebDAVProps (
	mvccVersion bigint default 0 not null,
	webDavPropsId bigint not null primary key,
	companyId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	props text null
);

create table Website (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	websiteId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	url text null,
	typeId bigint,
	primary_ bool,
	lastPublishDate timestamp null
);

create table WorkflowDefinitionLink (
	mvccVersion bigint default 0 not null,
	workflowDefinitionLinkId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	typePK bigint,
	workflowDefinitionName varchar(75) null,
	workflowDefinitionVersion integer
);

create table WorkflowInstanceLink (
	mvccVersion bigint default 0 not null,
	workflowInstanceLinkId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	classNameId bigint,
	classPK bigint,
	workflowInstanceId bigint
);


insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (1, 'canada', 'CA', 'CAN', '124', '001', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (2, 'china', 'CN', 'CHN', '156', '086', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (3, 'france', 'FR', 'FRA', '250', '033', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (4, 'germany', 'DE', 'DEU', '276', '049', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (5, 'hong-kong', 'HK', 'HKG', '344', '852', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (6, 'hungary', 'HU', 'HUN', '348', '036', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (7, 'israel', 'IL', 'ISR', '376', '972', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (8, 'italy', 'IT', 'ITA', '380', '039', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (9, 'japan', 'JP', 'JPN', '392', '081', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (10, 'south-korea', 'KR', 'KOR', '410', '082', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (11, 'netherlands', 'NL', 'NLD', '528', '031', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (12, 'portugal', 'PT', 'PRT', '620', '351', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (13, 'russia', 'RU', 'RUS', '643', '007', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (14, 'singapore', 'SG', 'SGP', '702', '065', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (15, 'spain', 'ES', 'ESP', '724', '034', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (16, 'turkey', 'TR', 'TUR', '792', '090', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (17, 'vietnam', 'VN', 'VNM', '704', '084', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (18, 'united-kingdom', 'GB', 'GBR', '826', '044', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (19, 'united-states', 'US', 'USA', '840', '001', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (20, 'afghanistan', 'AF', 'AFG', '4', '093', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (21, 'albania', 'AL', 'ALB', '8', '355', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (22, 'algeria', 'DZ', 'DZA', '12', '213', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (23, 'american-samoa', 'AS', 'ASM', '16', '684', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (24, 'andorra', 'AD', 'AND', '20', '376', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (25, 'angola', 'AO', 'AGO', '24', '244', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (26, 'anguilla', 'AI', 'AIA', '660', '264', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (27, 'antarctica', 'AQ', 'ATA', '10', '672', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (28, 'antigua-barbuda', 'AG', 'ATG', '28', '268', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (29, 'argentina', 'AR', 'ARG', '32', '054', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (30, 'armenia', 'AM', 'ARM', '51', '374', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (31, 'aruba', 'AW', 'ABW', '533', '297', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (32, 'australia', 'AU', 'AUS', '36', '061', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (33, 'austria', 'AT', 'AUT', '40', '043', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (34, 'azerbaijan', 'AZ', 'AZE', '31', '994', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (35, 'bahamas', 'BS', 'BHS', '44', '242', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (36, 'bahrain', 'BH', 'BHR', '48', '973', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (37, 'bangladesh', 'BD', 'BGD', '50', '880', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (38, 'barbados', 'BB', 'BRB', '52', '246', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (39, 'belarus', 'BY', 'BLR', '112', '375', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (40, 'belgium', 'BE', 'BEL', '56', '032', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (41, 'belize', 'BZ', 'BLZ', '84', '501', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (42, 'benin', 'BJ', 'BEN', '204', '229', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (43, 'bermuda', 'BM', 'BMU', '60', '441', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (44, 'bhutan', 'BT', 'BTN', '64', '975', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (45, 'bolivia', 'BO', 'BOL', '68', '591', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (46, 'bosnia-herzegovina', 'BA', 'BIH', '70', '387', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (47, 'botswana', 'BW', 'BWA', '72', '267', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (48, 'brazil', 'BR', 'BRA', '76', '055', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (49, 'british-virgin-islands', 'VG', 'VGB', '92', '284', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (50, 'brunei', 'BN', 'BRN', '96', '673', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (51, 'bulgaria', 'BG', 'BGR', '100', '359', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (52, 'burkina-faso', 'BF', 'BFA', '854', '226', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (53, 'burma-myanmar', 'MM', 'MMR', '104', '095', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (54, 'burundi', 'BI', 'BDI', '108', '257', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (55, 'cambodia', 'KH', 'KHM', '116', '855', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (56, 'cameroon', 'CM', 'CMR', '120', '237', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (57, 'cape-verde-island', 'CV', 'CPV', '132', '238', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (58, 'cayman-islands', 'KY', 'CYM', '136', '345', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (59, 'central-african-republic', 'CF', 'CAF', '140', '236', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (60, 'chad', 'TD', 'TCD', '148', '235', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (61, 'chile', 'CL', 'CHL', '152', '056', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (62, 'christmas-island', 'CX', 'CXR', '162', '061', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (63, 'cocos-islands', 'CC', 'CCK', '166', '061', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (64, 'colombia', 'CO', 'COL', '170', '057', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (65, 'comoros', 'KM', 'COM', '174', '269', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (66, 'republic-of-congo', 'CD', 'COD', '180', '242', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (67, 'democratic-republic-of-congo', 'CG', 'COG', '178', '243', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (68, 'cook-islands', 'CK', 'COK', '184', '682', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (69, 'costa-rica', 'CR', 'CRI', '188', '506', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (70, 'croatia', 'HR', 'HRV', '191', '385', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (71, 'cuba', 'CU', 'CUB', '192', '053', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (72, 'cyprus', 'CY', 'CYP', '196', '357', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (73, 'czech-republic', 'CZ', 'CZE', '203', '420', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (74, 'denmark', 'DK', 'DNK', '208', '045', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (75, 'djibouti', 'DJ', 'DJI', '262', '253', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (76, 'dominica', 'DM', 'DMA', '212', '767', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (77, 'dominican-republic', 'DO', 'DOM', '214', '809', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (78, 'ecuador', 'EC', 'ECU', '218', '593', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (79, 'egypt', 'EG', 'EGY', '818', '020', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (80, 'el-salvador', 'SV', 'SLV', '222', '503', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (81, 'equatorial-guinea', 'GQ', 'GNQ', '226', '240', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (82, 'eritrea', 'ER', 'ERI', '232', '291', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (83, 'estonia', 'EE', 'EST', '233', '372', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (84, 'ethiopia', 'ET', 'ETH', '231', '251', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (85, 'faeroe-islands', 'FO', 'FRO', '234', '298', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (86, 'falkland-islands', 'FK', 'FLK', '238', '500', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (87, 'fiji-islands', 'FJ', 'FJI', '242', '679', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (88, 'finland', 'FI', 'FIN', '246', '358', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (89, 'french-guiana', 'GF', 'GUF', '254', '594', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (90, 'french-polynesia', 'PF', 'PYF', '258', '689', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (91, 'gabon', 'GA', 'GAB', '266', '241', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (92, 'gambia', 'GM', 'GMB', '270', '220', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (93, 'georgia', 'GE', 'GEO', '268', '995', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (94, 'ghana', 'GH', 'GHA', '288', '233', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (95, 'gibraltar', 'GI', 'GIB', '292', '350', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (96, 'greece', 'GR', 'GRC', '300', '030', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (97, 'greenland', 'GL', 'GRL', '304', '299', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (98, 'grenada', 'GD', 'GRD', '308', '473', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (99, 'guadeloupe', 'GP', 'GLP', '312', '590', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (100, 'guam', 'GU', 'GUM', '316', '671', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (101, 'guatemala', 'GT', 'GTM', '320', '502', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (102, 'guinea', 'GN', 'GIN', '324', '224', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (103, 'guinea-bissau', 'GW', 'GNB', '624', '245', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (104, 'guyana', 'GY', 'GUY', '328', '592', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (105, 'haiti', 'HT', 'HTI', '332', '509', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (106, 'honduras', 'HN', 'HND', '340', '504', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (107, 'iceland', 'IS', 'ISL', '352', '354', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (108, 'india', 'IN', 'IND', '356', '091', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (109, 'indonesia', 'ID', 'IDN', '360', '062', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (110, 'iran', 'IR', 'IRN', '364', '098', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (111, 'iraq', 'IQ', 'IRQ', '368', '964', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (112, 'ireland', 'IE', 'IRL', '372', '353', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (113, 'ivory-coast', 'CI', 'CIV', '384', '225', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (114, 'jamaica', 'JM', 'JAM', '388', '876', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (115, 'jordan', 'JO', 'JOR', '400', '962', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (116, 'kazakhstan', 'KZ', 'KAZ', '398', '007', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (117, 'kenya', 'KE', 'KEN', '404', '254', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (118, 'kiribati', 'KI', 'KIR', '408', '686', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (119, 'kuwait', 'KW', 'KWT', '414', '965', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (120, 'north-korea', 'KP', 'PRK', '408', '850', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (121, 'kyrgyzstan', 'KG', 'KGZ', '471', '996', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (122, 'laos', 'LA', 'LAO', '418', '856', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (123, 'latvia', 'LV', 'LVA', '428', '371', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (124, 'lebanon', 'LB', 'LBN', '422', '961', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (125, 'lesotho', 'LS', 'LSO', '426', '266', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (126, 'liberia', 'LR', 'LBR', '430', '231', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (127, 'libya', 'LY', 'LBY', '434', '218', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (128, 'liechtenstein', 'LI', 'LIE', '438', '423', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (129, 'lithuania', 'LT', 'LTU', '440', '370', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (130, 'luxembourg', 'LU', 'LUX', '442', '352', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (131, 'macau', 'MO', 'MAC', '446', '853', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (132, 'macedonia', 'MK', 'MKD', '807', '389', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (133, 'madagascar', 'MG', 'MDG', '450', '261', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (134, 'malawi', 'MW', 'MWI', '454', '265', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (135, 'malaysia', 'MY', 'MYS', '458', '060', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (136, 'maldives', 'MV', 'MDV', '462', '960', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (137, 'mali', 'ML', 'MLI', '466', '223', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (138, 'malta', 'MT', 'MLT', '470', '356', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (139, 'marshall-islands', 'MH', 'MHL', '584', '692', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (140, 'martinique', 'MQ', 'MTQ', '474', '596', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (141, 'mauritania', 'MR', 'MRT', '478', '222', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (142, 'mauritius', 'MU', 'MUS', '480', '230', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (143, 'mayotte-island', 'YT', 'MYT', '175', '269', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (144, 'mexico', 'MX', 'MEX', '484', '052', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (145, 'micronesia', 'FM', 'FSM', '583', '691', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (146, 'moldova', 'MD', 'MDA', '498', '373', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (147, 'monaco', 'MC', 'MCO', '492', '377', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (148, 'mongolia', 'MN', 'MNG', '496', '976', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (149, 'montenegro', 'ME', 'MNE', '499', '382', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (150, 'montserrat', 'MS', 'MSR', '500', '664', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (151, 'morocco', 'MA', 'MAR', '504', '212', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (152, 'mozambique', 'MZ', 'MOZ', '508', '258', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (153, 'namibia', 'NA', 'NAM', '516', '264', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (154, 'nauru', 'NR', 'NRU', '520', '674', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (155, 'nepal', 'NP', 'NPL', '524', '977', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (156, 'netherlands-antilles', 'AN', 'ANT', '530', '599', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (157, 'new-caledonia', 'NC', 'NCL', '540', '687', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (158, 'new-zealand', 'NZ', 'NZL', '554', '064', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (159, 'nicaragua', 'NI', 'NIC', '558', '505', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (160, 'niger', 'NE', 'NER', '562', '227', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (161, 'nigeria', 'NG', 'NGA', '566', '234', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (162, 'niue', 'NU', 'NIU', '570', '683', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (163, 'norfolk-island', 'NF', 'NFK', '574', '672', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (164, 'norway', 'NO', 'NOR', '578', '047', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (165, 'oman', 'OM', 'OMN', '512', '968', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (166, 'pakistan', 'PK', 'PAK', '586', '092', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (167, 'palau', 'PW', 'PLW', '585', '680', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (168, 'palestine', 'PS', 'PSE', '275', '970', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (169, 'panama', 'PA', 'PAN', '591', '507', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (170, 'papua-new-guinea', 'PG', 'PNG', '598', '675', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (171, 'paraguay', 'PY', 'PRY', '600', '595', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (172, 'peru', 'PE', 'PER', '604', '051', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (173, 'philippines', 'PH', 'PHL', '608', '063', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (174, 'poland', 'PL', 'POL', '616', '048', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (175, 'puerto-rico', 'PR', 'PRI', '630', '787', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (176, 'qatar', 'QA', 'QAT', '634', '974', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (177, 'reunion-island', 'RE', 'REU', '638', '262', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (178, 'romania', 'RO', 'ROU', '642', '040', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (179, 'rwanda', 'RW', 'RWA', '646', '250', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (180, 'st-helena', 'SH', 'SHN', '654', '290', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (181, 'st-kitts', 'KN', 'KNA', '659', '869', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (182, 'st-lucia', 'LC', 'LCA', '662', '758', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (183, 'st-pierre-miquelon', 'PM', 'SPM', '666', '508', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (184, 'st-vincent', 'VC', 'VCT', '670', '784', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (185, 'san-marino', 'SM', 'SMR', '674', '378', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (186, 'sao-tome-principe', 'ST', 'STP', '678', '239', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (187, 'saudi-arabia', 'SA', 'SAU', '682', '966', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (188, 'senegal', 'SN', 'SEN', '686', '221', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (189, 'serbia', 'RS', 'SRB', '688', '381', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (190, 'seychelles', 'SC', 'SYC', '690', '248', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (191, 'sierra-leone', 'SL', 'SLE', '694', '249', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (192, 'slovakia', 'SK', 'SVK', '703', '421', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (193, 'slovenia', 'SI', 'SVN', '705', '386', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (194, 'solomon-islands', 'SB', 'SLB', '90', '677', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (195, 'somalia', 'SO', 'SOM', '706', '252', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (196, 'south-africa', 'ZA', 'ZAF', '710', '027', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (197, 'sri-lanka', 'LK', 'LKA', '144', '094', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (198, 'sudan', 'SD', 'SDN', '736', '095', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (199, 'suriname', 'SR', 'SUR', '740', '597', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (200, 'swaziland', 'SZ', 'SWZ', '748', '268', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (201, 'sweden', 'SE', 'SWE', '752', '046', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (202, 'switzerland', 'CH', 'CHE', '756', '041', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (203, 'syria', 'SY', 'SYR', '760', '963', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (204, 'taiwan', 'TW', 'TWN', '158', '886', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (205, 'tajikistan', 'TJ', 'TJK', '762', '992', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (206, 'tanzania', 'TZ', 'TZA', '834', '255', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (207, 'thailand', 'TH', 'THA', '764', '066', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (208, 'togo', 'TG', 'TGO', '768', '228', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (209, 'tonga', 'TO', 'TON', '776', '676', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (210, 'trinidad-tobago', 'TT', 'TTO', '780', '868', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (211, 'tunisia', 'TN', 'TUN', '788', '216', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (212, 'turkmenistan', 'TM', 'TKM', '795', '993', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (213, 'turks-caicos', 'TC', 'TCA', '796', '649', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (214, 'tuvalu', 'TV', 'TUV', '798', '688', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (215, 'uganda', 'UG', 'UGA', '800', '256', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (216, 'ukraine', 'UA', 'UKR', '804', '380', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (217, 'united-arab-emirates', 'AE', 'ARE', '784', '971', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (218, 'uruguay', 'UY', 'URY', '858', '598', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (219, 'uzbekistan', 'UZ', 'UZB', '860', '998', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (220, 'vanuatu', 'VU', 'VUT', '548', '678', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (221, 'vatican-city', 'VA', 'VAT', '336', '039', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (222, 'venezuela', 'VE', 'VEN', '862', '058', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (223, 'wallis-futuna', 'WF', 'WLF', '876', '681', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (224, 'western-samoa', 'WS', 'WSM', '882', '685', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (225, 'yemen', 'YE', 'YEM', '887', '967', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (226, 'zambia', 'ZM', 'ZMB', '894', '260', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (227, 'zimbabwe', 'ZW', 'ZWE', '716', '263', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (228, 'aland-islands', 'AX', 'ALA', '248', '359', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (229, 'bonaire-st-eustatius-saba', 'BQ', 'BES', '535', '599', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (230, 'bouvet-island', 'BV', 'BVT', '74', '047', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (231, 'british-indian-ocean-territory', 'IO', 'IOT', '86', '246', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (232, 'curacao', 'CW', 'CUW', '531', '599', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (233, 'french-southern-territories', 'TF', 'ATF', '260', '033', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (234, 'guernsey', 'GG', 'GGY', '831', '044', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (235, 'heard-island-mcdonald-islands', 'HM', 'HMD', '334', '061', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (236, 'isle-of-man', 'IM', 'IMN', '833', '044', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (237, 'jersey', 'JE', 'JEY', '832', '044', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (238, 'northern-mariana-islands', 'MP', 'MNP', '580', '670', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (239, 'pitcairn', 'PN', 'PCN', '612', '649', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (240, 'south-georgia-south-sandwich-islands', 'GS', 'SGS', '239', '044', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (241, 'south-sudan', 'SS', 'SSD', '728', '211', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (242, 'sint-maarten', 'SX', 'SXM', '534', '721', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (243, 'st-barthelemy', 'BL', 'BLM', '652', '590', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (244, 'st-martin', 'MF', 'MAF', '663', '590', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (245, 'tokelau', 'TK', 'TKL', '772', '690', false, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (246, 'timor-leste', 'TL', 'TLS', '626', '670', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (247, 'united-states-minor-outlying-islands', 'UM', 'UMI', '581', '699', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (248, 'united-states-virgin-islands', 'VI', 'VIR', '850', '340', true, true);
insert into Country (countryId, name, a2, a3, number_, idd_, zipRequired, active_) values (249, 'western-sahara', 'EH', 'ESH', '732', '212', true, true);

insert into Region (regionId, countryId, regionCode, name, active_) values (1001, 1, 'AB', 'Alberta', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1002, 1, 'BC', 'British Columbia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1003, 1, 'MB', 'Manitoba', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1004, 1, 'NB', 'New Brunswick', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1005, 1, 'NL', 'Newfoundland and Labrador', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1006, 1, 'NT', 'Northwest Territories', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1007, 1, 'NS', 'Nova Scotia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1008, 1, 'NU', 'Nunavut', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1009, 1, 'ON', 'Ontario', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1010, 1, 'PE', 'Prince Edward Island', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1011, 1, 'QC', 'Quebec', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1012, 1, 'SK', 'Saskatchewan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (1013, 1, 'YT', 'Yukon', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2001, 2, 'CN-34', 'Anhui', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2002, 2, 'CN-92', 'Aomen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2003, 2, 'CN-11', 'Beijing', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2004, 2, 'CN-50', 'Chongqing', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2005, 2, 'CN-35', 'Fujian', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2006, 2, 'CN-62', 'Gansu', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2007, 2, 'CN-44', 'Guangdong', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2008, 2, 'CN-45', 'Guangxi', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2009, 2, 'CN-52', 'Guizhou', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2010, 2, 'CN-46', 'Hainan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2011, 2, 'CN-13', 'Hebei', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2012, 2, 'CN-23', 'Heilongjiang', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2013, 2, 'CN-41', 'Henan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2014, 2, 'CN-42', 'Hubei', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2015, 2, 'CN-43', 'Hunan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2016, 2, 'CN-32', 'Jiangsu', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2017, 2, 'CN-36', 'Jiangxi', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2018, 2, 'CN-22', 'Jilin', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2019, 2, 'CN-21', 'Liaoning', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2020, 2, 'CN-15', 'Nei Mongol', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2021, 2, 'CN-64', 'Ningxia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2022, 2, 'CN-63', 'Qinghai', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2023, 2, 'CN-61', 'Shaanxi', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2024, 2, 'CN-37', 'Shandong', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2025, 2, 'CN-31', 'Shanghai', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2026, 2, 'CN-14', 'Shanxi', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2027, 2, 'CN-51', 'Sichuan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2028, 2, 'CN-71', 'Taiwan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2029, 2, 'CN-12', 'Tianjin', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2030, 2, 'CN-91', 'Xianggang', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2031, 2, 'CN-65', 'Xinjiang', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2032, 2, 'CN-54', 'Xizang', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2033, 2, 'CN-53', 'Yunnan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (2034, 2, 'CN-33', 'Zhejiang', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3001, 3, 'A', 'Alsace', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3002, 3, 'B', 'Aquitaine', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3003, 3, 'C', 'Auvergne', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3004, 3, 'P', 'Basse-Normandie', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3005, 3, 'D', 'Bourgogne', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3006, 3, 'E', 'Bretagne', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3007, 3, 'F', 'Centre', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3008, 3, 'G', 'Champagne-Ardenne', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3009, 3, 'H', 'Corse', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3010, 3, 'GF', 'Guyane', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3011, 3, 'I', 'Franche Comté', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3012, 3, 'GP', 'Guadeloupe', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3013, 3, 'Q', 'Haute-Normandie', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3014, 3, 'J', 'Île-de-France', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3015, 3, 'K', 'Languedoc-Roussillon', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3016, 3, 'L', 'Limousin', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3017, 3, 'M', 'Lorraine', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3018, 3, 'MQ', 'Martinique', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3019, 3, 'N', 'Midi-Pyrénées', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3020, 3, 'O', 'Nord Pas de Calais', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3021, 3, 'R', 'Pays de la Loire', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3022, 3, 'S', 'Picardie', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3023, 3, 'T', 'Poitou-Charentes', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3024, 3, 'U', 'Provence-Alpes-Côte-d''Azur', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3025, 3, 'RE', 'Réunion', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (3026, 3, 'V', 'Rhône-Alpes', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4001, 4, 'BW', 'Baden-Württemberg', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4002, 4, 'BY', 'Bayern', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4003, 4, 'BE', 'Berlin', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4004, 4, 'BB', 'Brandenburg', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4005, 4, 'HB', 'Bremen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4006, 4, 'HH', 'Hamburg', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4007, 4, 'HE', 'Hessen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4008, 4, 'MV', 'Mecklenburg-Vorpommern', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4009, 4, 'NI', 'Niedersachsen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4010, 4, 'NW', 'Nordrhein-Westfalen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4011, 4, 'RP', 'Rheinland-Pfalz', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4012, 4, 'SL', 'Saarland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4013, 4, 'SN', 'Sachsen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4014, 4, 'ST', 'Sachsen-Anhalt', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4015, 4, 'SH', 'Schleswig-Holstein', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (4016, 4, 'TH', 'Thüringen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8001, 8, 'AG', 'Agrigento', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8002, 8, 'AL', 'Alessandria', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8003, 8, 'AN', 'Ancona', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8004, 8, 'AO', 'Aosta', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8005, 8, 'AR', 'Arezzo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8006, 8, 'AP', 'Ascoli Piceno', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8007, 8, 'AT', 'Asti', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8008, 8, 'AV', 'Avellino', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8009, 8, 'BA', 'Bari', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8010, 8, 'BT', 'Barletta-Andria-Trani', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8011, 8, 'BL', 'Belluno', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8012, 8, 'BN', 'Benevento', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8013, 8, 'BG', 'Bergamo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8014, 8, 'BI', 'Biella', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8015, 8, 'BO', 'Bologna', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8016, 8, 'BZ', 'Bolzano', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8017, 8, 'BS', 'Brescia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8018, 8, 'BR', 'Brindisi', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8019, 8, 'CA', 'Cagliari', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8020, 8, 'CL', 'Caltanissetta', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8021, 8, 'CB', 'Campobasso', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8022, 8, 'CI', 'Carbonia-Iglesias', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8023, 8, 'CE', 'Caserta', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8024, 8, 'CT', 'Catania', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8025, 8, 'CZ', 'Catanzaro', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8026, 8, 'CH', 'Chieti', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8027, 8, 'CO', 'Como', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8028, 8, 'CS', 'Cosenza', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8029, 8, 'CR', 'Cremona', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8030, 8, 'KR', 'Crotone', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8031, 8, 'CN', 'Cuneo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8032, 8, 'EN', 'Enna', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8033, 8, 'FM', 'Fermo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8034, 8, 'FE', 'Ferrara', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8035, 8, 'FI', 'Firenze', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8036, 8, 'FG', 'Foggia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8037, 8, 'FC', 'Forli-Cesena', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8038, 8, 'FR', 'Frosinone', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8039, 8, 'GE', 'Genova', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8040, 8, 'GO', 'Gorizia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8041, 8, 'GR', 'Grosseto', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8042, 8, 'IM', 'Imperia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8043, 8, 'IS', 'Isernia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8044, 8, 'AQ', 'L''Aquila', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8045, 8, 'SP', 'La Spezia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8046, 8, 'LT', 'Latina', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8047, 8, 'LE', 'Lecce', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8048, 8, 'LC', 'Lecco', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8049, 8, 'LI', 'Livorno', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8050, 8, 'LO', 'Lodi', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8051, 8, 'LU', 'Lucca', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8052, 8, 'MC', 'Macerata', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8053, 8, 'MN', 'Mantova', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8054, 8, 'MS', 'Massa-Carrara', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8055, 8, 'MT', 'Matera', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8056, 8, 'MA', 'Medio Campidano', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8057, 8, 'ME', 'Messina', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8058, 8, 'MI', 'Milano', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8059, 8, 'MO', 'Modena', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8060, 8, 'MB', 'Monza e Brianza', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8061, 8, 'NA', 'Napoli', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8062, 8, 'NO', 'Novara', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8063, 8, 'NU', 'Nuoro', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8064, 8, 'OG', 'Ogliastra', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8065, 8, 'OT', 'Olbia-Tempio', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8066, 8, 'OR', 'Oristano', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8067, 8, 'PD', 'Padova', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8068, 8, 'PA', 'Palermo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8069, 8, 'PR', 'Parma', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8070, 8, 'PV', 'Pavia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8071, 8, 'PG', 'Perugia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8072, 8, 'PU', 'Pesaro e Urbino', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8073, 8, 'PE', 'Pescara', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8074, 8, 'PC', 'Piacenza', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8075, 8, 'PI', 'Pisa', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8076, 8, 'PT', 'Pistoia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8077, 8, 'PN', 'Pordenone', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8078, 8, 'PZ', 'Potenza', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8079, 8, 'PO', 'Prato', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8080, 8, 'RG', 'Ragusa', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8081, 8, 'RA', 'Ravenna', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8082, 8, 'RC', 'Reggio Calabria', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8083, 8, 'RE', 'Reggio Emilia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8084, 8, 'RI', 'Rieti', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8085, 8, 'RN', 'Rimini', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8086, 8, 'RM', 'Roma', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8087, 8, 'RO', 'Rovigo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8088, 8, 'SA', 'Salerno', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8089, 8, 'SS', 'Sassari', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8090, 8, 'SV', 'Savona', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8091, 8, 'SI', 'Siena', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8092, 8, 'SR', 'Siracusa', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8093, 8, 'SO', 'Sondrio', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8094, 8, 'TA', 'Taranto', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8095, 8, 'TE', 'Teramo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8096, 8, 'TR', 'Terni', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8097, 8, 'TO', 'Torino', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8098, 8, 'TP', 'Trapani', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8099, 8, 'TN', 'Trento', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8100, 8, 'TV', 'Treviso', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8101, 8, 'TS', 'Trieste', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8102, 8, 'UD', 'Udine', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8103, 8, 'VA', 'Varese', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8104, 8, 'VE', 'Venezia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8105, 8, 'VB', 'Verbano-Cusio-Ossola', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8106, 8, 'VC', 'Vercelli', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8107, 8, 'VR', 'Verona', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8108, 8, 'VV', 'Vibo Valentia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8109, 8, 'VI', 'Vicenza', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (8110, 8, 'VT', 'Viterbo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11001, 11, 'DR', 'Drenthe', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11002, 11, 'FL', 'Flevoland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11003, 11, 'FR', 'Friesland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11004, 11, 'GE', 'Gelderland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11005, 11, 'GR', 'Groningen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11006, 11, 'LI', 'Limburg', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11007, 11, 'NB', 'Noord-Brabant', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11008, 11, 'NH', 'Noord-Holland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11009, 11, 'OV', 'Overijssel', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11010, 11, 'UT', 'Utrecht', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11011, 11, 'ZE', 'Zeeland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (11012, 11, 'ZH', 'Zuid-Holland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15001, 15, 'AN', 'Andalusia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15002, 15, 'AR', 'Aragon', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15003, 15, 'AS', 'Asturias', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15004, 15, 'IB', 'Balearic Islands', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15005, 15, 'PV', 'Basque Country', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15006, 15, 'CN', 'Canary Islands', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15007, 15, 'CB', 'Cantabria', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15008, 15, 'CL', 'Castile and Leon', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15009, 15, 'CM', 'Castile-La Mancha', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15010, 15, 'CT', 'Catalonia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15011, 15, 'CE', 'Ceuta', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15012, 15, 'EX', 'Extremadura', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15013, 15, 'GA', 'Galicia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15014, 15, 'LO', 'La Rioja', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15015, 15, 'M', 'Madrid', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15016, 15, 'ML', 'Melilla', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15017, 15, 'MU', 'Murcia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15018, 15, 'NA', 'Navarra', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (15019, 15, 'VC', 'Valencia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19001, 19, 'AL', 'Alabama', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19002, 19, 'AK', 'Alaska', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19003, 19, 'AZ', 'Arizona', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19004, 19, 'AR', 'Arkansas', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19005, 19, 'CA', 'California', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19006, 19, 'CO', 'Colorado', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19007, 19, 'CT', 'Connecticut', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19008, 19, 'DC', 'District of Columbia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19009, 19, 'DE', 'Delaware', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19010, 19, 'FL', 'Florida', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19011, 19, 'GA', 'Georgia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19012, 19, 'HI', 'Hawaii', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19013, 19, 'ID', 'Idaho', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19014, 19, 'IL', 'Illinois', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19015, 19, 'IN', 'Indiana', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19016, 19, 'IA', 'Iowa', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19017, 19, 'KS', 'Kansas', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19018, 19, 'KY', 'Kentucky ', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19019, 19, 'LA', 'Louisiana ', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19020, 19, 'ME', 'Maine', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19021, 19, 'MD', 'Maryland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19022, 19, 'MA', 'Massachusetts', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19023, 19, 'MI', 'Michigan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19024, 19, 'MN', 'Minnesota', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19025, 19, 'MS', 'Mississippi', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19026, 19, 'MO', 'Missouri', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19027, 19, 'MT', 'Montana', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19028, 19, 'NE', 'Nebraska', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19029, 19, 'NV', 'Nevada', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19030, 19, 'NH', 'New Hampshire', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19031, 19, 'NJ', 'New Jersey', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19032, 19, 'NM', 'New Mexico', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19033, 19, 'NY', 'New York', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19034, 19, 'NC', 'North Carolina', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19035, 19, 'ND', 'North Dakota', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19036, 19, 'OH', 'Ohio', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19037, 19, 'OK', 'Oklahoma ', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19038, 19, 'OR', 'Oregon', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19039, 19, 'PA', 'Pennsylvania', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19040, 19, 'PR', 'Puerto Rico', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19041, 19, 'RI', 'Rhode Island', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19042, 19, 'SC', 'South Carolina', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19043, 19, 'SD', 'South Dakota', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19044, 19, 'TN', 'Tennessee', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19045, 19, 'TX', 'Texas', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19046, 19, 'UT', 'Utah', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19047, 19, 'VT', 'Vermont', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19048, 19, 'VA', 'Virginia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19049, 19, 'WA', 'Washington', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19050, 19, 'WV', 'West Virginia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19051, 19, 'WI', 'Wisconsin', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (19052, 19, 'WY', 'Wyoming', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (32001, 32, 'ACT', 'Australian Capital Territory', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (32002, 32, 'NSW', 'New South Wales', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (32003, 32, 'NT', 'Northern Territory', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (32004, 32, 'QLD', 'Queensland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (32005, 32, 'SA', 'South Australia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (32006, 32, 'TAS', 'Tasmania', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (32007, 32, 'VIC', 'Victoria', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (32008, 32, 'WA', 'Western Australia', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33001, 33, 'AT-1', 'Burgenland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33002, 33, 'AT-2', 'Kärnten', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33003, 33, 'AT-3', 'Niederösterreich', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33004, 33, 'AT-4', 'Oberösterreich', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33005, 33, 'AT-5', 'Salzburg', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33006, 33, 'AT-6', 'Steiermark', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33007, 33, 'AT-7', 'Tirol', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33008, 33, 'AT-8', 'Vorarlberg', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (33009, 33, 'AT-9', 'Vienna', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144001, 144, 'MX-AGS', 'Aguascalientes', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144002, 144, 'MX-BCN', 'Baja California', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144003, 144, 'MX-BCS', 'Baja California Sur', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144004, 144, 'MX-CAM', 'Campeche', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144005, 144, 'MX-CHP', 'Chiapas', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144006, 144, 'MX-CHI', 'Chihuahua', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144007, 144, 'MX-COA', 'Coahuila', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144008, 144, 'MX-COL', 'Colima', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144009, 144, 'MX-DUR', 'Durango', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144010, 144, 'MX-GTO', 'Guanajuato', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144011, 144, 'MX-GRO', 'Guerrero', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144012, 144, 'MX-HGO', 'Hidalgo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144013, 144, 'MX-JAL', 'Jalisco', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144014, 144, 'MX-MEX', 'Mexico', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144015, 144, 'MX-MIC', 'Michoacan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144016, 144, 'MX-MOR', 'Morelos', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144017, 144, 'MX-NAY', 'Nayarit', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144018, 144, 'MX-NLE', 'Nuevo Leon', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144019, 144, 'MX-OAX', 'Oaxaca', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144020, 144, 'MX-PUE', 'Puebla', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144021, 144, 'MX-QRO', 'Queretaro', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144023, 144, 'MX-ROO', 'Quintana Roo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144024, 144, 'MX-SLP', 'San Luis Potosí', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144025, 144, 'MX-SIN', 'Sinaloa', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144026, 144, 'MX-SON', 'Sonora', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144027, 144, 'MX-TAB', 'Tabasco', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144028, 144, 'MX-TAM', 'Tamaulipas', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144029, 144, 'MX-TLX', 'Tlaxcala', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144030, 144, 'MX-VER', 'Veracruz', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144031, 144, 'MX-YUC', 'Yucatan', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (144032, 144, 'MX-ZAC', 'Zacatecas', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164001, 164, '01', 'Østfold', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164002, 164, '02', 'Akershus', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164003, 164, '03', 'Oslo', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164004, 164, '04', 'Hedmark', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164005, 164, '05', 'Oppland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164006, 164, '06', 'Buskerud', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164007, 164, '07', 'Vestfold', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164008, 164, '08', 'Telemark', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164009, 164, '09', 'Aust-Agder', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164010, 164, '10', 'Vest-Agder', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164011, 164, '11', 'Rogaland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164012, 164, '12', 'Hordaland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164013, 164, '14', 'Sogn og Fjordane', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164014, 164, '15', 'Møre of Romsdal', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164015, 164, '16', 'Sør-Trøndelag', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164016, 164, '17', 'Nord-Trøndelag', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164017, 164, '18', 'Nordland', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164018, 164, '19', 'Troms', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (164019, 164, '20', 'Finnmark', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202001, 202, 'AG', 'Aargau', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202002, 202, 'AR', 'Appenzell Ausserrhoden', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202003, 202, 'AI', 'Appenzell Innerrhoden', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202004, 202, 'BL', 'Basel-Landschaft', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202005, 202, 'BS', 'Basel-Stadt', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202006, 202, 'BE', 'Bern', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202007, 202, 'FR', 'Fribourg', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202008, 202, 'GE', 'Geneva', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202009, 202, 'GL', 'Glarus', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202010, 202, 'GR', 'Graubünden', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202011, 202, 'JU', 'Jura', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202012, 202, 'LU', 'Lucerne', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202013, 202, 'NE', 'Neuchâtel', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202014, 202, 'NW', 'Nidwalden', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202015, 202, 'OW', 'Obwalden', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202016, 202, 'SH', 'Schaffhausen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202017, 202, 'SZ', 'Schwyz', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202018, 202, 'SO', 'Solothurn', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202019, 202, 'SG', 'St. Gallen', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202020, 202, 'TG', 'Thurgau', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202021, 202, 'TI', 'Ticino', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202022, 202, 'UR', 'Uri', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202023, 202, 'VS', 'Valais', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202024, 202, 'VD', 'Vaud', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202025, 202, 'ZG', 'Zug', true);
insert into Region (regionId, countryId, regionCode, name, active_) values (202026, 202, 'ZH', 'Zürich', true);

--
-- List types for accounts
--

insert into ListType (listTypeId, name, type_) values (10000, 'billing', 'com.liferay.portal.kernel.model.Account.address');
insert into ListType (listTypeId, name, type_) values (10001, 'other', 'com.liferay.portal.kernel.model.Account.address');
insert into ListType (listTypeId, name, type_) values (10002, 'p-o-box', 'com.liferay.portal.kernel.model.Account.address');
insert into ListType (listTypeId, name, type_) values (10003, 'shipping', 'com.liferay.portal.kernel.model.Account.address');

insert into ListType (listTypeId, name, type_) values (10004, 'email-address', 'com.liferay.portal.kernel.model.Account.emailAddress');
insert into ListType (listTypeId, name, type_) values (10005, 'email-address-2', 'com.liferay.portal.kernel.model.Account.emailAddress');
insert into ListType (listTypeId, name, type_) values (10006, 'email-address-3', 'com.liferay.portal.kernel.model.Account.emailAddress');

insert into ListType (listTypeId, name, type_) values (10007, 'fax', 'com.liferay.portal.kernel.model.Account.phone');
insert into ListType (listTypeId, name, type_) values (10008, 'local', 'com.liferay.portal.kernel.model.Account.phone');
insert into ListType (listTypeId, name, type_) values (10009, 'other', 'com.liferay.portal.kernel.model.Account.phone');
insert into ListType (listTypeId, name, type_) values (10010, 'toll-free', 'com.liferay.portal.kernel.model.Account.phone');
insert into ListType (listTypeId, name, type_) values (10011, 'tty', 'com.liferay.portal.kernel.model.Account.phone');

insert into ListType (listTypeId, name, type_) values (10012, 'intranet', 'com.liferay.portal.kernel.model.Account.website');
insert into ListType (listTypeId, name, type_) values (10013, 'public', 'com.liferay.portal.kernel.model.Account.website');

--
-- List types for contacts
--

insert into ListType (listTypeId, name, type_) values (11000, 'business', 'com.liferay.portal.kernel.model.Contact.address');
insert into ListType (listTypeId, name, type_) values (11001, 'other', 'com.liferay.portal.kernel.model.Contact.address');
insert into ListType (listTypeId, name, type_) values (11002, 'personal', 'com.liferay.portal.kernel.model.Contact.address');

insert into ListType (listTypeId, name, type_) values (11003, 'email-address', 'com.liferay.portal.kernel.model.Contact.emailAddress');
insert into ListType (listTypeId, name, type_) values (11004, 'email-address-2', 'com.liferay.portal.kernel.model.Contact.emailAddress');
insert into ListType (listTypeId, name, type_) values (11005, 'email-address-3', 'com.liferay.portal.kernel.model.Contact.emailAddress');

insert into ListType (listTypeId, name, type_) values (11006, 'business', 'com.liferay.portal.kernel.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11007, 'business-fax', 'com.liferay.portal.kernel.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11008, 'mobile-phone', 'com.liferay.portal.kernel.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11009, 'other', 'com.liferay.portal.kernel.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11010, 'pager', 'com.liferay.portal.kernel.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11011, 'personal', 'com.liferay.portal.kernel.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11012, 'personal-fax', 'com.liferay.portal.kernel.model.Contact.phone');
insert into ListType (listTypeId, name, type_) values (11013, 'tty', 'com.liferay.portal.kernel.model.Contact.phone');

insert into ListType (listTypeId, name, type_) values (11014, 'dr', 'com.liferay.portal.kernel.model.Contact.prefix');
insert into ListType (listTypeId, name, type_) values (11015, 'mr', 'com.liferay.portal.kernel.model.Contact.prefix');
insert into ListType (listTypeId, name, type_) values (11016, 'mrs', 'com.liferay.portal.kernel.model.Contact.prefix');
insert into ListType (listTypeId, name, type_) values (11017, 'ms', 'com.liferay.portal.kernel.model.Contact.prefix');

insert into ListType (listTypeId, name, type_) values (11020, 'ii', 'com.liferay.portal.kernel.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11021, 'iii', 'com.liferay.portal.kernel.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11022, 'iv', 'com.liferay.portal.kernel.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11023, 'jr', 'com.liferay.portal.kernel.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11024, 'phd', 'com.liferay.portal.kernel.model.Contact.suffix');
insert into ListType (listTypeId, name, type_) values (11025, 'sr', 'com.liferay.portal.kernel.model.Contact.suffix');

insert into ListType (listTypeId, name, type_) values (11026, 'blog', 'com.liferay.portal.kernel.model.Contact.website');
insert into ListType (listTypeId, name, type_) values (11027, 'business', 'com.liferay.portal.kernel.model.Contact.website');
insert into ListType (listTypeId, name, type_) values (11028, 'other', 'com.liferay.portal.kernel.model.Contact.website');
insert into ListType (listTypeId, name, type_) values (11029, 'personal', 'com.liferay.portal.kernel.model.Contact.website');

--
-- List types for organizations
--

insert into ListType (listTypeId, name, type_) values (12000, 'billing', 'com.liferay.portal.kernel.model.Organization.address');
insert into ListType (listTypeId, name, type_) values (12001, 'other', 'com.liferay.portal.kernel.model.Organization.address');
insert into ListType (listTypeId, name, type_) values (12002, 'p-o-box', 'com.liferay.portal.kernel.model.Organization.address');
insert into ListType (listTypeId, name, type_) values (12003, 'shipping', 'com.liferay.portal.kernel.model.Organization.address');

insert into ListType (listTypeId, name, type_) values (12004, 'email-address', 'com.liferay.portal.kernel.model.Organization.emailAddress');
insert into ListType (listTypeId, name, type_) values (12005, 'email-address-2', 'com.liferay.portal.kernel.model.Organization.emailAddress');
insert into ListType (listTypeId, name, type_) values (12006, 'email-address-3', 'com.liferay.portal.kernel.model.Organization.emailAddress');

insert into ListType (listTypeId, name, type_) values (12007, 'fax', 'com.liferay.portal.kernel.model.Organization.phone');
insert into ListType (listTypeId, name, type_) values (12008, 'local', 'com.liferay.portal.kernel.model.Organization.phone');
insert into ListType (listTypeId, name, type_) values (12009, 'other', 'com.liferay.portal.kernel.model.Organization.phone');
insert into ListType (listTypeId, name, type_) values (12010, 'toll-free', 'com.liferay.portal.kernel.model.Organization.phone');
insert into ListType (listTypeId, name, type_) values (12011, 'tty', 'com.liferay.portal.kernel.model.Organization.phone');

insert into ListType (listTypeId, name, type_) values (12012, 'administrative', 'com.liferay.portal.kernel.model.Organization.service');
insert into ListType (listTypeId, name, type_) values (12013, 'contracts', 'com.liferay.portal.kernel.model.Organization.service');
insert into ListType (listTypeId, name, type_) values (12014, 'donation', 'com.liferay.portal.kernel.model.Organization.service');
insert into ListType (listTypeId, name, type_) values (12015, 'retail', 'com.liferay.portal.kernel.model.Organization.service');
insert into ListType (listTypeId, name, type_) values (12016, 'training', 'com.liferay.portal.kernel.model.Organization.service');

insert into ListType (listTypeId, name, type_) values (12017, 'full-member', 'com.liferay.portal.kernel.model.Organization.status');
insert into ListType (listTypeId, name, type_) values (12018, 'provisional-member', 'com.liferay.portal.kernel.model.Organization.status');

insert into ListType (listTypeId, name, type_) values (12019, 'intranet', 'com.liferay.portal.kernel.model.Organization.website');
insert into ListType (listTypeId, name, type_) values (12020, 'public', 'com.liferay.portal.kernel.model.Organization.website');


insert into Counter (name, currentId) values ('com.liferay.counter.kernel.model.Counter', 20000);


insert into Release_ (releaseId, createDate, modifiedDate, servletContextName, schemaVersion, buildNumber, verified) values (1, current_timestamp, current_timestamp, 'portal', '7.0.1', 7001, false);



commit;

create or replace rule delete_DLContent_data_ as on delete to DLContent do also select case when exists(select 1 from pg_catalog.pg_largeobject where (loid = old.data_)) then lo_unlink(old.data_) end from DLContent where DLContent.data_ = old.data_;
create or replace rule update_DLContent_data_ as on update to DLContent where old.data_ is distinct from new.data_ and old.data_ is not null do also select case when exists(select 1 from pg_catalog.pg_largeobject where (loid = old.data_)) then lo_unlink(old.data_) end from DLContent where DLContent.data_ = old.data_;

create index IX_923BD178 on Address (companyId, classNameId, classPK, mailing);
create index IX_9226DBB4 on Address (companyId, classNameId, classPK, primary_);
create index IX_5BC8B0D4 on Address (userId);
create index IX_8FCB620E on Address (uuid_, companyId);

create unique index IX_BA4413D5 on AnnouncementsDelivery (userId, type_);

create index IX_14F06A6B on AnnouncementsEntry (classNameId, classPK, alert);
create index IX_D49C2E66 on AnnouncementsEntry (userId);
create index IX_F2949120 on AnnouncementsEntry (uuid_, companyId);

create index IX_9C7EB9F on AnnouncementsFlag (entryId);
create unique index IX_4539A99C on AnnouncementsFlag (userId, entryId, value);

create index IX_C7F39FCA on AssetCategory (groupId, name, vocabularyId);
create index IX_852EA801 on AssetCategory (groupId, parentCategoryId, name, vocabularyId);
create index IX_87603842 on AssetCategory (groupId, parentCategoryId, vocabularyId);
create index IX_2008FACB on AssetCategory (groupId, vocabularyId);
create index IX_D61ABE08 on AssetCategory (name, vocabularyId);
create unique index IX_BE4DF2BF on AssetCategory (parentCategoryId, name, vocabularyId);
create index IX_B185E980 on AssetCategory (parentCategoryId, vocabularyId);
create index IX_BBAF6928 on AssetCategory (uuid_, companyId);
create unique index IX_E8D019AA on AssetCategory (uuid_, groupId);
create index IX_287B1F89 on AssetCategory (vocabularyId);

create unique index IX_DBD111AA on AssetCategoryProperty (categoryId, key_);
create index IX_52340033 on AssetCategoryProperty (companyId, key_);

create index IX_A188F560 on AssetEntries_AssetCategories (categoryId);
create index IX_38A65B55 on AssetEntries_AssetCategories (companyId);
create index IX_E119938A on AssetEntries_AssetCategories (entryId);

create index IX_112337B8 on AssetEntries_AssetTags (companyId);
create index IX_2ED82CAD on AssetEntries_AssetTags (entryId);
create index IX_B2A61B55 on AssetEntries_AssetTags (tagId);

create unique index IX_1E9D371D on AssetEntry (classNameId, classPK);
create index IX_7306C60 on AssetEntry (companyId);
create index IX_75D42FF9 on AssetEntry (expirationDate);
create index IX_1EBA6821 on AssetEntry (groupId, classUuid);
create index IX_FEC4A201 on AssetEntry (layoutUuid);
create index IX_2E4E3885 on AssetEntry (publishDate);
create index IX_9029E15A on AssetEntry (visible);

create unique index IX_8F542794 on AssetLink (entryId1, entryId2, type_);
create index IX_14D5A20D on AssetLink (entryId1, type_);
create index IX_91F132C on AssetLink (entryId2, type_);

create unique index IX_D63322F9 on AssetTag (groupId, name);
create index IX_84C501E4 on AssetTag (uuid_, companyId);
create unique index IX_B6ACB166 on AssetTag (uuid_, groupId);

create index IX_50702693 on AssetTagStats (classNameId);
create unique index IX_56682CC4 on AssetTagStats (tagId, classNameId);

create index IX_B22D908C on AssetVocabulary (companyId);
create unique index IX_C0AAD74D on AssetVocabulary (groupId, name);
create index IX_C4E6FD10 on AssetVocabulary (uuid_, companyId);
create unique index IX_1B2B8792 on AssetVocabulary (uuid_, groupId);

create index IX_BB0C2905 on BlogsEntry (companyId, displayDate, status);
create index IX_EB2DCE27 on BlogsEntry (companyId, status);
create index IX_A5F57B61 on BlogsEntry (companyId, userId, status);
create index IX_2672F77F on BlogsEntry (displayDate, status);
create index IX_F0E73383 on BlogsEntry (groupId, displayDate, status);
create index IX_1EFD8EE9 on BlogsEntry (groupId, status);
create unique index IX_DB780A20 on BlogsEntry (groupId, urlTitle);
create index IX_DA04F689 on BlogsEntry (groupId, userId, displayDate, status);
create index IX_49E15A23 on BlogsEntry (groupId, userId, status);
create index IX_5E8307BB on BlogsEntry (uuid_, companyId);
create unique index IX_1B1040FD on BlogsEntry (uuid_, groupId);

create index IX_90CDA39A on BlogsStatsUser (companyId, entryCount);
create index IX_28C78D5C on BlogsStatsUser (groupId, entryCount);
create unique index IX_82254C25 on BlogsStatsUser (groupId, userId);
create index IX_507BA031 on BlogsStatsUser (userId, lastPostDate);

create unique index IX_E7B95510 on BrowserTracker (userId);

create unique index IX_B27A301F on ClassName_ (value);

create index IX_38EFE3FD on Company (logoId);
create index IX_12566EC2 on Company (mx);
create index IX_35E3E7C6 on Company (system);
create unique index IX_EC00543C on Company (webId);

create index IX_B8C28C53 on Contact_ (accountId);
create index IX_791914FA on Contact_ (classNameId, classPK);
create index IX_66D496A3 on Contact_ (companyId);

create unique index IX_717B97E1 on Country (a2);
create unique index IX_717B9BA2 on Country (a3);
create index IX_25D734CD on Country (active_);
create unique index IX_19DA007B on Country (name);

create unique index IX_FDD1AAA8 on DLContent (companyId, repositoryId, path_, version);

create index IX_5444C427 on DLFileEntry (companyId, fileEntryTypeId);
create index IX_772ECDE7 on DLFileEntry (fileEntryTypeId);
create index IX_8F6C75D0 on DLFileEntry (folderId, name);
create index IX_BAF654E5 on DLFileEntry (groupId, fileEntryTypeId);
create index IX_29D0AF28 on DLFileEntry (groupId, folderId, fileEntryTypeId);
create unique index IX_DF37D92E on DLFileEntry (groupId, folderId, fileName);
create unique index IX_5391712 on DLFileEntry (groupId, folderId, name);
create unique index IX_ED5CA615 on DLFileEntry (groupId, folderId, title);
create index IX_D20C434D on DLFileEntry (groupId, userId, folderId);
create index IX_D9492CF6 on DLFileEntry (mimeType);
create index IX_1B352F4A on DLFileEntry (repositoryId, folderId);
create index IX_25F5CAB9 on DLFileEntry (smallImageId, largeImageId, custom1ImageId, custom2ImageId);
create index IX_31079DE8 on DLFileEntry (uuid_, companyId);
create unique index IX_BC2E7E6A on DLFileEntry (uuid_, groupId);

create unique index IX_7332B44F on DLFileEntryMetadata (DDMStructureId, fileVersionId);
create index IX_4F40FE5E on DLFileEntryMetadata (fileEntryId);
create index IX_1FE9C04 on DLFileEntryMetadata (fileVersionId);
create index IX_E69431B7 on DLFileEntryMetadata (uuid_, companyId);

create unique index IX_5B6BEF5F on DLFileEntryType (groupId, fileEntryTypeKey);
create index IX_5B03E942 on DLFileEntryType (uuid_, companyId);
create unique index IX_1399D844 on DLFileEntryType (uuid_, groupId);

create index IX_2E64D9F9 on DLFileEntryTypes_DLFolders (companyId);
create index IX_5BB6AD6C on DLFileEntryTypes_DLFolders (fileEntryTypeId);
create index IX_6E00A2EC on DLFileEntryTypes_DLFolders (folderId);

create index IX_38F0315 on DLFileRank (companyId, userId, fileEntryId);
create index IX_A65A1F8B on DLFileRank (fileEntryId);
create index IX_4E96195B on DLFileRank (groupId, userId, active_);
create index IX_EED06670 on DLFileRank (userId);

create index IX_8571953E on DLFileShortcut (companyId, status);
create index IX_17EE3098 on DLFileShortcut (groupId, folderId, active_, status);
create index IX_4B7247F6 on DLFileShortcut (toFileEntryId);
create index IX_29AE81C4 on DLFileShortcut (uuid_, companyId);
create unique index IX_FDB4A946 on DLFileShortcut (uuid_, groupId);

create index IX_A0A283F4 on DLFileVersion (companyId, status);
create index IX_D47BB14D on DLFileVersion (fileEntryId, status);
create unique index IX_E2815081 on DLFileVersion (fileEntryId, version);
create index IX_DFD809D3 on DLFileVersion (groupId, folderId, status);
create index IX_9BE769ED on DLFileVersion (groupId, folderId, title, version);
create index IX_FFB3395C on DLFileVersion (mimeType);
create index IX_95E9E44E on DLFileVersion (uuid_, companyId);
create unique index IX_C99B2650 on DLFileVersion (uuid_, groupId);

create index IX_E79BE432 on DLFolder (companyId, status);
create index IX_C88430AB on DLFolder (groupId, mountPoint, parentFolderId, hidden_, status);
create index IX_CE360BF6 on DLFolder (groupId, parentFolderId, hidden_, status);
create unique index IX_902FD874 on DLFolder (groupId, parentFolderId, name);
create index IX_51556082 on DLFolder (parentFolderId, name);
create index IX_6F63F140 on DLFolder (repositoryId, mountPoint);
create index IX_6747B2BC on DLFolder (repositoryId, parentFolderId);
create index IX_DA448450 on DLFolder (uuid_, companyId);
create unique index IX_3CC1DED2 on DLFolder (uuid_, groupId);

create index IX_3D8E1607 on DLSyncEvent (modifiedTime);
create unique index IX_57D82B06 on DLSyncEvent (typePK);

create index IX_2A2CB130 on EmailAddress (companyId, classNameId, classPK, primary_);
create index IX_7B43CD8 on EmailAddress (userId);
create index IX_F74AB912 on EmailAddress (uuid_, companyId);

create unique index IX_FEFC8DA7 on ExpandoColumn (tableId, name);

create index IX_49EB3118 on ExpandoRow (classPK);
create unique index IX_81EFBFF5 on ExpandoRow (tableId, classPK);

create unique index IX_37562284 on ExpandoTable (companyId, classNameId, name);

create index IX_B29FEF17 on ExpandoValue (classNameId, classPK);
create unique index IX_9DDD21E5 on ExpandoValue (columnId, rowId_);
create index IX_9112A7A0 on ExpandoValue (rowId_);
create index IX_1BD3F4C on ExpandoValue (tableId, classPK);
create unique index IX_D27B03E7 on ExpandoValue (tableId, columnId, classPK);
create index IX_B71E92D5 on ExpandoValue (tableId, rowId_);

create index IX_1827A2E5 on ExportImportConfiguration (companyId);
create index IX_38FA468D on ExportImportConfiguration (groupId, status);
create index IX_47CC6234 on ExportImportConfiguration (groupId, type_, status);

create index IX_8257E37B on Group_ (classNameId, classPK);
create index IX_BD3CB13A on Group_ (classNameId, groupId, companyId, parentGroupId);
create index IX_DDC91A87 on Group_ (companyId, active_);
create unique index IX_D0D5E397 on Group_ (companyId, classNameId, classPK);
create unique index IX_A729E3A6 on Group_ (companyId, classNameId, liveGroupId, groupKey);
create index IX_ABE2D54 on Group_ (companyId, classNameId, parentGroupId);
create unique index IX_5BDDB872 on Group_ (companyId, friendlyURL);
create unique index IX_ACD2B296 on Group_ (companyId, groupKey);
create unique index IX_AACD15F0 on Group_ (companyId, liveGroupId, groupKey);
create index IX_D4BFF38B on Group_ (companyId, parentGroupId, site, inheritContent);
create index IX_63A2AABD on Group_ (companyId, site);
create index IX_16218A38 on Group_ (liveGroupId);
create index IX_7B590A7A on Group_ (type_, active_);
create index IX_26CC761A on Group_ (uuid_, companyId);
create unique index IX_754FBB1C on Group_ (uuid_, groupId);

create index IX_8BFD4548 on Groups_Orgs (companyId);
create index IX_75267DCA on Groups_Orgs (groupId);
create index IX_6BBB7682 on Groups_Orgs (organizationId);

create index IX_557D8550 on Groups_Roles (companyId);
create index IX_84471FD2 on Groups_Roles (groupId);
create index IX_3103EF3D on Groups_Roles (roleId);

create index IX_676FC818 on Groups_UserGroups (companyId);
create index IX_31FB749A on Groups_UserGroups (groupId);
create index IX_3B69160F on Groups_UserGroups (userGroupId);

create index IX_6A925A4D on Image (size_);

create index IX_C7FBC998 on Layout (companyId);
create unique index IX_BC2C4231 on Layout (groupId, privateLayout, friendlyURL);
create unique index IX_7162C27C on Layout (groupId, privateLayout, layoutId);
create index IX_6DE88B06 on Layout (groupId, privateLayout, parentLayoutId);
create index IX_8CE8C0D9 on Layout (groupId, privateLayout, sourcePrototypeLayoutUuid);
create index IX_1A1B61D2 on Layout (groupId, privateLayout, type_);
create index IX_23922F7D on Layout (iconImageId);
create index IX_B529BFD3 on Layout (layoutPrototypeUuid);
create index IX_39A18ECC on Layout (sourcePrototypeLayoutUuid);
create index IX_2CE4BE84 on Layout (uuid_, companyId);
create unique index IX_E118C537 on Layout (uuid_, groupId, privateLayout);

create index IX_A705FF94 on LayoutBranch (layoutSetBranchId, plid, master);
create unique index IX_FD57097D on LayoutBranch (layoutSetBranchId, plid, name);

create index IX_EAB317C8 on LayoutFriendlyURL (companyId);
create unique index IX_A6FC2B28 on LayoutFriendlyURL (groupId, privateLayout, friendlyURL, languageId);
create index IX_59051329 on LayoutFriendlyURL (plid, friendlyURL);
create unique index IX_C5762E72 on LayoutFriendlyURL (plid, languageId);
create index IX_F4321A54 on LayoutFriendlyURL (uuid_, companyId);
create unique index IX_326525D6 on LayoutFriendlyURL (uuid_, groupId);

create index IX_557A639F on LayoutPrototype (companyId, active_);
create index IX_63ED2532 on LayoutPrototype (uuid_, companyId);

create index IX_43E8286A on LayoutRevision (head, plid);
create index IX_E10AC39 on LayoutRevision (layoutSetBranchId, head, plid);
create index IX_13984800 on LayoutRevision (layoutSetBranchId, layoutBranchId, plid);
create index IX_4A84AF43 on LayoutRevision (layoutSetBranchId, parentLayoutRevisionId, plid);
create index IX_70DA9ECB on LayoutRevision (layoutSetBranchId, plid, status);
create index IX_7FFAE700 on LayoutRevision (layoutSetBranchId, status);
create index IX_8EC3D2BC on LayoutRevision (plid, status);

create unique index IX_48550691 on LayoutSet (groupId, privateLayout);
create index IX_72BBA8B7 on LayoutSet (layoutSetPrototypeUuid);

create index IX_CCF0DA29 on LayoutSetBranch (groupId, privateLayout, master);
create unique index IX_5FF18552 on LayoutSetBranch (groupId, privateLayout, name);

create index IX_9178FC71 on LayoutSetPrototype (companyId, active_);
create index IX_D9FFCA84 on LayoutSetPrototype (uuid_, companyId);

create index IX_77729718 on ListType (name, type_);
create index IX_2932DD37 on ListType (type_);

create index IX_69951A25 on MBBan (banUserId);
create unique index IX_8ABC4E3B on MBBan (groupId, banUserId);
create index IX_48814BBA on MBBan (userId);
create index IX_4F841574 on MBBan (uuid_, companyId);
create unique index IX_2A3B68F6 on MBBan (uuid_, groupId);

create index IX_D1642361 on MBCategory (categoryId, groupId, parentCategoryId, status);
create index IX_E15A5DB5 on MBCategory (companyId, status);
create index IX_C295DBEE on MBCategory (groupId, parentCategoryId, status);
create index IX_DA84A9F7 on MBCategory (groupId, status);
create index IX_13DF4E6D on MBCategory (uuid_, companyId);
create unique index IX_F7D28C2F on MBCategory (uuid_, groupId);

create unique index IX_33A4DE38 on MBDiscussion (classNameId, classPK);
create unique index IX_B5CA2DC on MBDiscussion (threadId);
create index IX_7E965757 on MBDiscussion (uuid_, companyId);
create unique index IX_F7AAC799 on MBDiscussion (uuid_, groupId);

create index IX_BFEB984F on MBMailingList (active_);
create unique index IX_76CE9CDD on MBMailingList (groupId, categoryId);
create index IX_FC61676E on MBMailingList (uuid_, companyId);
create unique index IX_E858F170 on MBMailingList (uuid_, groupId);

create index IX_F6687633 on MBMessage (classNameId, classPK, status);
create index IX_1AD93C16 on MBMessage (companyId, status);
create index IX_4257DB85 on MBMessage (groupId, categoryId, status);
create index IX_CBFDBF0A on MBMessage (groupId, categoryId, threadId, answer);
create index IX_385E123E on MBMessage (groupId, categoryId, threadId, status);
create index IX_ED39AC98 on MBMessage (groupId, status);
create index IX_377858D2 on MBMessage (groupId, userId, status);
create index IX_9D7C3B23 on MBMessage (threadId, answer);
create index IX_A7038CD7 on MBMessage (threadId, parentMessageId);
create index IX_9DC8E57 on MBMessage (threadId, status);
create index IX_4A4BB4ED on MBMessage (userId, classNameId, classPK, status);
create index IX_3321F142 on MBMessage (userId, classNameId, status);
create index IX_57CA9FEC on MBMessage (uuid_, companyId);
create unique index IX_8D12316E on MBMessage (uuid_, groupId);

create unique index IX_9168E2C9 on MBStatsUser (groupId, userId);
create index IX_847F92B5 on MBStatsUser (userId);

create index IX_41F6DC8A on MBThread (categoryId, priority);
create index IX_50F1904A on MBThread (groupId, categoryId, lastPostDate);
create index IX_485F7E98 on MBThread (groupId, categoryId, status);
create index IX_E1E7142B on MBThread (groupId, status);
create index IX_AEDD9CB5 on MBThread (lastPostDate, priority);
create index IX_CC993ECB on MBThread (rootMessageId);
create index IX_F8CA2AB9 on MBThread (uuid_, companyId);
create unique index IX_3A200B7B on MBThread (uuid_, groupId);

create index IX_8CB0A24A on MBThreadFlag (threadId);
create unique index IX_33781904 on MBThreadFlag (userId, threadId);
create index IX_DCE308C5 on MBThreadFlag (uuid_, companyId);
create unique index IX_FEB0FC87 on MBThreadFlag (uuid_, groupId);

create index IX_C28C72EC on MembershipRequest (groupId, statusId);
create index IX_35AA8FA6 on MembershipRequest (groupId, userId, statusId);
create index IX_66D70879 on MembershipRequest (userId);

create index IX_4A527DD3 on OrgGroupRole (groupId);
create index IX_AB044D1C on OrgGroupRole (roleId);

create index IX_6AF0D434 on OrgLabor (organizationId);

create unique index IX_E301BDF5 on Organization_ (companyId, name);
create index IX_418E4522 on Organization_ (companyId, parentOrganizationId);
create index IX_A9D85BA6 on Organization_ (uuid_, companyId);

create index IX_2C1142E on PasswordPolicy (companyId, defaultPolicy);
create unique index IX_3FBFA9F4 on PasswordPolicy (companyId, name);
create index IX_E4D7EF87 on PasswordPolicy (uuid_, companyId);

create unique index IX_C3A17327 on PasswordPolicyRel (classNameId, classPK);
create index IX_CD25266E on PasswordPolicyRel (passwordPolicyId);

create index IX_326F75BD on PasswordTracker (userId);

create index IX_812CE07A on Phone (companyId, classNameId, classPK, primary_);
create index IX_F202B9CE on Phone (userId);
create index IX_B271FA88 on Phone (uuid_, companyId);

create unique index IX_7171B2E8 on PluginSetting (companyId, pluginId, pluginType);

create index IX_D1F795F1 on PortalPreferences (ownerId, ownerType);

create unique index IX_12B5E51D on Portlet (companyId, portletId);

create index IX_96BDD537 on PortletItem (groupId, classNameId);
create index IX_D699243F on PortletItem (groupId, name, portletId, classNameId);
create index IX_E922D6C0 on PortletItem (groupId, portletId, classNameId);

create unique index IX_C7057FF7 on PortletPreferences (ownerId, ownerType, plid, portletId);
create index IX_C9A3FCE2 on PortletPreferences (ownerId, ownerType, portletId);
create index IX_D5EDA3A1 on PortletPreferences (ownerType, plid, portletId);
create index IX_A3B2A80C on PortletPreferences (ownerType, portletId);
create index IX_D340DB76 on PortletPreferences (plid, portletId);
create index IX_8E6DA3A1 on PortletPreferences (portletId);

create index IX_A1A8CB8B on RatingsEntry (classNameId, classPK, score);
create unique index IX_B47E3C11 on RatingsEntry (userId, classNameId, classPK);
create index IX_9F242DF6 on RatingsEntry (uuid_, companyId);

create unique index IX_A6E99284 on RatingsStats (classNameId, classPK);

create index IX_B91F79BD on RecentLayoutBranch (groupId);
create index IX_351E86E8 on RecentLayoutBranch (layoutBranchId);
create unique index IX_C27D6369 on RecentLayoutBranch (userId, layoutSetBranchId, plid);

create index IX_8D8A2724 on RecentLayoutRevision (groupId);
create index IX_DA0788DA on RecentLayoutRevision (layoutRevisionId);
create unique index IX_4C600BD0 on RecentLayoutRevision (userId, layoutSetBranchId, plid);

create index IX_711995A5 on RecentLayoutSetBranch (groupId);
create index IX_23FF0700 on RecentLayoutSetBranch (layoutSetBranchId);
create unique index IX_4654D204 on RecentLayoutSetBranch (userId, layoutSetId);

create index IX_2D9A426F on Region (active_);
create index IX_11FB3E42 on Region (countryId, active_);
create unique index IX_A2635F5C on Region (countryId, regionCode);

create unique index IX_8BD6BCA7 on Release_ (servletContextName);

create unique index IX_60C8634C on Repository (groupId, name, portletId);
create index IX_F543EA4 on Repository (uuid_, companyId);
create unique index IX_11641E26 on Repository (uuid_, groupId);

create unique index IX_9BDCF489 on RepositoryEntry (repositoryId, mappedId);
create index IX_D3B9AF62 on RepositoryEntry (uuid_, companyId);
create unique index IX_354AA664 on RepositoryEntry (uuid_, groupId);

create unique index IX_EDB9986E on ResourceAction (name, actionId);

create unique index IX_AEEA209C on ResourceBlock (companyId, groupId, name, permissionsHash);
create index IX_2D4CC782 on ResourceBlock (companyId, name);

create unique index IX_D63D20BB on ResourceBlockPermission (resourceBlockId, roleId);
create index IX_20A2E3D9 on ResourceBlockPermission (roleId);

create unique index IX_8D83D0CE on ResourcePermission (companyId, name, scope, primKey, roleId);
create index IX_49AEC6F3 on ResourcePermission (companyId, name, scope, primKeyId, roleId, viewActionId);
create index IX_26284944 on ResourcePermission (companyId, primKey);
create index IX_F6BAE86A on ResourcePermission (companyId, scope, primKey);
create index IX_D5F1E2A2 on ResourcePermission (name);
create index IX_A37A0588 on ResourcePermission (roleId);
create index IX_F4555981 on ResourcePermission (scope);

create unique index IX_BA497163 on ResourceTypePermission (companyId, groupId, name, roleId);
create index IX_7D81F66F on ResourceTypePermission (companyId, name, roleId);
create index IX_A82690E2 on ResourceTypePermission (roleId);

create unique index IX_A88E424E on Role_ (companyId, classNameId, classPK);
create unique index IX_EBC931B8 on Role_ (companyId, name);
create index IX_F3E1C6FC on Role_ (companyId, type_);
create index IX_F436EC8E on Role_ (name);
create index IX_5EB4E2FB on Role_ (subtype);
create index IX_CBE204 on Role_ (type_, subtype);
create index IX_B9FF6043 on Role_ (uuid_, companyId);

create unique index IX_4F0315B8 on ServiceComponent (buildNamespace, buildNumber);

create index IX_F542E9BC on SocialActivity (activitySetId);
create index IX_D0E9029E on SocialActivity (classNameId, classPK, type_);
create index IX_64B1BC66 on SocialActivity (companyId);
create index IX_FB604DC7 on SocialActivity (groupId, userId, classNameId, classPK, type_, receiverUserId);
create unique index IX_8F32DEC9 on SocialActivity (groupId, userId, createDate, classNameId, classPK, type_, receiverUserId);
create index IX_1F00C374 on SocialActivity (mirrorActivityId, classNameId, classPK);
create index IX_121CA3CB on SocialActivity (receiverUserId);
create index IX_3504B8BC on SocialActivity (userId);

create index IX_83E16F2F on SocialActivityAchievement (groupId, firstInGroup);
create index IX_8F6408F0 on SocialActivityAchievement (groupId, name);
create index IX_AABC18E9 on SocialActivityAchievement (groupId, userId, firstInGroup);
create unique index IX_D4390CAA on SocialActivityAchievement (groupId, userId, name);

create index IX_A4B9A23B on SocialActivityCounter (classNameId, classPK);
create unique index IX_1B7E3B67 on SocialActivityCounter (groupId, classNameId, classPK, name, ownerType, endPeriod);
create unique index IX_374B35AE on SocialActivityCounter (groupId, classNameId, classPK, name, ownerType, startPeriod);
create index IX_926CDD04 on SocialActivityCounter (groupId, classNameId, classPK, ownerType);

create index IX_B15863FA on SocialActivityLimit (classNameId, classPK);
create unique index IX_F1C1A617 on SocialActivityLimit (groupId, userId, classNameId, classPK, activityType, activityCounterName);
create index IX_6F9EDE9F on SocialActivityLimit (userId);

create index IX_4460FA14 on SocialActivitySet (classNameId, classPK, type_);
create index IX_9BE30DDF on SocialActivitySet (groupId, userId, classNameId, type_);
create index IX_F71071BD on SocialActivitySet (groupId, userId, type_);
create index IX_62AC101A on SocialActivitySet (userId, classNameId, classPK, type_);

create index IX_384788CD on SocialActivitySetting (groupId, activityType);
create index IX_D984AABA on SocialActivitySetting (groupId, classNameId, activityType, name);

create index IX_95135D1C on SocialRelation (companyId, type_);
create index IX_C31A64C6 on SocialRelation (type_);
create index IX_4B52BE89 on SocialRelation (userId1, type_);
create unique index IX_12A92145 on SocialRelation (userId1, userId2, type_);
create index IX_3F9C2FA8 on SocialRelation (userId2, type_);
create index IX_5B30F663 on SocialRelation (uuid_, companyId);

create index IX_D3425487 on SocialRequest (classNameId, classPK, type_, receiverUserId, status);
create index IX_A90FE5A0 on SocialRequest (companyId);
create index IX_D9380CB7 on SocialRequest (receiverUserId, status);
create unique index IX_36A90CA7 on SocialRequest (userId, classNameId, classPK, type_, receiverUserId);
create index IX_CC86A444 on SocialRequest (userId, classNameId, classPK, type_, status);
create index IX_AB5906A8 on SocialRequest (userId, status);
create index IX_8D42897C on SocialRequest (uuid_, companyId);
create unique index IX_4F973EFE on SocialRequest (uuid_, groupId);

create index IX_786D171A on Subscription (companyId, classNameId, classPK);
create unique index IX_2E1A92D4 on Subscription (companyId, userId, classNameId, classPK);
create index IX_1290B81 on Subscription (groupId, userId);
create index IX_E8F34171 on Subscription (userId, classNameId);

create index IX_FFCBB747 on SystemEvent (groupId, classNameId, classPK, type_);
create index IX_A19C89FF on SystemEvent (groupId, systemEventSetKey);

create unique index IX_143DC786 on Team (groupId, name);
create index IX_5D47F637 on Team (uuid_, companyId);
create unique index IX_39F69E79 on Team (uuid_, groupId);

create index IX_1E8DFB2E on Ticket (classNameId, classPK, type_);
create index IX_B2468446 on Ticket (key_);

create unique index IX_B35F73D5 on TrashEntry (classNameId, classPK);
create index IX_2674F2A8 on TrashEntry (companyId);
create index IX_FC4EEA64 on TrashEntry (groupId, classNameId);
create index IX_6CAAE2E8 on TrashEntry (groupId, createDate);

create unique index IX_630A643B on TrashVersion (classNameId, classPK);
create index IX_72D58D37 on TrashVersion (entryId, classNameId);

create unique index IX_23EAD0D on UserGroup (companyId, name);
create index IX_69771487 on UserGroup (companyId, parentUserGroupId);
create index IX_72394F8E on UserGroup (uuid_, companyId);

create index IX_CAB0CCC8 on UserGroupGroupRole (groupId, roleId);
create index IX_1CDF88C on UserGroupGroupRole (roleId);
create index IX_73C52252 on UserGroupGroupRole (userGroupId, groupId);

create index IX_871412DF on UserGroupRole (groupId, roleId);
create index IX_887A2C95 on UserGroupRole (roleId);
create index IX_4D040680 on UserGroupRole (userId, groupId);

create index IX_2AC5356C on UserGroups_Teams (companyId);
create index IX_31FB0B08 on UserGroups_Teams (teamId);
create index IX_7F187E63 on UserGroups_Teams (userGroupId);

create unique index IX_41A32E0D on UserIdMapper (type_, externalUserId);
create unique index IX_D1C44A6E on UserIdMapper (userId, type_);

create unique index IX_8B6E3ACE on UserNotificationDelivery (userId, portletId, classNameId, notificationType, deliveryType);

create index IX_BF29100B on UserNotificationEvent (type_);
create index IX_5CE95F03 on UserNotificationEvent (userId, actionRequired, archived);
create index IX_3DBB361A on UserNotificationEvent (userId, archived);
create index IX_E32CC19 on UserNotificationEvent (userId, delivered, actionRequired);
create index IX_C4EFBD45 on UserNotificationEvent (userId, deliveryType, actionRequired, archived);
create index IX_A87A585C on UserNotificationEvent (userId, deliveryType, archived);
create index IX_A6F83617 on UserNotificationEvent (userId, deliveryType, delivered, actionRequired);
create index IX_8FB65EC1 on UserNotificationEvent (userId, type_, deliveryType, delivered);
create index IX_A6BAFDFE on UserNotificationEvent (uuid_, companyId);

create index IX_29BA1CF5 on UserTracker (companyId);
create index IX_46B0AE8E on UserTracker (sessionId);
create index IX_E4EFBA8D on UserTracker (userId);

create index IX_14D8BCC0 on UserTrackerPath (userTrackerId);

create index IX_BCFDA257 on User_ (companyId, createDate, modifiedDate);
create index IX_C6EA4F34 on User_ (companyId, defaultUser, status);
create unique index IX_615E9F7A on User_ (companyId, emailAddress);
create index IX_1D731F03 on User_ (companyId, facebookId);
create index IX_B6E3AE1 on User_ (companyId, googleUserId);
create index IX_EE8ABD19 on User_ (companyId, modifiedDate);
create index IX_89509087 on User_ (companyId, openId);
create unique index IX_C5806019 on User_ (companyId, screenName);
create index IX_F6039434 on User_ (companyId, status);
create unique index IX_9782AD88 on User_ (companyId, userId);
create unique index IX_5ADBE171 on User_ (contactId);
create index IX_762F63C6 on User_ (emailAddress);
create index IX_A18034A4 on User_ (portraitId);
create index IX_405CC0E on User_ (uuid_, companyId);

create index IX_3499B657 on Users_Groups (companyId);
create index IX_C4F9E699 on Users_Groups (groupId);
create index IX_F10B6C6B on Users_Groups (userId);

create index IX_5FBB883C on Users_Orgs (companyId);
create index IX_7EF4EC0E on Users_Orgs (organizationId);
create index IX_FB646CA6 on Users_Orgs (userId);

create index IX_F987A0DC on Users_Roles (companyId);
create index IX_C19E5F31 on Users_Roles (roleId);
create index IX_C1A01806 on Users_Roles (userId);

create index IX_799F8283 on Users_Teams (companyId);
create index IX_4D06AD51 on Users_Teams (teamId);
create index IX_A098EFBF on Users_Teams (userId);

create index IX_BB65040C on Users_UserGroups (companyId);
create index IX_66FF2503 on Users_UserGroups (userGroupId);
create index IX_BE8102D6 on Users_UserGroups (userId);

create unique index IX_A083D394 on VirtualHost (companyId, layoutSetId);
create unique index IX_431A3960 on VirtualHost (hostname);

create unique index IX_97DFA146 on WebDAVProps (classNameId, classPK);

create index IX_1AA07A6D on Website (companyId, classNameId, classPK, primary_);
create index IX_F75690BB on Website (userId);
create index IX_712BCD35 on Website (uuid_, companyId);

create index IX_A4DB1F0F on WorkflowDefinitionLink (companyId, workflowDefinitionName, workflowDefinitionVersion);
create index IX_705B40EE on WorkflowDefinitionLink (groupId, companyId, classNameId, classPK, typePK);

create index IX_415A7007 on WorkflowInstanceLink (groupId, companyId, classNameId, classPK);


