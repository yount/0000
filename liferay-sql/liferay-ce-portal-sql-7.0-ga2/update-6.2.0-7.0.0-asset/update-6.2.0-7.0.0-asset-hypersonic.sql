alter table AssetEntry add listable bit;

alter table AssetTag add uuid_ varchar(75);

commit;

update AssetEntry set listable = true;

drop table AssetTagProperty;
