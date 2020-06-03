drop table managers cascade constraints;

drop table dealers cascade constraints;

drop table contragents cascade constraints;

drop table contracts cascade constraints;

drop table products cascade constraints;

drop table groups_ cascade constraints;

drop table prices cascade constraints;

drop table currencies cascade constraints;

drop table courses cascade constraints;

drop table incoming cascade constraints;

drop table outgoing cascade constraints;

drop table taxes cascade constraints;

drop table accounts cascade constraints;

drop table banks cascade constraints;

create table managers (
  managerId number not null primary key,
  dealerId number,
  name_ varchar2(20),
  percent number,
  hireDay date,
  comments varchar2(80),
  parentId number
);

create table dealers (
  dealerId number not null primary key,
  name_ varchar2(20),
  percent number,
  comments varchar2(80)
);

create table contragents(
  contrId number not null primary key,
  name_ varchar2(20),
  address varchar2(80),
  phone varchar2(15),
  comments varchar2(80)
);

create table contracts(
  contrId number not null,
  managerId number not null,
  dayFrom date,
  dayTo date,
  constraint contractsPK primary key (contrId, managerId)
);

create table products(
  productId number not null primary key,
  groupId number,
  name_ varchar2(20),
  description varchar2(80),
  expireTime number
);

create table groups_(
  groupId number not null primary key,
  name_ varchar2(20),
  comments varchar2(80)
);

create table prices(
  productId number not null,
  dayFrom date not null,
  currentId number,
  dateto date,
  value_ number,
  constraint pricesPK primary key (productId, dayFrom)
);

create table currencies(
  currentId number not null primary key,
  name_ varchar2(100),
  shortname_ varchar2(5)
);

create table courses(
  currentIdFrom number not null,
  currentIdTo number not null,
  dayFrom date not null,
  dayTo date,
  value_ number,
  constraint coursesPK primary key (currentIdFrom, currentIdTo, dayFrom)
);

create table incoming(
  incomingId number not null primary key,
  productId number,
  taxId number,
  contrId number,
  managerId number,
  incomingDate date,
  quantity number,
  cost number
);

create table outgoing(
  outgoingId number not null primary key,
  productId number,
  taxId number,
  contrId number,
  managerId number,
  outgoingDate date,
  quantity number,
  cost number
);

create table taxes(
  taxId number not null primary key,
  name_ varchar2(15),
  value_ number,
  comments varchar2(80)
);

create table accounts(
  accountId number not null primary key,
  bankId number,
  contrId number,
  accountnumber number,
  dayFrom date,
  dayTo date
);

create table banks(
  bankId number not null primary key,
  name_ varchar2(100),
  address varchar2(50)
);

alter table
  managers
add
  foreign key (parentId) references managers(managerId);

alter table
  managers
add
  foreign key (dealerId) references dealers(dealerId);

alter table
  contracts
add
  foreign key (managerId) references managers(managerId);

alter table
  contracts
add
  foreign key (contrId) references contragents(contrId);

alter table
  products
add
  foreign key (groupId) references groups_(groupId);

alter table
  prices
add
  foreign key (productId) references products(productId);

alter table
  prices
add
  foreign key (currentId) references currencies(currentId);

alter table
  courses
add
  foreign key (currentIdFrom) references currencies(currentId);

alter table
  courses
add
  foreign key (currentIdTo) references currencies(currentId);

alter table
  incoming
add
  foreign key (productId) references products(productId);

alter table
  incoming
add
  foreign key (taxId) references taxes(taxId);

alter table
  incoming
add
  foreign key (contrId) references contragents(contrId);

alter table
  incoming
add
  foreign key (managerId) references managers(managerId);

alter table
  outgoing
add
  foreign key (productId) references products(productId);

alter table
  outgoing
add
  foreign key (taxId) references taxes(taxId);

alter table
  outgoing
add
  foreign key (contrId) references contragents(contrId);

alter table
  outgoing
add
  foreign key (managerId) references managers(managerId);

alter table
  accounts
add
  foreign key (bankId) references banks(bankId);

alter table
  accounts
add
  foreign key (contrId) references contragents(contrId);