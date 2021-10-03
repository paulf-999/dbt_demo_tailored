!SET variable_substitution=true;
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE &{PROGRAM}_DEVELOPER_WH;

DROP INTEGRATION IF EXISTS &{PROGRAM}_S3_INT;

DROP DATABASE IF EXISTS &{PROGRAM}_RAW_DB;
DROP DATABASE IF EXISTS &{PROGRAM}_CURATED_DB;
DROP DATABASE IF EXISTS &{PROGRAM}_ANALYTICS_DB;

DROP WAREHOUSE IF EXISTS &{PROGRAM}_LOADING_WH;
DROP WAREHOUSE IF EXISTS &{PROGRAM}_TRANSFORMATION_WH;
DROP WAREHOUSE IF EXISTS &{PROGRAM}_TRANSFORMATION_LRG_WH;
DROP WAREHOUSE IF EXISTS &{PROGRAM}_SP_TRANSFORMATION_WH;
DROP WAREHOUSE IF EXISTS &{PROGRAM}_REPORTING_WH;
DROP WAREHOUSE IF EXISTS &{PROGRAM}_DEVELOPER_WH;
DROP WAREHOUSE IF EXISTS &{PROGRAM}_DEVELOPER_WH;

USE ROLE &{PROGRAM}_DBA;
DROP RESOURCE MONITOR IF EXISTS &{PROGRAM}_DEVELOPER_WH_RM;
DROP RESOURCE MONITOR IF EXISTS &{PROGRAM}_REPORTING_WH_RM;
DROP RESOURCE MONITOR IF EXISTS &{PROGRAM}_LOADING_WH_RM;
DROP RESOURCE MONITOR IF EXISTS &{PROGRAM}_TRANSFORMATION_WH_RM;
DROP RESOURCE MONITOR IF EXISTS &{PROGRAM}_TRANSFORMATION_LRG_WH_RM;
DROP RESOURCE MONITOR IF EXISTS &{PROGRAM}_SP_TRANSFORMATION_WH_RM;

USE ROLE ACCOUNTADMIN;
DROP ROLE IF EXISTS &{PROGRAM}_DBA;
DROP ROLE IF EXISTS &{PROGRAM}_DATA_LOADER;
DROP ROLE IF EXISTS &{PROGRAM}_DEVELOPER;
DROP ROLE IF EXISTS &{PROGRAM}_ANALYST;
DROP ROLE IF EXISTS &{PROGRAM}_VISUALISER;
DROP ROLE IF EXISTS &{PROGRAM}_DBT_SVC;
DROP ROLE IF EXISTS &{PROGRAM}_SF_TASK_ADMIN;
DROP ROLE IF EXISTS &{PROGRAM}_SF_STAGE_ADMIN;
DROP ROLE IF EXISTS &{PROGRAM}_RM_ADMIN;
DROP ROLE IF EXISTS &{PROGRAM}_SF_SI_ADMIN;
