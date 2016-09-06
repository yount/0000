alter table ExpandoRow add modifiedDate datetime null;

commit;

update ExpandoRow set modifiedDate = now();
