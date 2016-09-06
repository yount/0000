alter table AssetEntry add listable tinyint;

alter table AssetTag add uuid_ varchar(75);

commit;

update AssetEntry set listable = 1;

drop table AssetTagProperty;
