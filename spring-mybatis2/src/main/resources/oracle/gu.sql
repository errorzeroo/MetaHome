create table seoul(
gu varchar2(100));

INSERT ALL
    INTO seoul (gu) VALUES ('')
    INTO seoul (gu) VALUES ('강남구')
    INTO seoul (gu) VALUES ('강동구')
    INTO seoul (gu) VALUES ('강북구')
    INTO seoul (gu) VALUES ('강서구')
    INTO seoul (gu) VALUES ('관악구')
    INTO seoul (gu) VALUES ('광진구')
    INTO seoul (gu) VALUES ('구로구')
    INTO seoul (gu) VALUES ('금천구')
    INTO seoul (gu) VALUES ('노원구')
    INTO seoul (gu) VALUES ('도봉구')
    INTO seoul (gu) VALUES ('동대문구')
    INTO seoul (gu) VALUES ('동작구')
    INTO seoul (gu) VALUES ('마포구')
    INTO seoul (gu) VALUES ('서대문구')
    INTO seoul (gu) VALUES ('서초구')
    INTO seoul (gu) VALUES ('성동구')
    INTO seoul (gu) VALUES ('성북구')
    INTO seoul (gu) VALUES ('송파구')
    INTO seoul (gu) VALUES ('양천구')
    INTO seoul (gu) VALUES ('영등포구')
    INTO seoul (gu) VALUES ('용산구')
    INTO seoul (gu) VALUES ('은평구')
    INTO seoul (gu) VALUES ('종로구')
    INTO seoul (gu) VALUES ('중구')
    INTO seoul (gu) VALUES ('중랑구')
SELECT * FROM DUAL;

select * from seoul;

commit;

create table kind(
h_kind varchar2(1000));

INSERT ALL
    INTO kind (h_kind) VALUES ('')
    INTO kind (h_kind) VALUES ('아파트')
    INTO kind (h_kind) VALUES ('연립주택')
    INTO kind (h_kind) VALUES ('다세대주택')
    INTO kind (h_kind) VALUES ('단독주택')
    INTO kind (h_kind) VALUES ('다가구주택')
    INTO kind (h_kind) VALUES ('오피스텔')
SELECT * FROM DUAL;

create table yon(
yn varchar2(100));

insert into yon(yn) values('N');
insert into yon(yn) values('Y');