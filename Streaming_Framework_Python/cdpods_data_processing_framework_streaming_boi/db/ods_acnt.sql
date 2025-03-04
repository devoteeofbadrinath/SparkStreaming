CREATE SCHEMA IF NOT EXISTS ${prefix}ods;

CREATE TABLE IF NOT EXISTS ${prefix}ods.acnt (
    ACNT_ID_NUM VARCHAR(255) NOT NULL PRIMARY KEY,
    SHDW_BAL_AMT VARCHAR(255),
    SHDW_BAL_DTTM VARCHAR(255),
    SHDW_BAL_SEQ VARCHAR(255),
    LDGR_BAL_AMT VARCHAR(255),
    LDGR_BAL_DTTM VARCHAR(255),
    LDGR_BAL_SEQ VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ods.acnt (
    ACNT_ID_NUM VARCHAR(255) NOT NULL PRIMARY KEY,
    SHDW_BAL_AMT VARCHAR(255),
    SHDW_BAL_DTTM VARCHAR(255),
    SHDW_BAL_SEQ VARCHAR(255),
    LDGR_BAL_AMT VARCHAR(255),
    LDGR_BAL_DTTM VARCHAR(255),
    LDGR_BAL_SEQ VARCHAR(255)
);