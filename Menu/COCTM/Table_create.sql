CREATE TABLE C_COCR_TRAN_MASTER
(
  SOLID           VARCHAR2(8),
  SLNO            NUMBER(10),
  CR_ACNO_1       VARCHAR2(16),
  TRAN_AMOUNT_1   NUMBER(20,2),
  GSTAMOUNT_1     NUMBER(20,2),
  CR_ACNO_2       VARCHAR2(16),
  TRAN_AMOUNT_2   NUMBER(20,2),
  GSTAMOUNT_2     NUMBER(20,2),
  CR_ACNO_3       VARCHAR2(16),
  TRAN_AMOUNT_3   NUMBER(20,2),
  GSTAMOUNT_3     NUMBER(20,2),
  REMARKS         VARCHAR2(100),
  TRAN_MODE       VARCHAR2(1),
  DEBITACNO       VARCHAR2(16),
  DEBIT_AMOUNT    NUMBER(20,2),
  NAMEOFPARTY     VARCHAR2(70),
  ADDRESS         VARCHAR2(70),
  PAN             VARCHAR2(20),
  GSTN            VARCHAR2(50),
  MOBILENUMBER    VARCHAR2(15),
  IGST		  VARCHAR2(1),
  TRAN_ID         VARCHAR2(9),
  TRAN_DATE       DATE,
  CUSERID         VARCHAR2(15),
  CDATE           DATE,
  MUSERID         VARCHAR2(15),
  MDATE           DATE,
  DUSERID         VARCHAR2(15),
  DDATE           DATE,
  VUSERID         VARCHAR2(15),
  VDATE           DATE
);

CREATE INDEX C_COCR_TRAN_MASTER_IDX1 ON C_COCR_TRAN_MASTER(SOLID, CR_ACNO_1,SLNO);
CREATE INDEX C_COCR_TRAN_MASTER_IDX2 ON C_COCR_TRAN_MASTER(SOLID, CR_ACNO_2,SLNO);
CREATE INDEX C_COCR_TRAN_MASTER_IDX3 ON C_COCR_TRAN_MASTER(SOLID, CR_ACNO_3,SLNO);

CREATE PUBLIC SYNONYM C_COCR_TRAN_MASTER FOR C_COCR_TRAN_MASTER;
GRANT SELECT, INSERT, UPDATE, DELETE ON C_COCR_TRAN_MASTER TO TBAGEN,TBACUST,TBAUTIL;