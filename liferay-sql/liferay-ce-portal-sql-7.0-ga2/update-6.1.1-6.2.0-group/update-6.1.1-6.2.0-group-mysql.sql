alter table Group_ add uuid_ varchar(75) null;
alter table Group_ add treePath longtext null;
alter table Group_ add manualMembership tinyint;
alter table Group_ add membershipRestriction integer;
alter table Group_ add remoteStagingGroupCount integer;

commit;

update Group_ set manualMembership = 1;
update Group_ set membershipRestriction = 0;
update Group_ set site = 0 where name = 'Control Panel';
update Group_ set site = 1 where friendlyURL = '/global';
