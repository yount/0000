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

create or replace rule delete_DLContent_data_ as on delete to DLContent do also select case when exists(select 1 from pg_catalog.pg_largeobject where (loid = old.data_)) then lo_unlink(old.data_) end from DLContent where DLContent.data_ = old.data_;
create or replace rule update_DLContent_data_ as on update to DLContent where old.data_ is distinct from new.data_ and old.data_ is not null do also select case when exists(select 1 from pg_catalog.pg_largeobject where (loid = old.data_)) then lo_unlink(old.data_) end from DLContent where DLContent.data_ = old.data_;