alter table ExpandoRow add modifiedDate timestamp null;

commit;

update ExpandoRow set modifiedDate = now();
