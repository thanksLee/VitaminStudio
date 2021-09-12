[ORACLE-T_COMMON - 000]
sql_desc='�����ڵ� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_COMMON
0002=(
0003=  C_GUBUNKEY  VARCHAR2(3 BYTE)                  NOT NULL,
0004=  C_FLAG      VARCHAR2(3 BYTE)                  NOT NULL,
0005=  C_MEMO1     VARCHAR2(50 BYTE)                 NOT NULL,
0006=  C_MEMO2     VARCHAR2(100 BYTE),
0007=  CONSTRAINT PK_T_COMMON PRIMARY KEY (C_GUBUNKEY, C_FLAG)
0008=         USING INDEX PCTFREE 5
0009=         NOLOGGING
0010=         TABLESPACE TS_WORDDIC_IDX
0011=)
0012=TABLESPACE TS_WORDDIC_DATA

[ORACLE-T_DATATYPE - 001]
sql_desc='������Ÿ�� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_DATATYPE
0002=(
0003=  C_DUSEFALG  VARCHAR2(1 BYTE)                  NOT NULL,
0004=  C_DSEQ      VARCHAR2(5 BYTE)                  NOT NULL,
0005=  C_DTYPE     VARCHAR2(30 BYTE)                 NOT NULL,
0006=  C_DLENGTH   VARCHAR2(10 BYTE)                 NOT NULL,
0007=  C_DETC      VARCHAR2(200 BYTE),
0008=  CONSTRAINT PK_T_DATATYPE PRIMARY KEY (C_DUSEFALG, C_DSEQ)
0009=         USING INDEX PCTFREE 5
0010=         NOLOGGING
0011=         TABLESPACE TS_WORDDIC_IDX
0012=)
0013=TABLESPACE TS_WORDDIC_DATA

[ORACLE-T_USER - 002]
sql_desc='����� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_USER
0002=(
0003=  C_USERID   VARCHAR2(10 BYTE)                  NOT NULL,
0004=  C_USERNM   VARCHAR2(20 BYTE)                  NOT NULL,
0005=  C_USERPW   VARCHAR2(60 BYTE)                  NOT NULL,
0006=  C_USERATH  VARCHAR2(1 BYTE)                   DEFAULT 'U'                   NOT NULL,
0007=  CONSTRAINT PK_T_USER PRIMARY KEY (C_USERID)
0008=         USING INDEX PCTFREE 5
0009=         NOLOGGING
0010=         TABLESPACE TS_WORDDIC_IDX
0011=)
0012=TABLESPACE TS_WORDDIC_DATA


[ORACLE-T_EWORD - 003]
sql_desc='���� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_EWORD
0002=(
0003=  C_ESEQ        VARCHAR2(5 BYTE)                NOT NULL,
0004=  C_EFWORD      VARCHAR2(50 BYTE)               NOT NULL,
0005=  C_ESWORD      VARCHAR2(9 BYTE)                NOT NULL,
0006=  C_DOMAINFLAG  VARCHAR2(1 BYTE)                DEFAULT '0'                   NOT NULL,
0007=  CONSTRAINT PK_T_EWORD PRIMARY KEY (C_ESEQ)
0008=         USING INDEX PCTFREE 5
0009=         NOLOGGING
0010=         TABLESPACE TS_WORDDIC_IDX
0011=)
0012=TABLESPACE TS_WORDDIC_DATA

[ORACLE-T_HWORD - 004]
sql_desc='�ѱ� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_HWORD
0002=(
0003=  C_ESEQ       VARCHAR2(5 BYTE)                 NOT NULL,
0004=  C_HSEQ       VARCHAR2(10 BYTE)                NOT NULL,
0005=  C_APRUSERID  VARCHAR2(10 BYTE),
0006=  C_REGUSERID  VARCHAR2(10 BYTE),
0007=  C_HFWORD     VARCHAR2(50 BYTE)                NOT NULL,
0008=  C_WORDSORT   VARCHAR2(3 BYTE)                 NOT NULL,
0009=  C_WORDFORM   VARCHAR2(3 BYTE)                 NOT NULL,
0010=  C_USEFLAG    VARCHAR2(1 BYTE)                 DEFAULT '1'                   NOT NULL,
0011=  C_REGDATE    VARCHAR2(14 BYTE)                DEFAULT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') NOT NULL,
0012=  C_MEMO       VARCHAR2(200 BYTE),
0013=  CONSTRAINT PK_T_HWORD PRIMARY KEY (C_ESEQ, C_HSEQ)
0014=         USING INDEX PCTFREE 5
0015=         NOLOGGING
0016=         TABLESPACE TS_WORDDIC_IDX
0017=)
0018=TABLESPACE TS_WORDDIC_DATA

