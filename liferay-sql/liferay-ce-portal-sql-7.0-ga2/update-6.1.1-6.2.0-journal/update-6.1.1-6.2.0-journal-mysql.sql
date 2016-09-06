alter table JournalArticle add folderId bigint;
alter table JournalArticle add treePath longtext null;

commit;

update JournalArticle set folderId = 0;

create table JournalFolder (
	uuid_ varchar(75) null,
	folderId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	parentFolderId bigint,
	treePath longtext null,
	name varchar(100) null,
	description longtext null,
	status integer,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate datetime null
) engine InnoDB;
