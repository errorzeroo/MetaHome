DROP TABLE IF EXISTS HOME;

CREATE TABLE HOME(
HOME_ADDRESS VARCHAR2(1000),
HOME_LAT NUMBER,
HOME_LON NUMBER,
HOME_NAME VARCHAR2(1000),
HOME_KIND VARCHAR2(100),
HOME_COUNT VARCHAR2(100),
HOME_CO VARCHAR2(200),
HOME_PARKING VARCHAR2(100),
HOME_IMG VARCHAR2(4000),
HOME_NO NUMBER,
HOME_MYAREA VARCHAR2(100),
HOME_WEAREA VARCHAR2(100),
HOME_DEP VARCHAR2(100),
HOME_MOTH_PAI VARCHAR2(100),
HOME_CHANGE_DEP VARCHAR2(100),
HOME_RECR VARCHAR2(10) DEFAULT 'N',
CONSTRAINT FK_AI_HOME_ADDRESS FOREIGN KEY (HOME_ADDRESS) REFERENCES AI_LEARN(ADDRESS));