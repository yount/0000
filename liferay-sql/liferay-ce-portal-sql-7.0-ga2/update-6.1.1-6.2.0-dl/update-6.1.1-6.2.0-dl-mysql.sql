alter table DLFileEntry drop column versionUserId;
alter table DLFileEntry drop column versionUserName;

alter table DLFileEntry add classNameId bigint;
alter table DLFileEntry add classPK bigint;
alter table DLFileEntry add treePath longtext null;
alter table DLFileEntry add manualCheckInRequired tinyint;

commit;

update DLFileEntry set classNameId = 0;
update DLFileEntry set classPK = 0;
update DLFileEntry set manualCheckInRequired = 0;

drop index IX_E9B6A85B on DLFileEntryType;

alter table DLFileRank add active_ tinyint;

commit;

update DLFileRank set active_ = 1;

alter table DLFileShortcut add treePath longtext null;
alter table DLFileShortcut add active_ tinyint;

commit;

update DLFileShortcut set active_ = 1;

alter table DLFileVersion add treePath longtext null;
alter table DLFileVersion add checksum varchar(75) null;

alter table DLFolder add treePath longtext null;
alter table DLFolder add hidden_ tinyint;
alter table DLFolder add status integer;
alter table DLFolder add statusByUserId bigint;
alter table DLFolder add statusByUserName varchar(75) null;
alter table DLFolder add statusDate datetime null;

commit;

update DLFolder set hidden_ = 0;
update DLFolder set status = 0;
update DLFolder set statusByUserId = userId;
update DLFolder set statusByUserName = userName;
update DLFolder set statusDate = modifiedDate;

drop table DLSync;

create table DLSyncEvent (
	syncEventId bigint not null primary key,
	modifiedTime bigint,
	event varchar(75) null,
	type_ varchar(75) null,
	typePK bigint
) engine InnoDB;
