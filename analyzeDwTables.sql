show user;
select * from global_name;
set timing on;
set serveroutput on;
whenever sqlerror exit failure rollback;
whenever oserror exit failure rollback;
select 'analyze dw tables start time: ' || systimestamp from dual;

begin
  declare the_suffix varchar2(6 char);

begin
  select '_' || to_char(nvl(max(to_number(substr(table_name, length('RESULT_') + 1))), 1), 'fm00000')
    into the_suffix
    from user_tables
   where translate(table_name, '0123456789', '0000000000') = 'RESULT_00000';
  dbms_output.put_line('using suffix:' || the_suffix); 

  dbms_output.put_line('analyze activity' || the_suffix);
  dbms_stats.gather_table_stats(user, 'ACTIVITY' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze characteristicname' || the_suffix);
  dbms_stats.gather_table_stats(user, 'CHARACTERISTICNAME' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze country' || the_suffix);
  dbms_stats.gather_table_stats(user, 'COUNTRY' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze county' || the_suffix);
  dbms_stats.gather_table_stats(user, 'COUNTY' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze organization' || the_suffix);
  dbms_stats.gather_table_stats(user, 'ORGANIZATION' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze result' || the_suffix);
  dbms_stats.gather_table_stats(user, 'RESULT' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze samplemedia' || the_suffix);
  dbms_stats.gather_table_stats(user, 'SAMPLEMEDIA' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze sitetype' || the_suffix);
  dbms_stats.gather_table_stats(user, 'SITETYPE' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze state' || the_suffix);
  dbms_stats.gather_table_stats(user, 'STATE' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);
  dbms_output.put_line('analyze station' || the_suffix);
  dbms_stats.gather_table_stats(user, 'STATION' || the_suffix, null, 100, false, 'FOR ALL COLUMNS SIZE AUTO', 1, 'ALL', true);

end;
end;
/

select 'analyze dw tables end time: ' || systimestamp from dual;