alter table Group_ add uuid_ varchar(75) null;
alter table Group_ add treePath longvarchar null;
alter table Group_ add manualMembership bit;
alter table Group_ add membershipRestriction int;
alter table Group_ add remoteStagingGroupCount int;

commit;

update Group_ set manualMembership = true;
update Group_ set membershipRestriction = 0;
update Group_ set site = false where name = 'Control Panel';
update Group_ set site = true where friendlyURL = '/global';
