--1.1 ��ѯROWID
select rowid,deptno,dname,loc from dept;
--1.2 ɾ���ظ�������
insert into dept values(60,'soft','shenzhen');
delete from dept where rowid 
not in
(select min(rowid) from dept group by deptno);
--2.1 ��ѯ���кŵ�����
select rownum,deptno,dname,loc from dept;
--����ͨ�ķ�ʽ����rownum���з�ҳ
select * from dept where rownum<=4 and rownum>=3;
--�����Ӳ�ѯ��rownum���з�ҳ��ѯ
select * from
(select rownum rn,deptno,dname,loc from dept where rownum<=4)
where rn>=3; 