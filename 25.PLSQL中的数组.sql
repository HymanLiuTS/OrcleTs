select * from mydept;
drop type project_type;
drop table mydept purge;
--��ջ���վ
purge recyclebin;
--��������projects_varray
create or replace type projects_varray is varray(10) of varchar2(20); 
--ʹ�ô���������projects_varray�������ݱ�mydept
create table mydept(deptnum number,dname varchar2(20),projects projects_varray);
--�����ݱ��в�������
insert into mydept values (1,'ϵͳ�����',projects_varray('NGP','Pecstart'));
--�������ݱ����������
update mydept set projects=projects_varray('GNP','Pecstar','IEMS') where deptnum=1;

--��plsql������ʹ������
declare
  type projects_varray2 is varray(4) of varchar2(20); 
  v_projects projects_varray2:=projects_varray2('NGP','Pecstar','IEMS',NULL);
begin
  v_projects(4):='IEEM';
  for x in v_projects.first .. v_projects.last loop
      dbms_output.put_line(v_projects(x));
  end loop;
end;
/
 