alter table Group_ add uuid_ varchar(75) null;
alter table Group_ add treePath text null;
alter table Group_ add manualMembership bool;
alter table Group_ add membershipRestriction integer;
alter table Group_ add remoteStagingGroupCount integer;

commit;

update Group_ set manualMembership = true;
update Group_ set membershipRestriction = 0;
update Group_ set site = false where name = 'Control Panel';
update Group_ set site = true where friendlyURL = '/global';
