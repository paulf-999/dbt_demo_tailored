!SET variable_substitution=true;
/*
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE &{PROGRAM}_DEVELOPER_WH;
DROP DATABASE IF EXISTS &{PROGRAM}_SNAPSHOT_PROC_DB;
*/

USE ROLE &{PROGRAM}_DBA;
USE WAREHOUSE &{PROGRAM}_DEVELOPER_WH;

--create SNAPSHOT_PROC_DB structure
CREATE DATABASE IF NOT EXISTS &{PROGRAM}_SNAPSHOT_PROC_DB COMMENT = 'Ingestion / landing area, containing raw, non-transformed source system data';
CREATE SCHEMA IF NOT EXISTS &{PROGRAM}_SNAPSHOT_PROC_DB.PRODUCTION WITH MANAGED ACCESS;
CREATE SCHEMA IF NOT EXISTS &{PROGRAM}_SNAPSHOT_PROC_DB.SALES WITH MANAGED ACCESS;
CREATE SCHEMA IF NOT EXISTS &{PROGRAM}_SNAPSHOT_PROC_DB.UTILITIES WITH MANAGED ACCESS COMMENT = 'Contains all database objects other than tables or views';
DROP SCHEMA IF EXISTS &{PROGRAM}_SNAPSHOT_PROC_DB.PUBLIC;
