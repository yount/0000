alter table Group_ add groupKey longtext;

update Group_ set groupKey = name;

alter table Group_ add inheritContent tinyint;
