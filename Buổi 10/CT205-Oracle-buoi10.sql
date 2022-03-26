--############################### Buoi 10    #################################
--vd1
select * from scott_emp;
create or replace trigger check_sal_comm_emp
    after insert or update of sal, comm on scott_emp
    for each row
begin
    -- Luong (Sal) > thuong (Comm)
    if (:new.sal <:new.comm) then
        raise_application_error(-20225,'Luong phai lon hon thuong');
    --Luong moi > luong cu
    elsif (:new.sal <:old.sal) then
        raise_application_error(-20230,'Luong moi phai cao hon luong cu');
    --Khong tang luong qua 10%
    elsif (:new.sal > 1.1 *:old.sal) then
        raise_application_error(-20235, 'Khong duoc tang qua 10%');
    end if;
end;
drop trigger check_sal_comm_emp;

--vd2
--them cot budget kieu number(10)
alter table scott_dept add budget number(10);
-- tong tien luong cua tat ca nhan vien trong phong khong duoc qua ngan sach
create or replace trigger check_budget_emp
    after insert or update of sal, deptno on scott_emp
declare
	--Khai báo cursor ch?a mã phòng và ngân sách t? b?ng DeptT
	cursor dept_cur is
		select deptno, budget from scott_dept;
	--Khai báo bi?n ?? l?u mã phòng(DNO), T?ng l??ng t? ngân
	--sách(ALLSAL), và t?ng l??ng t? các nhân viên (DEPT_SAL)
		dno scott_dept.deptno%type;
		allsal scott_dept.budget%type;
		dept_sal number;
	begin
		open dept_cur;
		loop
			--l?y ngân sách c?a t?ng phòng
			fetch dept_cur into dno, allsal;
				exit when dept_cur%notfound;
			--Tính t?ng l??ng c?a các nhân viên trong phòng ?ó
			select sum(sal) into dept_sal from scott_emp
			where deptno = dno;
			--N?u T?ng l??ng > Ngân sách thì báo l?i
			if dept_sal > allsal then
				raise_application_error(-20325, 'Tong luong trong phong ' || to_char(dno) || ' da vuot qua ngan sach');
			end if;
		end loop;
	close dept_cur;
end;
drop trigger check_budget_emp;

--vd3
-- trigger theo dõi vi?c ch?nh s?a nh?ng d? li?u nh?y c?m
create table change_sal_emp(
    username varchar2(20),
    modify_time date,
    empno number(4),
    old_sal number(7),
    new_sal number(7) 
);
create or replace trigger store_change_sal_emp
    after update of sal on scott_emp
    for each row
begin
    -- User là m?t hàm có s?n trong h? th?ng cho bi?t ai ?ang k?t n?i CSDL
    insert into change_sal_emp(username, modify_time, empno, old_sal, new_sal)
    values (user, sysdate,:new.empno,:old.sal,:new.sal);
end;
--kiem tra bang change_sal_emp
select * from change_sal_emp;

--vd6
--trigger ng?n không cho thêm th? BH 
--khi khách hàng này ?ã mua b?o hi?m lo?i này và th? ?ã mua v?n còn hi?u l?c
create or replace trigger da_co_bh 
    before insert on thebh for each row
declare
    sodong int;
begin
    select count(*) into sodong from thebh
        where makh =:new.makh and maloai =:new.maloai
        and ngaykt<sysdate;
    if sodong >0 then
        raise_application_error(-20111, 'KH nay hien van con duoc BH loai nay');
    end if;
end;
--check trigger
select * from thebh;
insert into thebh (maloai, ngaybd, makh, thoihan, ngaykt, conhl)
values('YT', sysdate, '006', 6, add_months(sysdate,6), 1);
insert into thebh (maloai, ngaybd, makh, thoihan, ngaykt, conhl)
values('YT', sysdate+1, '006', 6, add_months(sysdate+1,6), 1);

--vd7 
--trigger ?? chèn d? li?u vào b?ng MUCPHI 
--m?i khi ng??i dùng c?p nh?t m?c phí ho?c thêm m?t lo?i b?o hi?m v?i phí m?i.
create or replace trigger update_phi 
    after insert or update on loaibh for each row
declare
begin
    insert into mucphi (maloai, mucphi, ngaybd, nguoicn)
    values(:new.maloai,:new.mucphi, sysdate, user);
end;
--check trigger
update loaibh set mucphi = 8 where maloai='TS';
select * from mucphi;