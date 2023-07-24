--User and role permissions
--Grant select access on database
--use the same database
GRANT SELECT ON DATABASE :: [AdventureWorksDW2017] TO test_user

--Grant dmvs access to user
USE MASTER
GO
GRANT VIEW SERVER STATE TO test_user 

--Create a new role
CREATE ROLE TEST_ROLE

--Assign the role all the access
GRANT SELECT ON DATABASE :: [AdventureWorksDW2017] TO test_role; 

--Add the user to the role
ALTER ROLE test_role ADD MEMBER test_user;

--Check user or role permissions
SELECT  name,principal_id,type,type_desc,owning_principal_id
FROM sys.database_principals
where name like '%%'

--Added one line to the user_and_role_permissions
select * from sys.dm_exec_requests 
where status='running'

--Added second line to user_and _role_permissions
select * from sys.sysprocesses where id  between 40 and 50

--Added fourth line to user_and_role_permissions
select count(*) from sys.dm_exec_connections

--Added fifth line to user_and_role_permissions
select host_name,count(*) from sys.dm_exec_sessions group by host_name order by 2 desc

--Added sixth line to user_and_role_permissions
select status,count(*) from sys.dm_exec_requests group by status

--Added seventh line to user_and_role_permissions
select status,count(*) from sys.dm_exec_sessions group by status 