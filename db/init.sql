CREATE ROLE auth_app LOGIN PASSWORD 'auth_local';
CREATE DATABASE auth_db OWNER auth_app;
REVOKE CONNECT ON DATABASE auth_db FROM PUBLIC;

\connect auth_db
SET ROLE auth_app;
\i /opt/erp/master.sql
