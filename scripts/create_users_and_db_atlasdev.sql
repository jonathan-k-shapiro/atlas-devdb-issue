-- CREATE ROLE myowner LOGIN;
-- CREATE ROLE myuser LOGIN ENCRYPTED PASSWORD 'logmein';
-- ALTER USER myowner SET search_path = myschema,public;
-- ALTER USER myuser SET search_path = myschema,public;

CREATE DATABASE mydb WITH ENCODING 'UTF8' LC_COLLATE='en_US.UTF-8' LC_CTYPE='en_US.UTF-8' TEMPLATE=template0;