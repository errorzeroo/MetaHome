DROP TABLE IF EXISTS AI_LEARN;

CREATE TABLE AI_LEARN(
ADDRESS VARCHAR2(1000) PRIMARY KEY,
PARK_NAME VARCHAR2(1000),
PARK_DIST INTEGER NOT NULL,
HOS_NAME VARCHAR2(1000),
HOS_DIST INTEGER NOT NULL,
SUB_NAME VARCHAR2(1000),
SUB_DIST INTEGER NOT NULL,
BUS_NAME VARCHAR2(1000),
BUS_DIST INTEGER NOT NULL,
PARKING_NAME VARCHAR2(1000),
PARKING_DIST INTEGER,
LOW_NAME VARCHAR2(1000),
LOW_DIST INTEGER NOT NULL,
MID_NAME VARCHAR2(1000),
MID_DIST INTEGER NOT NULL,
HI_NAME VARCHAR2(1000),
HI_DIST INTEGER,
CF_NAME VARCHAR2(1000),
CF_DIST INTEGER,
CONVE_NAME VARCHAR2(1000),
CONVE_DIST INTEGER,
ART_NAME VARCHAR2(1000),
ART_DIST INTEGER);