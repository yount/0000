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
	mailing bit,
	primary_ bit
);

create table AnnouncementsDelivery (
	deliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	type_ varchar(75) null,
	email bit,
	sms bit,
	website bit
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
	content longvarchar null,
	url longvarchar null,
	type_ varchar(75) null,
	displayDate timestamp null,
	expirationDate timestamp null,
	priority int,
	alert bit
);

create table AnnouncementsFlag (
	flagId bigint not null primary key,
	companyId bigint,
	userId bigint,
	createDate timestamp null,
	entryId bigint,
	value int
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
	title longvarchar null,
	description longvarchar null,
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
	listable bit,
	visible bit,
	startDate timestamp null,
	endDate timestamp null,
	publishDate timestamp null,
	expirationDate timestamp null,
	mimeType varchar(75) null,
	title longvarchar null,
	description longvarchar null,
	summary longvarchar null,
	url longvarchar null,
	layoutUuid varchar(75) null,
	height int,
	width int,
	priority double,
	viewCount int
);

create table AssetLink (
	linkId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	entryId1 bigint,
	entryId2 bigint,
	type_ int,
	weight int
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
	assetCount int,
	lastPublishDate timestamp null
);

create table AssetTagStats (
	tagStatsId bigint not null primary key,
	companyId bigint,
	tagId bigint,
	classNameId bigint,
	assetCount int
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
	title longvarchar null,
	description longvarchar null,
	settings_ longvarchar null,
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
	subtitle longvarchar null,
	urlTitle varchar(150) null,
	description longvarchar null,
	content longvarchar null,
	displayDate timestamp null,
	allowPingbacks bit,
	allowTrackbacks bit,
	trackbacks longvarchar null,
	coverImageCaption longvarchar null,
	coverImageFileEntryId bigint,
	coverImageURL longvarchar null,
	smallImage bit,
	smallImageFileEntryId bigint,
	smallImageId bigint,
	smallImageURL longvarchar null,
	lastPublishDate timestamp null,
	status int,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table BlogsStatsUser (
	statsUserId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	entryCount int,
	lastPostDate timestamp null,
	ratingsTotalEntries int,
	ratingsTotalScore double,
	ratingsAverageScore double
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
	wholeCluster bit
);

create table Company (
	mvccVersion bigint default 0 not null,
	companyId bigint not null primary key,
	accountId bigint,
	webId varchar(75) null,
	key_ longvarchar null,
	mx varchar(75) null,
	homeURL longvarchar null,
	logoId bigint,
	system bit,
	maxUsers int,
	active_ bit
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
	male bit,
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
	zipRequired bit,
	active_ bit
);

create table DLContent (
	contentId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	repositoryId bigint,
	path_ varchar(255) null,
	version varchar(75) null,
	data_ blob,
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
	treePath longvarchar null,
	name varchar(255) null,
	fileName varchar(255) null,
	extension varchar(75) null,
	mimeType varchar(75) null,
	title varchar(255) null,
	description longvarchar null,
	extraSettings longvarchar null,
	fileEntryTypeId bigint,
	version varchar(75) null,
	size_ bigint,
	readCount int,
	smallImageId bigint,
	largeImageId bigint,
	custom1ImageId bigint,
	custom2ImageId bigint,
	manualCheckInRequired bit,
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
	name longvarchar null,
	description longvarchar null,
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
	active_ bit
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
	treePath longvarchar null,
	active_ bit,
	lastPublishDate timestamp null,
	status int,
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
	treePath longvarchar null,
	fileName varchar(255) null,
	extension varchar(75) null,
	mimeType varchar(75) null,
	title varchar(255) null,
	description longvarchar null,
	changeLog varchar(75) null,
	extraSettings longvarchar null,
	fileEntryTypeId bigint,
	version varchar(75) null,
	size_ bigint,
	checksum varchar(75) null,
	lastPublishDate timestamp null,
	status int,
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
	mountPoint bit,
	parentFolderId bigint,
	treePath longvarchar null,
	name varchar(255) null,
	description longvarchar null,
	lastPostDate timestamp null,
	defaultFileEntryTypeId bigint,
	hidden_ bit,
	restrictionType int,
	lastPublishDate timestamp null,
	status int,
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
	primary_ bit
);

create table ExpandoColumn (
	columnId bigint not null primary key,
	companyId bigint,
	tableId bigint,
	name varchar(75) null,
	type_ int,
	defaultData longvarchar null,
	typeSettings longvarchar null
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
	data_ longvarchar null
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
	description longvarchar null,
	type_ int,
	settings_ longvarchar null,
	status int,
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
	treePath longvarchar null,
	groupKey varchar(150) null,
	name longvarchar null,
	description longvarchar null,
	type_ int,
	typeSettings longvarchar null,
	manualMembership bit,
	membershipRestriction int,
	friendlyURL varchar(255) null,
	site bit,
	remoteStagingGroupCount int,
	inheritContent bit,
	active_ bit
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
	height int,
	width int,
	size_ int
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
	privateLayout bit,
	layoutId bigint,
	parentLayoutId bigint,
	name longvarchar null,
	title longvarchar null,
	description longvarchar null,
	keywords longvarchar null,
	robots longvarchar null,
	type_ varchar(75) null,
	typeSettings longvarchar null,
	hidden_ bit,
	friendlyURL varchar(255) null,
	iconImageId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css longvarchar null,
	priority int,
	layoutPrototypeUuid varchar(75) null,
	layoutPrototypeLinkEnabled bit,
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
	description longvarchar null,
	master bit
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
	privateLayout bit,
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
	name longvarchar null,
	description longvarchar null,
	settings_ longvarchar null,
	active_ bit
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
	head bit,
	major bit,
	plid bigint,
	privateLayout bit,
	name longvarchar null,
	title longvarchar null,
	description longvarchar null,
	keywords longvarchar null,
	robots longvarchar null,
	typeSettings longvarchar null,
	iconImageId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css longvarchar null,
	status int,
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
	privateLayout bit,
	logoId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css longvarchar null,
	pageCount int,
	settings_ longvarchar null,
	layoutSetPrototypeUuid varchar(75) null,
	layoutSetPrototypeLinkEnabled bit
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
	privateLayout bit,
	name varchar(75) null,
	description longvarchar null,
	master bit,
	logoId bigint,
	themeId varchar(75) null,
	colorSchemeId varchar(75) null,
	css longvarchar null,
	settings_ longvarchar null,
	layoutSetPrototypeUuid varchar(75) null,
	layoutSetPrototypeLinkEnabled bit
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
	name longvarchar null,
	description longvarchar null,
	settings_ longvarchar null,
	active_ bit
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
	description longvarchar null,
	displayStyle varchar(75) null,
	threadCount int,
	messageCount int,
	lastPostDate timestamp null,
	lastPublishDate timestamp null,
	status int,
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
	inServerPort int,
	inUseSSL bit,
	inUserName varchar(75) null,
	inPassword varchar(75) null,
	inReadInterval int,
	outEmailAddress varchar(75) null,
	outCustom bit,
	outServerName varchar(75) null,
	outServerPort int,
	outUseSSL bit,
	outUserName varchar(75) null,
	outPassword varchar(75) null,
	allowAnonymous bit,
	active_ bit
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
	body longvarchar null,
	format varchar(75) null,
	anonymous bit,
	priority double,
	allowPingbacks bit,
	answer bit,
	lastPublishDate timestamp null,
	status int,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);

create table MBStatsUser (
	statsUserId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	messageCount int,
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
	messageCount int,
	viewCount int,
	lastPostByUserId bigint,
	lastPostDate timestamp null,
	priority double,
	question bit,
	lastPublishDate timestamp null,
	status int,
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
	comments longvarchar null,
	replyComments longvarchar null,
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
	treePath longvarchar null,
	name varchar(100) null,
	type_ varchar(75) null,
	recursable bit,
	regionId bigint,
	countryId bigint,
	statusId bigint,
	comments longvarchar null,
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
	sunOpen int,
	sunClose int,
	monOpen int,
	monClose int,
	tueOpen int,
	tueClose int,
	wedOpen int,
	wedClose int,
	thuOpen int,
	thuClose int,
	friOpen int,
	friClose int,
	satOpen int,
	satClose int
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
	defaultPolicy bit,
	name varchar(75) null,
	description longvarchar null,
	changeable bit,
	changeRequired bit,
	minAge bigint,
	checkSyntax bit,
	allowDictionaryWords bit,
	minAlphanumeric int,
	minLength int,
	minLowerCase int,
	minNumbers int,
	minSymbols int,
	minUpperCase int,
	regex varchar(75) null,
	history bit,
	historyCount int,
	expireable bit,
	maxAge bigint,
	warningTime bigint,
	graceLimit int,
	lockout bit,
	maxFailure int,
	lockoutDuration bigint,
	requireUnlock bit,
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
	primary_ bit
);

create table PluginSetting (
	mvccVersion bigint default 0 not null,
	pluginSettingId bigint not null primary key,
	companyId bigint,
	pluginId varchar(75) null,
	pluginType varchar(75) null,
	roles longvarchar null,
	active_ bit
);

create table PortalPreferences (
	mvccVersion bigint default 0 not null,
	portalPreferencesId bigint not null primary key,
	ownerId bigint,
	ownerType int,
	preferences longvarchar null
);

create table Portlet (
	mvccVersion bigint default 0 not null,
	id_ bigint not null primary key,
	companyId bigint,
	portletId varchar(200) null,
	roles longvarchar null,
	active_ bit
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
	ownerType int,
	plid bigint,
	portletId varchar(200) null,
	preferences longvarchar null
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
	score double
);

create table RatingsStats (
	statsId bigint not null primary key,
	companyId bigint,
	classNameId bigint,
	classPK bigint,
	totalEntries int,
	totalScore double,
	averageScore double
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
	active_ bit
);

create table Release_ (
	mvccVersion bigint default 0 not null,
	releaseId bigint not null primary key,
	createDate timestamp null,
	modifiedDate timestamp null,
	servletContextName varchar(75) null,
	schemaVersion varchar(75) null,
	buildNumber int,
	buildDate timestamp null,
	verified bit,
	state_ int,
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
	description longvarchar null,
	portletId varchar(200) null,
	typeSettings longvarchar null,
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
	manualCheckInRequired bit,
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
	scope int,
	primKey varchar(255) null,
	primKeyId bigint,
	roleId bigint,
	ownerId bigint,
	actionIds bigint,
	viewActionId bit
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
	title longvarchar null,
	description longvarchar null,
	type_ int,
	subtype varchar(75) null
);

create table ServiceComponent (
	mvccVersion bigint default 0 not null,
	serviceComponentId bigint not null primary key,
	buildNamespace varchar(75) null,
	buildNumber bigint,
	buildDate bigint,
	data_ longvarchar null
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
	type_ int,
	extraData longvarchar null,
	receiverUserId bigint
);

create table SocialActivityAchievement (
	activityAchievementId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	createDate bigint,
	name varchar(75) null,
	firstInGroup bit
);

create table SocialActivityCounter (
	activityCounterId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	classNameId bigint,
	classPK bigint,
	name varchar(75) null,
	ownerType int,
	currentValue int,
	totalValue int,
	graceValue int,
	startPeriod int,
	endPeriod int,
	active_ bit
);

create table SocialActivityLimit (
	activityLimitId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	classNameId bigint,
	classPK bigint,
	activityType int,
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
	type_ int,
	extraData longvarchar null,
	activityCount int
);

create table SocialActivitySetting (
	activitySettingId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	classNameId bigint,
	activityType int,
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
	type_ int
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
	type_ int,
	extraData longvarchar null,
	receiverUserId bigint,
	status int
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
	type_ int,
	extraData longvarchar null
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
	description longvarchar null,
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
	type_ int,
	extraInfo longvarchar null,
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
	typeSettings longvarchar null,
	status int
);

create table TrashVersion (
	versionId bigint not null primary key,
	companyId bigint,
	entryId bigint,
	classNameId bigint,
	classPK bigint,
	typeSettings longvarchar null,
	status int
);

create table UserNotificationDelivery (
	mvccVersion bigint default 0 not null,
	userNotificationDeliveryId bigint not null primary key,
	companyId bigint,
	userId bigint,
	portletId varchar(200) null,
	classNameId bigint,
	notificationType int,
	deliveryType int,
	deliver bit
);

create table User_ (
	mvccVersion bigint default 0 not null,
	uuid_ varchar(75) null,
	userId bigint not null primary key,
	companyId bigint,
	createDate timestamp null,
	modifiedDate timestamp null,
	defaultUser bit,
	contactId bigint,
	password_ varchar(75) null,
	passwordEncrypted bit,
	passwordReset bit,
	passwordModifiedDate timestamp null,
	digest varchar(255) null,
	reminderQueryQuestion varchar(75) null,
	reminderQueryAnswer varchar(75) null,
	graceLoginCount int,
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
	comments longvarchar null,
	firstName varchar(75) null,
	middleName varchar(75) null,
	lastName varchar(75) null,
	jobTitle varchar(100) null,
	loginDate timestamp null,
	loginIP varchar(75) null,
	lastLoginDate timestamp null,
	lastLoginIP varchar(75) null,
	lastFailedLoginDate timestamp null,
	failedLoginAttempts int,
	lockout bit,
	lockoutDate timestamp null,
	agreedToTermsOfUse bit,
	emailAddressVerified bit,
	status int
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
	description longvarchar null,
	addedByLDAPImport bit
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
	deliveryType int,
	deliverBy bigint,
	delivered bit,
	payload longvarchar null,
	actionRequired bit,
	archived bit
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
	path_ longvarchar null,
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
	props longvarchar null
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
	url longvarchar null,
	typeId bigint,
	primary_ bit,
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
	workflowDefinitionVersion int
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
