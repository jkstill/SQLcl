
-- sqlcl fails to open the file unless there is something in the SQL buffer

set echo on

edit edit-tests

select count(*) from dual;

edit edit-tests

set echo off

