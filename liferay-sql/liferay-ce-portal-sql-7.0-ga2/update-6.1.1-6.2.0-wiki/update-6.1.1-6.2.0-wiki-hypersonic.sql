alter table WikiNode add status int;
alter table WikiNode add statusByUserId bigint;
alter table WikiNode add statusByUserName varchar(75) null;
alter table WikiNode add statusDate timestamp null;

commit;

update WikiNode set status = 0;
update WikiNode set statusByUserId = userId;
update WikiNode set statusByUserName = userName;
update WikiNode set statusDate = modifiedDate;
