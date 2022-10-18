[SQLITE-TABLE_EXISTS-000]
sql_desc='sqlite db table ���� ���� �ľ�'
sql_param_cnt=1
0001=select count(1) c_exists_cnt
0002=  from sqlite_master
0003= where name = lower(:table_name)

[SQLITE - T_COMMON - 001]
sql_desc='���� �ڵ�'
sql_param_cnt=0
0001=create table t_comn_cd
0002=(
0003=   c_flg_key            varchar(3) not null,
0004=   c_flg_cd             varchar(3) not null,
0005=   c_flg_nm1            varchar(50) not null,
0006=   c_flg_nm2            varchar(100),
0007=   primary key (c_flg_key, c_flg_cd)
0008=)

[SQLITE - T_DATA_TYPE - 002]
sql_desc='������ Ÿ��'
sql_param_cnt=0
0001=create table t_data_type
0002=(
0003=   c_data_type_seq      int not null default 1,
0004=   c_dbms_type_cd       varchar(2) not null,
0005=   c_domain_yn          varchar(1) not null default 'N',
0006=   c_domain_nm          varchar(30),
0007=   c_domain_memo        varchar(500),
0008=   c_data_type_cd       varchar(3) not null,
0009=   c_data_len           int,
0010=   c_precision_len      int,
0011=   c_save_memo          varchar(100),
0012=   c_display_memo       varchar(100),
0013=   c_unit               varchar(100),
0014=   c_allowble_value     varchar(200),
0015=   c_reg_dt             datetime not null,
0016=   primary key (c_data_type_seq)
0017=)

[SQLITE - T_DATA_TYPE - 003]
sql_desc='���� �ܾ�'
sql_param_cnt=0
0001=create table t_eng_word
0002=(
0003=   c_eng_word_seq       int not null default 1,
0004=   c_eng_nm             varchar(100) not null,
0005=   c_eng_abv_nm         varchar(10) not null,
0006=   c_eng_dic_memo       varchar(500),
0007=   primary key (c_eng_word_seq)
0008=)

[SQLITE - T_HAN_WORD - 004]
sql_desc='�ѱ� �ܾ�'
sql_param_cnt=0
0001=create table t_han_word
0002=(
0003=   c_han_word_seq       int not null default 1,
0004=   c_han_nm             varchar(50) not null,
0005=   c_eng_word_seq       int not null default 1,
0006=   c_word_sort_cd       varchar(1) not null,
0007=   c_word_type_cd       varchar(1) not null,
0008=   c_appr_yn            varchar(1) not null default 'Y',
0009=   c_kor_dic_memo       varchar(500),
0010=   c_work_memo          varchar(500),
0011=   c_reg_user_id        varchar(20) not null,
0012=   c_appr_user_id       varchar(20) not null,
0013=   c_etc                varchar(1000),
0014=   c_reg_dt             datetime not null,
0015=   primary key (c_han_word_seq)
0016=)

[SQLITE - T_STD_DIC - 005]
sql_desc='ǥ�� ���'
sql_param_cnt=0
0001=create table t_std_dic
0002=(
0003=   c_dic_seq            int not null default 1,
0004=   c_dic_eng_nm         varchar(100) not null,
0005=   c_dic_han_nm         varchar(100) not null,
0006=   c_dic_memo           varchar(500),
0007=   c_reg_dt             datetime not null,
0008=   primary key (c_dic_seq)
0009=)

[SQLITE - T_USER - 006]
sql_desc='�����'
sql_param_cnt=0
0001=create table t_user
0002=(
0003=   c_user_id            varchar(20) not null,
0004=   c_user_nm            varchar(20) not null,
0005=   c_user_pwd           varchar(30) not null,
0006=   c_user_auth_cd       varchar(1) not null default '1',
0007=   c_user_stat_cd       varchar(1) not null default '1',
0008=   c_reg_dt             datetime not null,
0009=   primary key (c_user_id)
0010=)


[SQLITE - T_USE_WORD_DETAIL - 007]
sql_desc='��� �ܾ� ����'
sql_param_cnt=0
0001=create table t_use_word_detail
0002=(
0003=   c_use_seq            int not null default 1,
0004=   c_mapping_seq        int not null default 1,
0005=   c_dic_seq            int not null default 1,
0006=   c_data_type_seq      int default 1,
0007=   c_reg_dt             datetime not null,
0008=   primary key (c_use_seq)
0009=)

[SQLITE - T_WORD_CATE - 008]
sql_desc='�ܾ� �з�'
sql_param_cnt=0
0001=create table t_word_cate
0002=(
0003=   c_cate_seq           int not null default 1,
0004=   c_cate_nm            varchar(20) not null,
0005=   primary key (c_cate_seq)
0006=)

[SQLITE - T_WORD_CATE_MAPPING - 009]
sql_desc='�ܾ� �з� ����'
sql_param_cnt=0
0001=create table t_word_cate_mapping
0002=(
0003=   c_mapping_seq        int not null default 1,
0004=   c_cate_seq           int not null default 1,
0005=   c_eng_word_seq       int not null default 1,
0006=   c_reg_dt             datetime not null,
0007=   primary key (c_mapping_seq)
0008=)

[T_COMMON - 010]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '01', 'ORACLE', NULL)

[T_COMMON - 011]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '02', 'MSSQL', NULL)

[T_COMMON - 012]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '03', 'MYSQL', NULL)

[T_COMMON - 013]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '04', 'MARIADB', NULL)

[T_COMMON - 014]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '05', 'POSTGRESQL', NULL)

[T_COMMON - 015]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '06', 'FIREBIRD', NULL)

[T_COMMON - 016]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '07', 'SQLITE', NULL)

[T_COMMON - 017]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '001', 'VARCHAR', NULL)

[T_COMMON - 018]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '002', 'VARCHAR2', NULL)

[T_COMMON - 019]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '003', 'NVARCHAR', NULL)

[T_COMMON - 020]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '004', 'NVARCHAR2', NULL)

[T_COMMON - 021]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '005', 'CHAR', NULL)

[T_COMMON - 022]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '006', 'NCHAR', NULL)

[T_COMMON - 023]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '007', 'DATE', NULL)

[T_COMMON - 024]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '008', 'TIME', NULL)


[T_COMMON - 025]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '009', 'DATETIME', NULL)

[T_COMMON - 026]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '010', 'TIMESTAMP', NULL)

[T_COMMON - 027]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '011', 'CLOB', NULL)

[T_COMMON - 028]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '012', 'TEXT', NULL)

[T_COMMON - 029]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '013', 'BLOB', NULL)

[T_COMMON - 030]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '014', 'INTEGER', NULL)

[T_COMMON - 031]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '015', 'INT', NULL)

[T_COMMON - 032]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '016', 'NUMBER', NULL)

[T_COMMON - 033]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '017', 'NUMERIC', NULL)

[T_COMMON - 034]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W03', 'Y', '������', NULL)

[T_COMMON - 035]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W03', 'N', '������ �ƴ�', NULL)

[T_COMMON - 036]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W04', '1', 'ǥ�� �ܾ�', NULL)

[T_COMMON - 037]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W04', '2', '�������Ǿ�', NULL)

[T_COMMON - 038]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W04', '3', '��Ģ��', NULL)

[T_COMMON - 039]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W05', '1', '���Ͼ�', NULL)

[T_COMMON - 040]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W05', '2', '�ռ���', NULL)

[T_COMMON - 041]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W05', '3', '���ξ�', NULL)

[T_COMMON - 042]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W05', '4', '���̾�', NULL)

[T_COMMON - 043]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W06', 'Y', '����', NULL)

[T_COMMON - 044]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W06', 'N', '�̽���', NULL)

[T_COMMON - 045]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W07', '1', '�Ϲ�', NULL)

[T_COMMON - 046]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W07', '9', '������', NULL)

[T_COMMON - 047]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W08', 'Y', '���', NULL)

[T_COMMON - 048]
sql_desc='�����ڵ� INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W08', 'N', '�̻��', NULL)

[SQLITE - LOGIN - 049]
sql_desc='����� �α���'
sql_param_cnt=0
0001=select c_user_id
0002=     , c_user_auth_cd
0003=  from t_user
0004= where c_user_stat_cd = '1'
0005=   and c_user_pwd = :c_user_pwd



--=======================================================================================
--=======================================================================================
--=======================================================================================
--=======================================================================================
--=======================================================================================
--=======================================================================================
--=======================================================================================


insert into t_user (c_user_id, c_user_nm, c_user_pwd, c_user_auth_cd, c_user_stat_cd, c_reg_dt) values ('bhlee', '�̺���', '003', 'A', '1', datetime('now'));

insert into t_word_cate(C_CATE_SEQ, C_CATE_NM) values(1, '�����������������');

