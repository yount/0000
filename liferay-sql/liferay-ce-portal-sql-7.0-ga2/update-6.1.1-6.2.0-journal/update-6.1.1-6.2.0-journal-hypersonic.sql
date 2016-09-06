alter table JournalArticle add folderId bigint;
alter table JournalArticle add treePath longvarchar null;

commit;

update JournalArticle set folderId = 0;

create table JournalFolder (
	uuid_ varchar(75) null,
	folderId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	parentFolderId bigint,
	treePath longvarchar null,
	name varchar(100) null,
	description longvarchar null,
	status int,
	statusByUserId bigint,
	statusByUserName varchar(75) null,
	statusDate timestamp null
);
