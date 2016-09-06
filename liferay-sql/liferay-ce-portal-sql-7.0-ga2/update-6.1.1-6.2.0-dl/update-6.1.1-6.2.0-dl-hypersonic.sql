alter table DLFileEntry drop column versionUserId;
alter table DLFileEntry drop column versionUserName;

alter table DLFileEntry add classNameId bigint;
alter table DLFileEntry add classPK bigint;
alter table DLFileEntry add treePath longvarchar null;
alter table DLFileEntry add manualCheckInRequired bit;

commit;

update DLFileEntry set classNameId = 0;
update DLFileEntry set classPK = 0;
update DLFileEntry set manualCheckInRequired = false;

drop index IX_E9B6A85B;

alter table DLFileRank add active_ bit;

commit;

update DLFileRank set active_ = true;

alter table DLFileShortcut add treePath longvarchar null;
alter table DLFileShortcut add active_ bit;

commit;

update DLFileShortcut set active_ = true;

alter table DLFileVersion add treePath longvarchar null;
alter table DLFileVersion add checksum varchar(75) null;

alter table DLFolder add treePath longvarchar null;
alter table DLFolder add hidden_ bit;
alter table DLFolder add status int;
alter table DLFolder add statusByUserId bigint;
alter table DLFolder add statusByUserName varchar(75) null;
alter table DLFolder add statusDate timestamp null;

commit;

update DLFolder set hidden_ = false;
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
);
