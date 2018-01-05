drop table tmp_mod;

create table tmp_mod as (select * from mod where mop_id = 'TM');

update tmp_mod set mop_id = 'COCTM', input_filename = 'coctm.scr',exe_name = ' ',mop_type='W';
commit;

insert into mod select * from tmp_mod;
commit;

drop table tmp_mod;

create table tmp_mod as (select * from mod_txt where mop_id = 'TM');
update tmp_mod set mop_id = 'COCTM' , user_mop_id = 'COCTM', mop_text = 'TM of CO Accounts';
commit;

insert into mod_txt select * from tmp_mod;
commit;

drop table tmp_mod;


insert into oat values('COCTM','GU','TBAADM',sysdate,'TBAADM',sysdate,'0' );
insert into oat values('COCTM','DB','TBAADM',sysdate,'TBAADM',sysdate,'0' );
commit;

insert into mno values ('WFME','61','COCTM','TBAADM',sysdate,'TBAADM',sysdate , '0');
commit;