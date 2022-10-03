[SQLITE-TABLE_EXISTS-000]
sql_desc='sqlite db table 존재 여부 파악'
sql_param_cnt=1
0001=select count(1) c_exists_cnt
0002=  from sqlite_master
0003= where name = :table_name

[SQLITE - T_COMMON - 001]
sql_desc='공통 코드'
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
sql_desc='데이터 타입'
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
sql_desc='영문 단어'
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
sql_desc='한글 단어'
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
sql_desc='표준 용어'
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
sql_desc='사용자'
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
sql_desc='사용 단어 내역'
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
sql_desc='단어 분류'
sql_param_cnt=0
0001=create table t_word_cate
0002=(
0003=   c_cate_seq           int not null default 1,
0004=   c_cate_nm            varchar(20) not null,
0005=   primary key (c_cate_seq)
0006=)

[SQLITE - T_WORD_CATE_MAPPING - 009]
sql_desc='단어 분류 매핑'
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
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '01', 'ORACLE', NULL)

[T_COMMON - 011]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '02', 'MSSQL', NULL)

[T_COMMON - 012]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '03', 'MYSQL', NULL)

[T_COMMON - 013]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '04', 'MARIADB', NULL)

[T_COMMON - 014]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '05', 'POSTGRESQL', NULL)

[T_COMMON - 015]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '06', 'FIREBIRD', NULL)

[T_COMMON - 016]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W01', '07', 'SQLITE', NULL)

[T_COMMON - 017]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '001', 'VARCHAR', NULL)

[T_COMMON - 018]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '002', 'VARCHAR2', NULL)

[T_COMMON - 019]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '003', 'NVARCHAR', NULL)

[T_COMMON - 020]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '004', 'NVARCHAR2', NULL)

[T_COMMON - 021]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '005', 'CHAR', NULL)

[T_COMMON - 022]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '006', 'NCHAR', NULL)

[T_COMMON - 023]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '007', 'DATE', NULL)

[T_COMMON - 024]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '008', 'TIME', NULL)


[T_COMMON - 025]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '009', 'DATETIME', NULL)

[T_COMMON - 026]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '010', 'TIMESTAMP', NULL)

[T_COMMON - 027]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '011', 'CLOB', NULL)

[T_COMMON - 028]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '012', 'TEXT', NULL)

[T_COMMON - 029]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '013', 'BLOB', NULL)

[T_COMMON - 030]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '014', 'INTEGER', NULL)

[T_COMMON - 031]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '015', 'INT', NULL)

[T_COMMON - 032]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '016', 'NUMBER', NULL)

[T_COMMON - 033]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W02', '017', 'NUMERIC', NULL)

[T_COMMON - 034]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W03', 'Y', '도메인', NULL)

[T_COMMON - 035]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W03', 'N', '도메인 아님', NULL)

[T_COMMON - 036]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W04', '1', '표준 단어', NULL)

[T_COMMON - 037]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W04', '2', '이음동의어', NULL)

[T_COMMON - 038]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W04', '3', '금칙어', NULL)

[T_COMMON - 039]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W05', '1', '단일어', NULL)

[T_COMMON - 040]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W05', '2', '합성어', NULL)

[T_COMMON - 041]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W05', '3', '접두어', NULL)

[T_COMMON - 042]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W05', '4', '접미어', NULL)

[T_COMMON - 043]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W06', 'Y', '승인', NULL)

[T_COMMON - 044]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W06', 'N', '미승인', NULL)

[T_COMMON - 045]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W07', '1', '일반', NULL)

[T_COMMON - 046]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W07', '9', '관리자', NULL)

[T_COMMON - 047]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W08', 'Y', '사용', NULL)

[T_COMMON - 048]
sql_desc='공통코드 INSERT'
sql_param_cnt=0
0001=insert into t_comn_cd(c_flg_key, c_flg_cd, c_flg_nm1, c_flg_nm2) values ('W08', 'N', '미사용', NULL)

