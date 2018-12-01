
-- Project Name : sample_db
-- Date/Time    : 2018/12/01 13:10:42
-- Author       : kedama
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- m_item
drop table if exists m_item cascade;

create table m_item (
  item_id serial not null
  , name varchar(20) not null
  , price integer not null
  , constraint m_item_PKC primary key (item_id)
) ;

-- m_user
drop table if exists m_user cascade;

create table m_user (
  user_cd varchar(3) not null
  , name varchar(20) not null
  , constraint m_user_PKC primary key (user_cd)
) ;

-- t_sale
drop table if exists t_sale cascade;

create table t_sale (
  sale_id serial not null
  , item_id bigint not null
  , amount integer not null
  , customer_id bigint not null
  , customer_name varchar(20) not null
  , constraint t_sale_PKC primary key (sale_id)
) ;

-- m_customer
drop table if exists m_customer cascade;

create table m_customer (
  customer_id serial not null
  , name varchar(20) not null
  , constraint m_customer_PKC primary key (customer_id)
) ;

-- c_version
drop table if exists c_version cascade;

create table c_version (
  db_version varchar not null
  , constraint c_version_PKC primary key (db_version)
) ;

comment on table m_item is 'm_item';
comment on column m_item.item_id is 'item_id';
comment on column m_item.name is 'name';
comment on column m_item.price is 'price';

comment on table m_user is 'm_user';
comment on column m_user.user_cd is 'user_cd';
comment on column m_user.name is 'name';

comment on table t_sale is 't_sale';
comment on column t_sale.sale_id is 'sale_id';
comment on column t_sale.item_id is 'item_id';
comment on column t_sale.amount is 'amount';
comment on column t_sale.customer_id is 'customer_id';
comment on column t_sale.customer_name is 'customer_name';

comment on table m_customer is 'm_customer';
comment on column m_customer.customer_id is 'customer_id';
comment on column m_customer.name is 'name';

comment on table c_version is 'c_version';
comment on column c_version.db_version is 'db_version';