select to_number(c_eseq) C_ENG_WORD_SEQ
     , c_efword C_ENG_NM
     , c_esword C_ENG_ABV_NM
     , null C_ENG_DIC_MEMO
  from BTUIWORDIC.T_EWORD
  order by c_eseq
;


Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (1, 'common', 'cmn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (2, 'code', 'cd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (3, 'information', 'info');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (4, 'key', 'key');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (5, 'parent', 'p');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (6, 'name', 'nm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (7, 'use', 'use');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (8, 'flag', 'flg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (9, 'description', 'desc');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (10, 'group', 'grp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (11, 'sequence', 'seq');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (12, 'full', 'full');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (13, 'path', 'path');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (14, 'level', 'lvl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (15, 'sort', 'sort');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (16, 'order', 'order');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (17, 'reg', 'reg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (18, 'datetime', 'dt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (19, 'modify', 'mdfy');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (20, 'menu', 'menu');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (21, 'program', 'prgm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (22, 'uniform/universal resource locator', 'url');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (23, 'mapping', 'mapping');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (24, 'site', 'site');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (25, 'member', 'mbr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (26, 'identifier', 'id');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (27, 'password', 'pwd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (28, 'previous', 'pre');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (29, 'approval', 'aprvl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (30, 'status', 'status');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (31, 'e-mail', 'email');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (32, 'address', 'addr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (33, 'handphone', 'hp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (34, 'number', 'no');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (35, 'board', 'brd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (36, 'type', 'type');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (37, 'post', 'post');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (38, 'count', 'cnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (39, 'title', 'title');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (40, 'view', 'view');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (41, 'download', 'dwnld');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (42, 'contents', 'cntnts');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (43, 'html', 'html');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (44, 'include', 'include');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (45, 'exclude', 'exclude');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (46, 'comment', 'cmnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (47, 'attach', 'atch');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (48, 'file', 'file');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (49, 'option', 'opt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (50, 'top', 'top');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (51, 'notice', 'notice');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (52, 'popup', 'popup');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (53, 'start datetime', 'sdt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (54, 'end datetime', 'edt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (55, 'save', 'save');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (56, 'original', 'org');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (57, 'authority', 'auth');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (58, 'manage', 'mng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (59, 'detail', 'dtl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (60, 'general', 'gnrl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (61, 'faq', 'faq');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (62, 'category', 'ctgry');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (63, 'question and answer', 'qna');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (64, 'terms', 'terms');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (65, 'public', 'public');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (66, 'private', 'private');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (67, 'meta', 'meta');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (68, 'element', 'elmnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (69, 'summary', 'smry');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (70, 'short', 'short');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (71, 'XML', 'XML');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (72, 'tag', 'tag');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (73, 'mangement', 'mgt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (74, 'version', 'ver');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (75, 'etc', 'etc');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (76, 'attribute', 'attr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (77, 'list', 'list');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (78, 'composite', 'cmpst');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (79, 'mandatory', 'mdtry');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (80, 'repeat', 'repeat');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (81, 'sample', 'sample');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (82, 'subject', 'sbjt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (83, 'catalog', 'ctlg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (84, 'item', 'item');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (85, 'multilanguage', 'mtlang');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (86, 'language', 'lang');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (87, 'header', 'header');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (88, 'message', 'msg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (89, 'sender', 'sndr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (90, 'value', 'val');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (91, 'send', 'send');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (92, 'note', 'note');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (93, 'default', 'deflt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (94, 'text', 'txt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (95, 'price', 'price');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (96, 'currency', 'crncy');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (97, 'a contact person', 'cntctp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (98, 'base', 'base');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (99, 'onix', 'onix');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (100, 'product', 'prodt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (101, 'record', 'rec');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (102, 'reference', 'ref');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (103, 'notification', 'noti');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (104, 'delete', 'del');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (105, 'reason', 'reason');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (106, 'source', 'source');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (107, 'barcode', 'barcode');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (108, 'position', 'pstn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (109, 'form', 'form');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (110, 'feature', 'ftre');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (111, 'packaging', 'pkg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (112, 'trade', 'trade');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (113, 'primary contents', 'pmrycnts');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (114, 'product contents', 'prodcnts');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (115, 'measure', 'msure');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (116, 'unit', 'unit');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (117, 'manufacture', 'mnfctur');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (118, 'country', 'cntry');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (119, 'epub', 'epub');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (120, 'technical', 'tech');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (121, 'protection', 'prtct');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (122, 'constraint', 'cnstrnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (123, 'limit', 'limit');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (124, 'useage Quantity', 'useqnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (125, 'license', 'license');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (126, 'expression', 'exprsn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (127, 'link', 'link');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (128, 'map', 'map');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (129, 'scale', 'scale');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (130, 'percent', 'prcnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (131, 'supply', 'supply');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (132, 'publisher', 'pblshr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (133, 'brand', 'brand');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (134, 'zipcode', 'zipcode');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (135, 'representation', 'reprsnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (136, 'telephone', 'tel');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (137, 'corporate', 'corp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (138, 'certificate of completion of report', 'cert');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (139, 'security', 'secur');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (140, 'distributor', 'dstrbt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (141, 'ISNI', 'ISNI');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (142, 'part', 'part');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (143, 'multiple', 'multi');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (144, 'print count', 'prntcnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (145, 'collection', 'clect');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (146, 'collation', 'cltn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (147, 'script', 'script');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (148, 'case', 'case');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (149, 'Year Of Annual', 'yearanl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (150, 'prefix', 'prefix');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (151, 'sub', 'sub');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (152, 'statement', 'stmt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (153, 'contributor', 'cntrbtr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (154, 'role', 'role');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (155, 'translate', 'trnslt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (156, 'target', 'target');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (157, 'primary name', 'prmnm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (158, 'alternative', 'altrnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (159, 'person', 'prsn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (160, 'alphabet', 'alphbt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (161, 'reverse', 'rverse');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (162, 'before', 'before');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (163, 'after', 'after');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (164, 'suffix', 'suffix');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (165, 'qualifications and honors after names', 'qaham');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (166, 'gender', 'gender');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (167, 'unnamed', 'unm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (168, 'format', 'format');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (169, 'cardinality', 'crdnlt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (170, 'length', 'length');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (171, 'data', 'data');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (172, 'professional', 'prfsnl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (173, 'affiliation', 'afltn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (174, 'prize', 'prize');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (175, 'year', 'year');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (176, 'jury', 'jury');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (177, 'biographical', 'biogrphl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (178, 'web', 'web');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (179, 'place', 'place');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (180, 'relator', 'relator');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (181, 'region', 'region');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (182, 'location', 'loctn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (183, 'thesis', 'thesis');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (184, 'presented', 'prsntd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (185, 'organization', 'orgn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (186, 'event', 'event');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (187, 'acronym', 'acronym');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (188, 'theme', 'theme');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (189, 'sponsor', 'spon');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (190, 'conference', 'confrnc');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (191, 'edition', 'editon');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (192, 'religious', 'relgus');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (193, 'normal', 'normal');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (194, 'bible', 'bible');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (195, 'purpose', 'prps');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (196, 'support', 'suprt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (197, 'extents', 'ext');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (198, 'other contents', 'ocntnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (199, 'roman', 'roman');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (200, 'Illustration', 'ilust');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (201, 'ancillary', 'anclry');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (202, 'main', 'main');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (203, 'scheme', 'scheme');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (204, 'heading', 'heading');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (205, 'audience', 'audinc');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (206, 'audience range', 'adrange');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (207, 'qualifier', 'qulfr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (208, 'precision', 'precsn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (209, 'complexity', 'cmplxty');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (210, 'marketing', 'mrktng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (211, 'collateral', 'cltrl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (212, 'operating', 'oprtng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (213, 'individual', 'indvdl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (214, 'territory', 'trtry');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (215, 'rating', 'rtng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (216, 'review', 'review');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (217, 'author', 'author');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (218, 'cited', 'cited');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (219, 'resource', 'resource');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (220, 'mode', 'mode');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (221, 'Addressee', 'addrs');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (222, 'first', 'first');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (223, 'page', 'page');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (224, 'run', 'run');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (225, 'last', 'last');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (226, 'av', 'av');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (227, 'start', 'start');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (228, 'time', 'tm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (229, 'end', 'end');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (230, 'duration', 'durtn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (231, 'component', 'cmpnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (232, 'imprint', 'imprint');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (233, 'publish', 'pblsh');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (234, 'funding', 'funding');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (235, 'city', 'city');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (236, 'latest reprint', 'lreprnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (237, 'copylight', 'cplight');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (238, 'owner', 'owner');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (239, 'sales rights', 'srights');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (240, 'sale', 'sale');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (241, 'restriction', 'restrtn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (242, 'sale outlet', 'soutlet');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (243, 'related', 'related');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (244, 'work', 'work');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (245, 'market', 'mrkt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (246, 'agent', 'agent');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (247, 'fax', 'fax');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (248, 'promotion', 'prmtn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (249, 'campaign', 'cmpgn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (250, 'initial', 'init');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (251, 'print', 'print');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (252, 'reprint', 'reprint');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (253, 'book', 'book');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (254, 'club', 'club');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (255, 'adoption', 'adptn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (256, 'supplier', 'supplier');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (257, 'receive', 'recv');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (258, 'returns', 'rtns');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (259, 'stock', 'stock');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (260, 'Quantity', 'qnty');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (261, 'discount', 'dc');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (262, 'own', 'own');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (263, 'availability', 'avlbty');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (264, 'average', 'avg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (265, 'day', 'day');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (266, 'new', 'new');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (267, 'onhand', 'onhand');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (268, 'proximity', 'prxmty');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (269, 'reserved', 'resrvd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (270, 'committed', 'comtd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (271, 'backorder', 'bckorder');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (272, 'shipment', 'shpmnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (273, 'expected', 'expctd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (274, 'depletion', 'dpltn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (275, 'rate', 'rate');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (276, 'ratio', 'ratio');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (277, 'pack', 'pack');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (278, 'pallet', 'pallet');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (279, 'minimum', 'min');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (280, 'unprice', 'unprice');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (281, 'amount', 'amt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (282, 'condition', 'cndtn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (283, 'max', 'max');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (284, 'tax', 'tax');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (285, 'tax amount', 'taxamt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (286, 'taxable amount', 'taxblamt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (287, 'batch', 'batch');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (288, 'free', 'free');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (289, 'issue', 'issue');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (290, 'revision', 'revsn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (291, 'english', 'eng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (292, 'korea', 'kor');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (293, 'update', 'update');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (294, 'block', 'block');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (295, 'change', 'chng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (296, 'rule', 'rule');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (297, 'global', 'global');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (298, 'set', 'set');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (299, 'latitude', 'lat');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (300, 'longitude', 'long');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (301, 'employee', 'emp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (302, 'agree', 'agree');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (303, 'history', 'hstry');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (304, 'quality', 'qa');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (305, 'point', 'point');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (306, 'admin', 'admin');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (307, 'customer', 'custm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (308, 'service', 'srvc');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (309, 'center', 'center');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (310, 'hosting', 'hstng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (311, 'selection', 'select');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (312, 'product composition', 'prdcmpt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (313, 'product form', 'prdform');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (314, 'product identifier', 'prdid');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (315, 'record reference', 'recref');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (316, 'notification type', 'notitype');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (317, 'book title', 'titletxt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (318, 'International Standard Book Number', 'isbn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (319, 'edition type', 'edtype');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (320, 'edition number', 'ednum');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (321, 'edition version', 'edver');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (322, 'edition statement', 'edstmt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (323, 'keyword', 'keyword');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (324, 'price amount', 'priceamt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (325, 'currency code', 'crnycd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (326, 'price qualifier', 'qprice');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (327, 'book publishing date', 'publdt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (328, 'content audience', 'cntaud');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (329, 'introduction', 'intro');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (330, 'Biographical Note', 'bionote');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (331, 'paper book', 'pbk');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (332, 'usage', 'usage');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (333, 'serise', 'serise');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (334, 'CollectionType', 'colltype');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (335, 'promotion material', 'prmt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (336, 'catalogue', 'ctlogue');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (337, 'image', 'img');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (338, 'use set-up', 'useset');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (339, 'logo', 'logo');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (340, 'upload', 'upload');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (341, 'processing', 'process');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (342, 'temp', 'tmp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (343, 'result', 'result');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (344, 'session', 'sess');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (345, 'error', 'error');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (346, 'part number', 'partnum');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (347, 'text content', 'txtcntnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (348, 'contents audience', 'cntaudi');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (349, 'table', 'tbl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (350, 'birth', 'birth');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (351, 'death', 'death');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (352, 'literary career', 'career');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (353, 'editor', 'editor');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (354, 'form feature', 'formft');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (355, 'yn', 'yn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (356, 'fix', 'fix');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (357, 'grade', 'grade');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (358, 'news item', 'nsitm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (359, 'mail', 'mail');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (360, 'template', 'tplt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (361, 'request', 'req');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (362, 'application', 'aplctn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (363, 'api', 'api');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (364, 'seoji', 'seoji');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (365, 'btui', 'btui');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (366, 'complete', 'cmplt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (367, 'xml', 'xml');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (368, 'json', 'json');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (369, 'channel', 'chnl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (370, 'grant', 'grant');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (371, 'kpipa', 'kpipa');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (373, 'disuse', 'disuse');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (374, 'inflow', 'inflow');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (375, 'propertis', 'proprt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (376, 'user define', 'usrdfn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (377, 'synchronize', 'sync');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (378, 'Personal Information', 'psif');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (379, 'login', 'login');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (380, 'log', 'log');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (381, 'ip', 'ip');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (382, 'browser', 'bwr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (383, 'success', 'succ');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (384, 'create', 'creat');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (385, 'creater', 'creatr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (386, 'display', 'dspy');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (387, 'target customer', 'tgcust');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (388, 'price change', 'prchng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (389, 'rental', 'rent');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (390, 'valid', 'valid');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (391, 'commission', 'cmsn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (392, 'date format', 'df');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (393, 'stop publishing', 'stpubl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (394, 'width', 'width');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (395, 'height', 'hght');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (396, 'thickness', 'thcns');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (397, 'weight', 'wght');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (398, 'digital rights management', 'drm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (399, 'apply', 'aply');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (400, 'electronic book', 'ebk');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (401, 'preview', 'prvw');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (402, 'size', 'sz');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (403, 'accessibility', 'acsbty');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (404, 'play', 'play');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (405, 'audio book', 'adbk');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (406, 'chapter', 'chtr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (407, 'KC Certification Mark', 'kcmk');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (408, 'age range', 'arng');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (409, 'extension', 'extn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (410, 'pixel', 'pixel');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (411, 'additional', 'adtnl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (412, 'master', 'mastr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (413, 'queue', 'queue');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (414, 'dml', 'dml');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (415, 'library', 'lib');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (416, 'write', 'wrt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (417, 'decoration', 'deco');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (418, 'Member company', 'mbrcpny');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (419, 'send and receive', 'snrv');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (420, 'directory', 'dir');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (421, 'sftp', 'sftp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (422, 'open', 'open');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (423, 'store', 'store');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (424, 'statistics', 'stats');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (425, 'withdrawal', 'wtdrwl');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (426, 'trigger', 'trg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (427, 'embargo', 'embg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (428, 'inout', 'inout');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (429, 'outbound', 'outbound');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (430, 'logistics', 'logistics');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (431, 'line', 'line');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (432, 'total', 'total');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (434, 'instr', 'instr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (435, 'edi', 'edi');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (436, 'orderpia', 'orderpia');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (437, 'copy & right', 'cpnrght');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (438, 'policy', 'policy');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (439, 'interception', 'intrcp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (440, 'mean', 'mn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (441, 'otp', 'otp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (442, 'fail', 'fail');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (443, 'button', 'btn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (444, 'user interface', 'ui');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (445, 'standard', 'stnd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (446, 'table of contents', 'tcntnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (447, 'cover', 'cover');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (448, 'single sign on', 'sso');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (449, 'unity', 'unity');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (450, 'column', 'col');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (451, 'join', 'join');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (452, 'confirm', 'cnfrm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (453, 'function', 'func');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (454, 'icon', 'icon');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (455, 'occurrence', 'ocrn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (456, 'expire', 'expire');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (457, 'retrans', 'retrans');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (458, 'partition', 'prtn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (459, 'video', 'video');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (460, 'voice', 'voide');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (461, 'bar', 'bar');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (462, 'pin', 'pin');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (463, 'announcement', 'ancm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (464, 'booktokens', 'bktn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (465, 'enquiry', 'enqry');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (466, 'expectation', 'expct');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (467, 'bookapply', 'bkaply');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (468, 'occur', 'occur');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (469, 'remark', 'remark');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (470, 'address book', 'addrbk');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (471, 'responsibilities of office', 'respn');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (472, 'receving order', 'rcvord');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (473, 'Enterprise Resource Planning', 'erp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (474, 'access', 'acs');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (475, 'parameter', 'param');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (476, 'dormant', 'drmnt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (477, 'provid', 'prvd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (478, 'offline', 'offln');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (479, 'deny', 'deny');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (480, 'reject', 'rejt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (481, 'Cataloging In Publication', 'cip');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (482, 'user', 'usr');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (483, 'exists', 'exists');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (484, 'online', 'online');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (485, 'trend', 'trend');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (486, 'month', 'month');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (487, 'homepage', 'hmpg');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (488, 'rest day', 'restde');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (489, 'day of the week', 'dweek');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (490, 'old', 'old');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (491, 'covid', 'covid');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (492, 'confirmed case', 'confmd');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (493, 'accumulate', 'acmlt');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (494, 'supply agency', 'splyagcy');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (495, 'sector', 'sector');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (496, 'number of copies', 'nmbcp');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (497, 'number of volumne', 'nmbvlm');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (498, 'mark', 'mark');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (499, 'delivery number', 'dlvynmb');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (500, 'field', 'field');
Insert into T_ENG_WORD
   (C_ENG_WORD_SEQ, C_ENG_NM, C_ENG_ABV_NM)
 Values
   (501, 'transfer', 'trnsf');
COMMIT;


select row_number() over(order by to_number(c_eseq)) C_MAPPING_SEQ
     , 1 C_CATE_SEQ
     , to_number(c_eseq) C_ENG_WORD_SEQ
     , datetime('now') C_REG_DT
  from BTUIWORDIC.T_EWORD
  order by c_eseq
;

Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (1, 1, 1, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (2, 1, 2, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (3, 1, 3, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (4, 1, 4, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (5, 1, 5, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (6, 1, 6, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (7, 1, 7, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (8, 1, 8, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (9, 1, 9, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (10, 1, 10, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (11, 1, 11, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (12, 1, 12, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (13, 1, 13, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (14, 1, 14, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (15, 1, 15, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (16, 1, 16, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (17, 1, 17, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (18, 1, 18, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (19, 1, 19, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (20, 1, 20, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (21, 1, 21, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (22, 1, 22, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (23, 1, 23, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (24, 1, 24, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (25, 1, 25, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (26, 1, 26, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (27, 1, 27, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (28, 1, 28, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (29, 1, 29, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (30, 1, 30, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (31, 1, 31, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (32, 1, 32, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (33, 1, 33, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (34, 1, 34, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (35, 1, 35, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (36, 1, 36, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (37, 1, 37, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (38, 1, 38, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (39, 1, 39, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (40, 1, 40, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (41, 1, 41, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (42, 1, 42, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (43, 1, 43, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (44, 1, 44, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (45, 1, 45, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (46, 1, 46, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (47, 1, 47, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (48, 1, 48, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (49, 1, 49, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (50, 1, 50, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (51, 1, 51, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (52, 1, 52, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (53, 1, 53, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (54, 1, 54, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (55, 1, 55, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (56, 1, 56, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (57, 1, 57, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (58, 1, 58, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (59, 1, 59, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (60, 1, 60, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (61, 1, 61, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (62, 1, 62, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (63, 1, 63, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (64, 1, 64, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (65, 1, 65, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (66, 1, 66, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (67, 1, 67, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (68, 1, 68, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (69, 1, 69, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (70, 1, 70, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (71, 1, 71, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (72, 1, 72, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (73, 1, 73, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (74, 1, 74, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (75, 1, 75, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (76, 1, 76, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (77, 1, 77, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (78, 1, 78, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (79, 1, 79, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (80, 1, 80, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (81, 1, 81, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (82, 1, 82, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (83, 1, 83, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (84, 1, 84, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (85, 1, 85, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (86, 1, 86, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (87, 1, 87, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (88, 1, 88, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (89, 1, 89, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (90, 1, 90, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (91, 1, 91, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (92, 1, 92, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (93, 1, 93, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (94, 1, 94, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (95, 1, 95, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (96, 1, 96, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (97, 1, 97, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (98, 1, 98, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (99, 1, 99, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (100, 1, 100, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (101, 1, 101, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (102, 1, 102, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (103, 1, 103, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (104, 1, 104, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (105, 1, 105, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (106, 1, 106, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (107, 1, 107, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (108, 1, 108, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (109, 1, 109, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (110, 1, 110, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (111, 1, 111, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (112, 1, 112, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (113, 1, 113, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (114, 1, 114, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (115, 1, 115, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (116, 1, 116, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (117, 1, 117, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (118, 1, 118, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (119, 1, 119, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (120, 1, 120, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (121, 1, 121, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (122, 1, 122, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (123, 1, 123, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (124, 1, 124, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (125, 1, 125, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (126, 1, 126, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (127, 1, 127, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (128, 1, 128, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (129, 1, 129, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (130, 1, 130, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (131, 1, 131, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (132, 1, 132, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (133, 1, 133, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (134, 1, 134, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (135, 1, 135, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (136, 1, 136, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (137, 1, 137, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (138, 1, 138, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (139, 1, 139, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (140, 1, 140, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (141, 1, 141, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (142, 1, 142, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (143, 1, 143, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (144, 1, 144, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (145, 1, 145, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (146, 1, 146, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (147, 1, 147, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (148, 1, 148, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (149, 1, 149, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (150, 1, 150, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (151, 1, 151, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (152, 1, 152, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (153, 1, 153, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (154, 1, 154, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (155, 1, 155, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (156, 1, 156, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (157, 1, 157, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (158, 1, 158, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (159, 1, 159, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (160, 1, 160, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (161, 1, 161, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (162, 1, 162, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (163, 1, 163, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (164, 1, 164, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (165, 1, 165, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (166, 1, 166, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (167, 1, 167, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (168, 1, 168, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (169, 1, 169, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (170, 1, 170, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (171, 1, 171, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (172, 1, 172, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (173, 1, 173, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (174, 1, 174, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (175, 1, 175, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (176, 1, 176, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (177, 1, 177, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (178, 1, 178, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (179, 1, 179, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (180, 1, 180, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (181, 1, 181, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (182, 1, 182, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (183, 1, 183, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (184, 1, 184, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (185, 1, 185, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (186, 1, 186, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (187, 1, 187, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (188, 1, 188, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (189, 1, 189, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (190, 1, 190, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (191, 1, 191, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (192, 1, 192, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (193, 1, 193, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (194, 1, 194, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (195, 1, 195, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (196, 1, 196, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (197, 1, 197, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (198, 1, 198, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (199, 1, 199, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (200, 1, 200, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (201, 1, 201, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (202, 1, 202, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (203, 1, 203, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (204, 1, 204, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (205, 1, 205, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (206, 1, 206, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (207, 1, 207, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (208, 1, 208, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (209, 1, 209, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (210, 1, 210, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (211, 1, 211, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (212, 1, 212, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (213, 1, 213, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (214, 1, 214, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (215, 1, 215, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (216, 1, 216, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (217, 1, 217, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (218, 1, 218, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (219, 1, 219, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (220, 1, 220, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (221, 1, 221, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (222, 1, 222, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (223, 1, 223, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (224, 1, 224, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (225, 1, 225, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (226, 1, 226, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (227, 1, 227, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (228, 1, 228, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (229, 1, 229, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (230, 1, 230, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (231, 1, 231, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (232, 1, 232, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (233, 1, 233, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (234, 1, 234, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (235, 1, 235, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (236, 1, 236, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (237, 1, 237, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (238, 1, 238, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (239, 1, 239, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (240, 1, 240, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (241, 1, 241, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (242, 1, 242, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (243, 1, 243, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (244, 1, 244, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (245, 1, 245, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (246, 1, 246, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (247, 1, 247, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (248, 1, 248, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (249, 1, 249, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (250, 1, 250, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (251, 1, 251, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (252, 1, 252, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (253, 1, 253, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (254, 1, 254, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (255, 1, 255, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (256, 1, 256, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (257, 1, 257, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (258, 1, 258, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (259, 1, 259, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (260, 1, 260, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (261, 1, 261, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (262, 1, 262, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (263, 1, 263, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (264, 1, 264, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (265, 1, 265, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (266, 1, 266, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (267, 1, 267, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (268, 1, 268, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (269, 1, 269, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (270, 1, 270, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (271, 1, 271, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (272, 1, 272, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (273, 1, 273, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (274, 1, 274, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (275, 1, 275, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (276, 1, 276, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (277, 1, 277, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (278, 1, 278, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (279, 1, 279, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (280, 1, 280, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (281, 1, 281, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (282, 1, 282, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (283, 1, 283, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (284, 1, 284, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (285, 1, 285, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (286, 1, 286, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (287, 1, 287, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (288, 1, 288, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (289, 1, 289, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (290, 1, 290, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (291, 1, 291, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (292, 1, 292, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (293, 1, 293, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (294, 1, 294, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (295, 1, 295, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (296, 1, 296, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (297, 1, 297, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (298, 1, 298, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (299, 1, 299, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (300, 1, 300, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (301, 1, 301, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (302, 1, 302, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (303, 1, 303, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (304, 1, 304, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (305, 1, 305, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (306, 1, 306, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (307, 1, 307, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (308, 1, 308, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (309, 1, 309, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (310, 1, 310, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (311, 1, 311, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (312, 1, 312, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (313, 1, 313, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (314, 1, 314, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (315, 1, 315, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (316, 1, 316, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (317, 1, 317, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (318, 1, 318, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (319, 1, 319, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (320, 1, 320, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (321, 1, 321, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (322, 1, 322, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (323, 1, 323, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (324, 1, 324, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (325, 1, 325, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (326, 1, 326, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (327, 1, 327, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (328, 1, 328, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (329, 1, 329, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (330, 1, 330, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (331, 1, 331, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (332, 1, 332, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (333, 1, 333, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (334, 1, 334, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (335, 1, 335, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (336, 1, 336, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (337, 1, 337, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (338, 1, 338, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (339, 1, 339, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (340, 1, 340, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (341, 1, 341, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (342, 1, 342, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (343, 1, 343, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (344, 1, 344, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (345, 1, 345, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (346, 1, 346, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (347, 1, 347, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (348, 1, 348, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (349, 1, 349, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (350, 1, 350, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (351, 1, 351, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (352, 1, 352, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (353, 1, 353, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (354, 1, 354, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (355, 1, 355, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (356, 1, 356, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (357, 1, 357, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (358, 1, 358, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (359, 1, 359, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (360, 1, 360, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (361, 1, 361, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (362, 1, 362, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (363, 1, 363, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (364, 1, 364, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (365, 1, 365, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (366, 1, 366, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (367, 1, 367, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (368, 1, 368, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (369, 1, 369, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (370, 1, 370, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (371, 1, 371, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (372, 1, 373, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (373, 1, 374, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (374, 1, 375, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (375, 1, 376, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (376, 1, 377, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (377, 1, 378, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (378, 1, 379, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (379, 1, 380, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (380, 1, 381, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (381, 1, 382, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (382, 1, 383, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (383, 1, 384, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (384, 1, 385, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (385, 1, 386, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (386, 1, 387, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (387, 1, 388, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (388, 1, 389, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (389, 1, 390, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (390, 1, 391, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (391, 1, 392, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (392, 1, 393, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (393, 1, 394, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (394, 1, 395, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (395, 1, 396, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (396, 1, 397, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (397, 1, 398, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (398, 1, 399, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (399, 1, 400, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (400, 1, 401, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (401, 1, 402, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (402, 1, 403, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (403, 1, 404, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (404, 1, 405, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (405, 1, 406, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (406, 1, 407, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (407, 1, 408, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (408, 1, 409, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (409, 1, 410, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (410, 1, 411, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (411, 1, 412, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (412, 1, 413, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (413, 1, 414, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (414, 1, 415, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (415, 1, 416, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (416, 1, 417, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (417, 1, 418, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (418, 1, 419, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (419, 1, 420, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (420, 1, 421, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (421, 1, 422, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (422, 1, 423, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (423, 1, 424, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (424, 1, 425, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (425, 1, 426, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (426, 1, 427, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (427, 1, 428, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (428, 1, 429, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (429, 1, 430, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (430, 1, 431, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (431, 1, 432, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (432, 1, 434, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (433, 1, 435, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (434, 1, 436, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (435, 1, 437, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (436, 1, 438, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (437, 1, 439, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (438, 1, 440, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (439, 1, 441, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (440, 1, 442, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (441, 1, 443, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (442, 1, 444, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (443, 1, 445, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (444, 1, 446, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (445, 1, 447, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (446, 1, 448, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (447, 1, 449, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (448, 1, 450, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (449, 1, 451, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (450, 1, 452, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (451, 1, 453, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (452, 1, 454, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (453, 1, 455, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (454, 1, 456, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (455, 1, 457, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (456, 1, 458, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (457, 1, 459, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (458, 1, 460, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (459, 1, 461, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (460, 1, 462, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (461, 1, 463, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (462, 1, 464, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (463, 1, 465, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (464, 1, 466, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (465, 1, 467, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (466, 1, 468, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (467, 1, 469, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (468, 1, 470, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (469, 1, 471, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (470, 1, 472, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (471, 1, 473, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (472, 1, 474, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (473, 1, 475, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (474, 1, 476, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (475, 1, 477, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (476, 1, 478, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (477, 1, 479, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (478, 1, 480, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (479, 1, 481, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (480, 1, 482, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (481, 1, 483, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (482, 1, 484, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (483, 1, 485, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (484, 1, 486, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (485, 1, 487, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (486, 1, 488, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (487, 1, 489, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (488, 1, 490, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (489, 1, 491, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (490, 1, 492, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (491, 1, 493, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (492, 1, 494, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (493, 1, 495, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (494, 1, 496, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (495, 1, 497, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (496, 1, 498, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (497, 1, 499, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (498, 1, 500, datetime('now'));
Insert into T_WORD_CATE_MAPPING
   (C_MAPPING_SEQ, C_CATE_SEQ, C_ENG_WORD_SEQ, C_REG_DT)
 Values
   (499, 1, 501, datetime('now'));
COMMIT;


select row_number() over(order by to_number(c_eseq), c_wordsort) C_HAN_WORD_SEQ
     , c_hfword C_HAN_NM
     , to_number(c_eseq) C_ENG_WORD_SEQ
     , case when c_wordsort = '000' then 1
            when c_wordsort = '001' then 2
            else 3
        end C_WORD_SORT_CD
     , case when C_WORDFORM = '002' then 1
            when C_WORDFORM = '003' then 2
            when C_WORDFORM = '000' then 3
            when C_WORDFORM = '001' then 4
        end  C_WORD_TYPE_CD
     , 'Y' C_APPR_YN
     , null C_KOR_DIC_MEMO
     , c_memo C_WORK_MEMO
     , 'bhlee' C_REG_USER_ID
     , 'bhlee' C_APPR_USER_ID
     , null C_ETC
     , 'datetime(''now'')' c_reg_dt
  from BTUIWORDIC.T_HWORD


Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (1, '����', 1, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (2, '�ڵ�', 2, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (3, '����', 3, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (4, 'Ű', 4, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (5, '��ǥ', 4, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (6, '����', 5, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (7, '��', 6, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (8, '�̸�', 6, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (9, '���', 7, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (10, '����', 8, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (11, '����', 8, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (12, '����', 9, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (13, '�׷�', 10, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (14, '�Ϸù�ȣ', 11, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (15, '����', 11, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (16, '��ü', 12, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (17, '���', 13, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (18, '����', 14, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (19, '����', 15, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (20, '����', 16, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (21, '�ֹ�', 16, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (22, '�����', 17, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (23, '���', 17, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (24, '�Ͻ�', 18, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (25, '������', 19, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (26, '����', 19, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (27, '�޴�', 20, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (28, '���α׷�', 21, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_WORK_MEMO, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (29, 'url', 22, 1, 1,
    'Y', '���ͳ� ���� ���� �ּ�', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (30, '����', 23, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (31, '����Ʈ', 24, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (32, 'ȸ��', 25, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (33, '���̵�', 26, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (34, '�ĺ���', 26, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (35, '��й�ȣ', 27, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (36, '~��', 28, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (37, '������', 28, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (38, '����', 28, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (39, '����', 29, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (40, '����', 30, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (41, '�̸���', 31, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (42, '�ּ�', 32, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (43, '�ڵ���', 33, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (44, '�޴���', 33, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (45, '��ȣ', 34, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (46, '�Խ���', 35, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (47, '����', 36, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (48, '�Խù�', 37, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (49, '��', 38, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (50, '����', 39, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (51, '��ȸ', 40, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (52, '�ٿ�ε�', 41, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (53, '����', 42, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (54, '������', 42, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (55, '����', 42, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (56, 'HTML', 43, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (57, '����', 44, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (58, '����', 45, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (59, '���', 46, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (60, '÷��', 47, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (61, '����', 48, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (62, '�ɼ�', 49, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (63, '���', 50, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (64, '����', 51, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (65, '�˾�', 52, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (66, '�����Ͻ�', 53, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (67, '�����Ͻ�', 54, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (68, '����', 55, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (69, '����', 56, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (70, '����', 56, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (71, '����', 56, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (72, '��', 56, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (73, '����', 57, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (74, '�ȸ��', 58, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (75, '��', 59, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (76, '����', 59, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (77, '�Ϲ�ȸ��', 60, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (78, 'FAQ', 61, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (79, 'ī�װ�', 62, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (80, 'Q&A', 63, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (81, '���', 64, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (82, '����', 65, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (83, '�����', 66, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (84, '��Ÿ������', 67, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (85, '���', 68, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (86, '���', 69, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (87, '����', 70, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (88, '���', 70, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (89, 'XML', 71, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (90, '�±�', 72, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (91, '����', 73, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (92, '����', 74, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (93, '���', 75, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (94, '��Ÿ', 75, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (95, '�Ӽ�', 76, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (96, '����Ʈ', 77, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (97, '���տ��', 78, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (98, '�ʼ�', 79, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (99, '�ݺ�', 80, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (100, '����', 81, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (101, '����', 82, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (102, '�����з�', 82, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (103, '�з�', 83, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (104, '�׸�', 84, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (105, 'ǰ��', 84, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (106, '�ٱ���', 85, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (107, '���', 86, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (108, '���', 87, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (109, '�޽���', 88, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (110, '�߽���', 89, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (111, '�߼���', 89, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (112, '��', 90, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (113, '�߼�', 91, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (114, '����', 91, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (115, '�߽�', 91, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (116, '��Ʈ', 92, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (117, '�޸�', 92, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (118, '����Ʈ', 93, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (119, '�ؽ�Ʈ', 94, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (120, '����', 95, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (121, '����', 95, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (122, '��ȭ', 96, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (123, '�����', 97, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (124, '�⺻', 98, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (125, '����', 98, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (126, '���н�', 99, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (127, '��ǰ', 100, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (128, '��ǰ', 100, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (129, '���ڵ�', 101, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (130, '����', 102, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (131, '�뺸', 103, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (132, '����', 104, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (133, '����', 105, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (134, '����', 105, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (135, '�ҽ�', 106, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (136, '��ó', 106, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (137, '���ڵ�', 107, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (138, '��ġ', 108, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (139, '����', 108, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (140, '���', 109, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (141, '����', 109, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (142, 'Ư¡', 110, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (143, '����', 111, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (144, '�ŷ�', 112, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (145, '�⺻������', 113, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (146, '��ǰ������', 114, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (147, '����', 115, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (148, '����', 116, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (149, '����', 117, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (150, '����', 118, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (151, 'EPUB', 119, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (152, '���', 120, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (153, '��ȣ', 121, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (154, '����', 122, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (155, '�Ѱ�', 123, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (156, '�ѵ�', 123, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (157, '��뷮', 124, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (158, '���̼���', 125, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (159, 'ǥ����', 126, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (160, '��ũ', 127, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (161, '����', 127, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (162, '����', 128, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (163, 'ô��', 129, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (164, '�ۼ�Ʈ', 130, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (165, '����', 131, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (166, '���ް�', 131, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (167, '���ǻ�', 132, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (168, '������', 132, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (169, '�귣��', 133, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (170, '�����ȣ', 134, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (171, '��ǥ��', 135, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (172, '��ȭ', 136, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (173, '�����', 137, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (174, 'ȸ��', 137, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (175, '�Ű�����', 138, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (176, '����', 138, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (177, '���ȼ��༭', 139, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (178, '�����', 140, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (179, '������', 140, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (180, 'ISNI', 141, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (181, '�κ�', 142, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (182, '����', 143, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (183, '���', 143, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (184, '��ǰ��', 143, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (185, '�μ�ż�', 144, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (186, '����', 145, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (187, '�÷���', 145, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (188, '����', 146, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (189, '��ũ��Ʈ', 147, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (190, '���̽�', 148, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (191, '��������', 149, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (192, '���ξ�', 150, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (193, '��', 151, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (194, '����', 152, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (195, '�����', 153, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (196, '����', 153, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (197, '���ѱ׷�', 154, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (198, '����', 154, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (199, '����', 155, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (200, '������', 155, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (201, '���', 156, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (202, '�⺻�̸�', 157, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (203, '��ü', 158, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (204, '���', 159, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (205, '���ĺ�', 160, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (206, '����', 161, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (207, '��', 162, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (208, '��', 163, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (209, '������', 163, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (210, '���̾�', 164, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (211, '�ڰݹ׸�', 165, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (212, '����', 166, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (213, '�̸�����', 167, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (214, '����', 168, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (215, '���', 169, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (216, '����', 170, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (217, '������', 171, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (218, '������', 172, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (219, '�Ҽ�', 173, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (220, '��', 174, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (221, '����', 174, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (222, '����', 175, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (223, '��ɿ�', 176, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (224, '���', 177, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (225, '��', 178, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (226, '��������ġ', 179, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (227, '����', 180, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (228, '����', 181, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (229, '������ġ', 182, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (230, '��', 183, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (231, '����', 184, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (232, '���', 185, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (233, '����', 185, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (234, '����', 185, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (235, '�̺�Ʈ', 186, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (236, '�Ӹ�����', 187, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (237, '�׸�', 188, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (238, '������', 189, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (239, '���۷���', 190, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (240, '�����', 191, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (241, '����', 192, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (242, '�Ϲ�', 193, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (243, '���̺�', 194, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (244, '����', 195, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (245, '����', 196, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (246, '����', 197, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (247, '��Ÿ������', 198, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (248, '�θ�����', 199, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (249, '��ȭ', 200, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (250, '�μ���', 201, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (251, '�ֿ�', 202, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (252, '����', 202, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (253, '��Ű��', 203, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (254, 'ǥ��', 204, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (255, '����', 205, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (256, '��������', 205, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (257, '������', 206, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (258, '��������', 206, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (259, '����', 207, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (260, '������', 207, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (261, '���е�', 208, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (262, '���⼺', 209, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (263, '������', 210, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (264, '�ڷ�', 211, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (265, '�', 212, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (266, '����', 213, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (267, '����', 214, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (268, '����', 215, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (269, '����', 216, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (270, '����', 216, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (271, '�ۼ���', 217, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (272, '�ο�', 218, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (273, '���ҽ�', 219, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (274, '���', 220, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (275, '������', 221, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (276, 'ù', 222, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (277, '����', 222, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (278, '������', 223, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (279, '����', 224, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (280, '������', 225, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (281, '����', 225, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (282, 'av', 226, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (283, '����', 227, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (284, '�ð�', 228, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (285, '����', 229, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (286, '���ӽð�', 230, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (287, '������Ʈ', 231, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (288, '����ǰ', 231, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (289, '������Ʈ', 232, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (290, '����', 233, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (291, '�ݵ�', 234, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (292, '����', 235, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (293, '�õ�', 235, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (294, '�ֽ������', 236, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (295, '�ֱ�����', 236, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (296, '���۱�', 237, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (297, '������', 238, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (298, '�Ǹű�', 239, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (299, '�Ǹ�', 240, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (300, '����', 241, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (301, '�Ǹſ�', 242, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (302, '����', 243, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (303, '����', 243, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (304, '����', 244, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (305, '�۾�', 244, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (306, '����', 245, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (307, '������Ʈ', 246, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (308, '�ѽ�', 247, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (309, '���θ��', 248, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (310, 'ķ����', 249, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (311, '�ʱ�', 250, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (312, '�μ�', 251, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (313, '���μ�', 252, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (314, '��', 253, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (315, '����', 253, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (316, 'Ŭ��', 254, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (317, '����', 255, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (318, '������', 256, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (319, '���޻�', 256, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (320, '����', 257, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (321, '����', 257, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (322, '��ǰ', 258, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (323, '���', 259, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (324, '����', 260, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (325, '����', 261, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (326, '����', 262, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (327, '���뼺', 263, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (328, '���', 264, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (329, '��', 265, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (330, '����', 265, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (331, '�ű�', 266, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (332, '����', 267, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (333, '����', 268, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (334, '����', 269, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (335, 'Ŀ��', 270, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (336, '�����', 271, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (337, '���', 272, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (338, '����', 273, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (339, '����', 274, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (340, '��', 275, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (341, '����', 276, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (342, '��', 277, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (343, '�ȷ�Ʈ', 278, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (344, '�ּ�', 279, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (345, '���ݾ���', 280, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (346, '�ݾ�', 281, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (347, '��', 281, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (348, '����', 282, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (349, '�ִ�', 283, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (350, '����', 284, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (351, '����', 285, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (352, '�����ݾ�', 286, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (353, '��ġ', 287, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (354, '����', 288, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (355, '�̽�', 289, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (356, '�߱�', 289, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (357, '�԰�', 289, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (358, '����', 290, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (359, '����', 291, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (360, '�ѱ�', 292, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (361, '�ѱ���', 292, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (362, '������Ʈ', 293, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (363, '���', 294, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (364, '��ȭ', 295, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (365, '����', 295, 2, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (366, '��', 296, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (367, '����', 297, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (368, '��Ʈ', 298, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (369, '����', 299, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (370, '�浵', 300, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (371, '����', 301, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (372, '����', 302, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (373, '�̷�', 303, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (374, 'ǰ��', 304, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (375, '����', 305, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (376, '������', 306, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (377, '�ŷ�ó', 307, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (378, '����', 308, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (379, '����', 309, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (380, 'ȣ����', 310, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (381, '����', 311, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (382, '��ǰ����', 312, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (383, '��ǰ����', 313, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (384, '��ǰ�ĺ���', 314, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (385, '������ȣ', 315, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (386, '��������', 316, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (387, '������', 317, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (388, '����ISBN', 318, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (389, '������', 319, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (390, '����', 320, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (391, '�ǹ���', 321, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (392, '�Ǽ���', 322, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (393, 'Ű����', 323, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (394, '��ǰ����', 324, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (395, '���ݴ���', 325, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (396, '����������', 326, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (397, '�����Ⱓ', 327, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (398, '���������', 328, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (399, '�Ұ�', 329, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (400, '���ڼҰ�', 330, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (401, '����å', 331, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (402, '�̿�', 332, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (403, '�ø���', 333, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (404, '�ø������ü', 334, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (405, 'ȫ���ڷ�', 335, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (406, 'īŻ�α�', 336, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (407, '�̹���', 337, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (408, '�뵵����', 338, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (409, '�ΰ�', 339, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (410, '���ε�', 340, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (411, 'ó��', 341, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (412, '�ӽ�', 342, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (413, '���', 343, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (414, '����', 344, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (415, '����', 345, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (416, '��Ʈ��ȣ', 346, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (417, '�󼼳���', 347, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (418, '�������', 348, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (419, '���̺�', 349, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (420, '���', 350, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (421, '���', 351, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (422, '���', 352, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (423, '������', 353, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (424, '���Ư¡', 354, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (425, '��������', 355, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (426, 'Ȯ��', 356, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (427, '���', 357, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (428, '�����ڷ�', 358, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (429, '����', 359, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (430, '���ø�', 360, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (431, '��û', 361, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (432, '��û', 362, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (433, 'api', 363, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (434, '��������', 364, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (435, 'btui', 365, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (436, '�Ϸ�', 366, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (437, 'xml', 367, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (438, 'json', 368, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (439, 'ä��', 369, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (440, '�ο�', 370, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (441, '������', 371, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (442, '���', 373, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (443, '����', 374, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (444, '����', 375, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (445, '���������', 376, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (446, '����ȭ', 377, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (447, '��������', 378, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (448, '�α���', 379, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (449, '�α�', 380, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (450, '������', 381, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (451, '������', 382, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (452, '����', 383, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (453, '����', 384, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (454, '������', 385, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (455, 'ȭ��ǥ��', 386, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (456, '����', 387, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (457, '��������', 388, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (458, '�뿩', 389, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (459, '��ȿ', 390, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (460, '������', 391, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (461, '��¥����', 392, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (462, '������', 393, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (463, '����', 394, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (464, '����', 395, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (465, '�β�', 396, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (466, '����', 397, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (467, 'drm', 398, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (468, '����', 399, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (469, '����å', 400, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (470, '�̸�����', 401, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (471, 'ũ��', 402, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (472, '���ټ�', 403, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (473, '���', 404, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (474, '�������', 405, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (475, 'é��', 406, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (476, 'kc������ũ', 407, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (477, '���ɹ���', 408, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (478, 'Ȯ����', 409, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (479, '�ȼ�', 410, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (480, '�߰�', 411, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (481, '������', 412, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (482, 'ť', 413, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (483, 'dml', 414, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (484, '������', 415, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (485, '�ۼ�', 416, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (486, '�ٹ̱�', 417, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (487, 'ȸ����', 418, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (488, '���߽�', 419, 1, 2,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (489, '���丮', 420, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (490, 'sftp', 421, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (491, 'open', 422, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (492, '�Ǹ�ó', 423, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (493, '���', 424, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (494, 'Ż��', 425, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (495, 'Ʈ����', 426, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (496, '�����', 427, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (497, '���', 428, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (498, '�������', 429, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (499, '�����ù��', 430, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (500, '����', 431, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (501, '��', 432, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (502, '����', 434, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (503, '������', 435, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (504, '�����Ǿ�', 436, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (505, 'ī�Ƕ���Ʈ', 437, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (506, '��å', 438, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (507, '����', 439, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (508, '����', 440, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (509, 'otp', 441, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (510, '����', 442, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (511, '��ư', 443, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (512, 'ȭ��', 444, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (513, 'ǥ��', 445, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (514, '����', 446, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (515, 'ǥ��', 447, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (516, 'sso', 448, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (517, '����', 449, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (518, '�÷�', 450, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (519, '����', 451, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (520, 'Ȯ¡', 452, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (521, '���', 453, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (522, '������', 454, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (523, '�߻�', 455, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (524, '����', 456, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (525, '������', 457, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (526, '��Ƽ��', 458, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (527, '������', 459, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (528, '�ǰ�', 460, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (529, '��', 461, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (530, '��', 462, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (531, '����', 463, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (532, '����ū', 464, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (533, '����ó', 465, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (534, '����', 466, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (535, '��������', 467, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (536, '���׵����׻���', 468, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (537, '��Ÿ����', 469, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (538, '�ּҷ�', 470, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_WORK_MEMO, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (539, '��å', 471, 1, 1,
    'Y', 'responsibilities of office; duty; duties; functions ', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (540, '����', 472, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (541, 'erp', 473, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (542, '����', 474, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (543, '�Ķ����', 475, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (544, '�޸�', 476, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (545, '����', 477, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (546, '��������', 478, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (547, '�ź�', 479, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (548, '�ݷ�', 480, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (549, 'CIP', 481, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (550, '��', 482, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (551, '����', 483, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (552, '�¶���', 484, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (553, '����', 485, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (554, '��', 486, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (555, 'Ȩ������', 487, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (556, '����', 488, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (557, '����', 489, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (558, '����', 490, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (559, '�ڷγ�', 491, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (560, 'Ȯ����', 492, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (561, '����', 493, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (562, '����ó', 494, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (563, '�ι�', 495, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (564, '�μ�', 496, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (565, '�Ǽ�', 497, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (566, '��ȣ', 498, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (567, '��ǰ����', 499, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (568, '�о�', 500, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
Insert into T_HAN_WORD
   (C_HAN_WORD_SEQ, C_HAN_NM, C_ENG_WORD_SEQ, C_WORD_SORT_CD, C_WORD_TYPE_CD,
    C_APPR_YN, C_REG_USER_ID, C_APPR_USER_ID, C_REG_DT)
 Values
   (569, '�̰�', 501, 1, 1,
    'Y', 'bhlee', 'bhlee', datetime('now'));
COMMIT;













--=======================
select 'insert into t_eng_word values ('
     ||''''|| c_eng_word_seq || ''','
	 ||''''|| c_eng_nm || ''','
	 ||''''|| c_eng_abv_nm || ''','
	 ||''''|| ifnull(c_eng_dic_memo, '') ||''');' c_insert_stmt
  from t_eng_word


select 'insert into t_user values ('
     ||''''|| c_user_id || ''','
	 ||''''|| c_user_nm || ''','
	 ||''''|| c_user_pwd || ''','
	 ||''''|| c_user_auth_cd || ''','
	 ||''''|| c_user_stat_cd || ''','
	 ||''''|| strftime('%Y-%m-%d %H:%M:%S', c_reg_dt) ||''');' c_insert_stmt
  from t_user


select 'insert into t_han_word values ('
     ||''''|| c_han_word_seq || ''','
     ||''''|| c_han_nm || ''','
     ||''''|| c_eng_word_seq || ''','
     ||''''|| c_word_sort_cd || ''','
     ||''''|| c_word_type_cd || ''','
     ||''''|| c_appr_yn || ''','
     ||''''|| ifnull(c_kor_dic_memo, '') || ''','
     ||''''|| ifnull(c_work_memo, '') || ''','
     ||''''|| c_reg_user_id || ''','
     ||''''|| ifnull(c_appr_user_id, '') || ''','
     ||''''|| ifnull(c_etc, '') || ''','
     ||''''|| strftime('%Y-%m-%d %H:%M:%S', c_reg_dt) ||''');' c_insert_stmt
  from t_han_word

select 'insert into t_word_cate_mapping values ('
     ||''''|| c_mapping_seq || ''','
     ||''''|| '2' || ''','
     ||''''|| c_eng_word_seq || ''','
     ||''''|| strftime('%Y-%m-%d %H:%M:%S', c_reg_dt) ||''');' c_insert_stmt
  from t_word_cate_mapping



create table tmp_egov_term (
   a varchar2(10),
   b varchar2(10),
   c varchar2(100),
   d varchar2(1000),
   e varchar2(30),
   f varchar2(50),
   g varchar2(200),
   h varchar2(100),
   i varchar2(100),
   j varchar2(20),
   k varchar2(100)
)
nologging;

create table tmp_egov_word (
   a varchar2(10),
   b varchar2(10),
   c varchar2(30),
   d varchar2(100),
   e varchar2(100),
   f varchar2(1000),
   g varchar2(10),
   h varchar2(100),
   i varchar2(200),
   j varchar2(200)
)
nologging;

create table tmp_egov_domain (
   a varchar2(10),
   b varchar2(10),
   c varchar2(100),
   d varchar2(100),
   e varchar2(100),
   f varchar2(1000),
   g varchar2(20),
   h varchar2(20),
   i varchar2(20),
   j varchar2(100),
   k varchar2(100),
   l varchar2(100),
   m varchar2(1000)
)
nologging;

/* ���� �ܾ� */
SELECT 1000 + a c_eng_word_seq
     , e c_eng_nm
     , d c_eng_abv_nm
     , e c_eng_dic_memo
     , 'insert into t_eng_word values ('
    || '''' || to_char(1000 + a) || ''','
    || '''' || replace(e, '''', '''''') || ''','
    || '''' || d || ''','
    || '''' || replace(e, '''', '''''') || ''');' c_stmt
  FROM tmp_egov_word
 order by lpad(a, 10, '0')


/* �ѱ� �ܾ� */
SELECT 1000 + row_number() over(order by lpad(a, 10, '0')) c_han_word_seq
     , c c_han_nm
     , 1000+a c_eng_word_seq
     , '1' c_word_sort_cd
     , '1' c_word_type_cd
     , 'Y' c_appr_yn
     , f c_kor_dic_memo
     , null c_work_dic_memo
     , 'bhlee' c_reg_user_id
     , 'bhlee' c_appr_user_id
     , null c_etc
     , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') c_reg_dt
     , 'insert into t_han_word values ('
    || '''' || to_char(1000 + row_number() over(order by lpad(a, 10, '0'))) || ''','
    || '''' || c || ''','
    || '''' || to_char(1000+a) || ''','
    || '''' || '1' || ''','
    || '''' || '1' || ''','
    || '''' || 'Y' || ''','
    || '''' || replace(f, '''', '''''') || ''','
    || '''' || '' || ''','
    || '''' || 'bhlee' || ''','
    || '''' || 'bhlee' || ''','
    || '''' || '' || ''','
    || '''' || to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') || ''');' c_stmt
  FROM tmp_egov_word
;

/* �ܾ� �з� ���� */
select 1000 + row_number() over(order by lpad(a, 10, '0')) c_mapping_seq
     , '1' c_cate_seq
     , 1000+a c_eng_word_seq
     , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') c_reg_dt
     , 'insert into t_word_cate_mapping values ('
    || '''' || to_char(1000 + row_number() over(order by lpad(a, 10, '0'))) || ''','
    || '''' || '1' || ''','
    || '''' || to_char(1000+a) || ''','
    || '''' || to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') || ''');' c_stmt
  from tmp_egov_word

/* ������ Ÿ�� */
select row_number() over(order by e) c_data_type_seq
     , 'Y' c_domain_yn
     , e c_domain_nm
     , replace(f, '''', '''''') c_domain_memo
     , g c_data_type
     , case when g = 'NUMERIC' then '017'
            when g = 'CHAR' then '005'
            when g = 'VARCHAR' then '001'
            when g = 'DATETIME' then '009'
        end c_data_type_cd
     , h c_data_len
     , replace(i, '-', '') c_precision_len
     , j c_save_memo
     , k c_display_memo
     , l c_unit
     , m c_allowble_value
     , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') c_reg_de
     , 'insert into t_data_type values('
    || '''' || row_number() over(order by lpad(e, 10, '0')) || ''','
    || '''' || 'Y' || ''','
    || '''' || e || ''','
    || '''' || replace(f, '''', '''''') || ''','
    || '''' || case when g = 'NUMERIC' then '017'
                    when g = 'CHAR' then '005'
                    when g = 'VARCHAR' then '001'
                    when g = 'DATETIME' then '009'
                end || ''','
    || '''' || h || ''','
    || '''' || replace(i, '-', '') || ''','
    || '''' || j || ''','
    || '''' || replace(k, '-', '') || ''','
    || '''' || replace(l, '-', '') || ''','
    || '''' || replace(m, '-', '') || ''','
    || '''' || to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') || ''');' c_stmt
  from tmp_egov_domain a


/* ǥ�� ��� */
with w_use_word
as
(
select a.c_term
     , a.c_word_eng
     , b.c c_word_kor
     , a.c_lvl
  from ( select e c_term
              , regexp_substr(e, '[^_]+', 1, c_lvl) c_word_eng
              , c_lvl
           from tmp_egov_term a cross join ( select level c_lvl from dual connect by level <= 10) b
          where regexp_count(e, '[^_]+') >= b.c_lvl
          order by e, c_lvl
         ) a inner join tmp_egov_word b
             on b.d = a.c_word_eng
), w_cate_mapping
   as
   (
       select 1000+row_number() over(order by lpad(a, 10, '0')) c_mapping_seq
            , '1' c_cate_seq
            , 1000+a c_eng_word_seq
            , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') c_reg_dt
         from tmp_egov_word
   ), w_data_type
      as
      (
         select row_number() over(order by e) c_data_type_seq
              , 'Y' c_domain_yn
              , e c_domain_nm
              , replace(f, '''', '''''') c_domain_memo
              , g c_data_type
              , case when g = 'NUMERIC' then '017'
                     when g = 'CHAR' then '005'
                     when g = 'VARCHAR' then '001'
                     when g = 'DATETIME' then '009'
                 end c_data_type_cd
              , h c_data_len
              , replace(i, '-', '') c_precision_len
              , j c_save_memo
              , k c_display_memo
              , l c_unit
              , m c_allowble_value
              , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') c_reg_de
           from tmp_egov_domain a
      )
select c_dic_seq
     , c_dic_eng_nm
     , c_new_term
     , c_dic_memo
     , c_reg_dt
     , 'insert into t_std_dic values('
    || '''' || d.c_dic_seq || ''','
    || '''' || d.c_dic_eng_nm || ''','
    || '''' || d.c_new_term || ''','
    || '''' || d.c_dic_memo || ''','
    || '''' || to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') || ''');' c_stmt
  from ( select row_number() over(order by c) c_dic_seq
              , e c_dic_eng_nm
              , ( select listagg(x.c_word_kor, ' ') within group(order by c_lvl)
                    from w_use_word x
                   where x.c_term = a.e
                  ) c_new_term
              , replace(d, '''', '''''') c_dic_memo
              , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') c_reg_dt
           from tmp_egov_term a
         ) a
;

/* ���ܾ� ���� */
with w_use_word
as
(
select a.c_term
     , a.c_word_eng
     , b.c c_word_kor
     , a.c_lvl
     , a.c_domain_kor
  from ( select e c_term
              , regexp_substr(e, '[^_]+', 1, c_lvl) c_word_eng
              , c_lvl
              , f c_domain_kor
           from tmp_egov_term a cross join ( select level c_lvl from dual connect by level <= 10) b
          where regexp_count(e, '[^_]+') >= b.c_lvl
          order by e, c_lvl
         ) a inner join tmp_egov_word b
             on b.d = a.c_word_eng
), w_cate_mapping
   as
   (
       select 1000+ row_number() over(order by lpad(a, 10, '0')) c_mapping_seq
            , '1' c_cate_seq
            , a c_eng_word_seq
            , d c_eng_word
            , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') c_reg_dt
         from tmp_egov_word
   ), w_data_type
      as
      (
         select row_number() over(order by e) c_data_type_seq
              , 'Y' c_domain_yn
              , e c_domain_nm
              , replace(f, '''', '''''') c_domain_memo
              , g c_data_type
              , case when g = 'NUMERIC' then '017'
                     when g = 'CHAR' then '005'
                     when g = 'VARCHAR' then '001'
                     when g = 'DATETIME' then '009'
                 end c_data_type_cd
              , h c_data_len
              , replace(i, '-', '') c_precision_len
              , j c_save_memo
              , k c_display_memo
              , l c_unit
              , m c_allowble_value
              , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') c_reg_de
           from tmp_egov_domain a
      )
select row_number() over(order by c_term) c_use_seq
     , c.c_mapping_seq
     , b.c_dic_seq
     , d.c_data_type_seq
     , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
     , 'insert into t_use_word_detail values('
    || '''' || row_number() over(order by c_term) || ''','
    || '''' || c.c_mapping_seq || ''','
    || '''' || b.c_dic_seq || ''','
    || '''' || d.c_data_type_seq || ''','
    || '''' || to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') || ''');' c_stmt
  from w_use_word a inner join ( select row_number() over(order by c) c_dic_seq
                                      , e c_dic_eng_nm
                                   from tmp_egov_term a
                                 ) b
                    on b.c_dic_eng_nm = a.c_term
                    inner join w_cate_mapping c
                    on c.c_eng_word = a.c_word_eng
                    inner join w_data_type d
                    on d.c_domain_nm = a.c_domain_kor
;
