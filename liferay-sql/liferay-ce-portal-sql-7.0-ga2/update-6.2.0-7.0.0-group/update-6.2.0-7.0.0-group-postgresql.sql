alter table Group_ add groupKey text;

update Group_ set groupKey = name;

alter table Group_ add inheritContent bool;
