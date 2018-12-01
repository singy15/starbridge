-- Create Database.
CREATE DATABASE sample_db
  WITH ENCODING='UTF8'
       LC_COLLATE='Japanese_Japan.932'
       LC_CTYPE='Japanese_Japan.932'
       CONNECTION LIMIT=-1
       TABLESPACE=pg_default;

-- Create role.
CREATE ROLE sample_db_user LOGIN ENCRYPTED PASSWORD 'md5df78ef8d404d3dea260fd255a766e9ae'
  SUPERUSER CREATEDB
   VALID UNTIL 'infinity';