[ORACLE-T_STWORD - 005]
sql_desc='�ѱ� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_STWORD
0002=(
0003=  C_TSEQ         VARCHAR2(10 BYTE)              NOT NULL,
0004=  C_ESEQ         VARCHAR2(5 BYTE),
0005=  C_THGNM        VARCHAR2(100 BYTE)             NOT NULL,
0006=  C_THENM        VARCHAR2(50 BYTE)              NOT NULL,
0007=  C_TDOMAINFLAG  VARCHAR2(1 BYTE)               DEFAULT '1'                   NOT NULL,
0008=  CONSTRAINT PK_T_HWORD PRIMARY KEY (C_TSEQ)
0009=         USING INDEX PCTFREE 5
0010=         NOLOGGING
0011=         TABLESPACE TS_WORDDIC_IDX
0012=)
0013=TABLESPACE TS_WORDDIC_DATA

[FIREBIRD-TABLE_EXISTS-006]
sql_desc='Firebird DB Table ���� ���� �ľ�'
sql_param_cnt=1
0001=SELECT COUNT(1) C_EXISTS_CNT
0002=  FROM RDB$RELATIONS
0003= WHERE RDB$RELATION_NAME = :table_name

[FIREBIRD-T_COMMON - 007]
sql_desc='�����ڵ� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_COMMON
0002=(
0003=  C_GUBUNKEY  VARCHAR(3)                  NOT NULL,
0004=  C_FLAG      VARCHAR(3)                  NOT NULL,
0005=  C_MEMO1     VARCHAR(50)                 NOT NULL,
0006=  C_MEMO2     VARCHAR(100),
0007=  PRIMARY KEY (C_GUBUNKEY, C_FLAG)
0011=)

[FIREBIRD-T_DATATYPE - 001]
sql_desc='������Ÿ�� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_DATATYPE
0002=(
0003=  C_DUSEFALG  VARCHAR(1)                  NOT NULL,
0004=  C_DSEQ      VARCHAR(5)                  NOT NULL,
0005=  C_DTYPE     VARCHAR(30)                 NOT NULL,
0006=  C_DLENGTH   VARCHAR(10)                 NOT NULL,
0007=  C_DETC      VARCHAR(200),
0008=  PRIMARY KEY (C_DUSEFALG, C_DSEQ)
0012=)

[FIREBIRD-T_USER - 002]
sql_desc='����� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_USER
0002=(
0003=  C_USERID   VARCHAR(10)                  NOT NULL,
0004=  C_USERNM   VARCHAR(20)                  NOT NULL,
0005=  C_USERPW   VARCHAR(60)                  NOT NULL,
0006=  C_USERATH  VARCHAR(1)                   DEFAULT 'U'                   NOT NULL,
0007=  PRIMARY KEY (C_USERID)
0011=)


[FIREBIRD-T_EWORD - 003]
sql_desc='���� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_EWORD
0002=(
0003=  C_ESEQ        VARCHAR(5)                NOT NULL,
0004=  C_EFWORD      VARCHAR(50)               NOT NULL,
0005=  C_ESWORD      VARCHAR(9)                NOT NULL,
0006=  C_DOMAINFLAG  VARCHAR(1)                DEFAULT '0'                   NOT NULL,
0007=  PRIMARY KEY (C_ESEQ)
0011=)

[FIREBIRD-T_HWORD - 004]
sql_desc='�ѱ� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_HWORD
0002=(
0003=  C_ESEQ       VARCHAR(5)                 NOT NULL,
0004=  C_HSEQ       VARCHAR(10)                NOT NULL,
0005=  C_APRUSERID  VARCHAR(10),
0006=  C_REGUSERID  VARCHAR(10),
0007=  C_HFWORD     VARCHAR(50)                NOT NULL,
0008=  C_WORDSORT   VARCHAR(3)                 NOT NULL,
0009=  C_WORDFORM   VARCHAR(3)                 NOT NULL,
0010=  C_USEFLAG    VARCHAR(1)                 DEFAULT '1'                   NOT NULL,
0011=  C_REGDATE    VARCHAR(14)                NOT NULL,
0012=  C_MEMO       VARCHAR(200),
0013=  PRIMARY KEY (C_ESEQ, C_HSEQ)
0017=)

[FIREBIRD-T_STWORD - 005]
sql_desc='�ѱ� ���̺�'
sql_param_cnt=0
0001=CREATE TABLE T_STWORD
0002=(
0003=  C_TSEQ         VARCHAR(10)              NOT NULL,
0004=  C_ESEQ         VARCHAR(5),
0005=  C_THGNM        VARCHAR(100)             NOT NULL,
0006=  C_THENM        VARCHAR(50)              NOT NULL,
0007=  C_TDOMAINFLAG  VARCHAR(1)               DEFAULT '1'                   NOT NULL,
0008=  PRIMARY KEY (C_TSEQ)
0009=)