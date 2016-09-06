alter table Group_ add groupKey longvarchar;

update Group_ set groupKey = name;

alter table Group_ add inheritContent bit;
