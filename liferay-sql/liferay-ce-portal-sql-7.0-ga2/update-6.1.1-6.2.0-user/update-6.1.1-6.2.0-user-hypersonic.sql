alter table User_ add ldapServerId bigint;

commit;

update User_ set ldapServerId = -1;
