delete from
  outgoing cascade;

delete from
  incoming cascade;

delete from
  contracts cascade;

delete from
  managers cascade;

delete from
  accounts cascade;

delete from
  contragents cascade;

delete from
  dealers cascade;

delete from
  banks cascade;

delete from
  taxes cascade;

delete from
  prices cascade;

delete from
  products cascade;

delete from
  groups_ cascade;

delete from
  courses cascade;

delete from
  currencies cascade;

-- currencies
insert into
  currencies (currentId, name_, shortname_)
values
  ('1', 'Ruble', 'rub');

insert into
  currencies (currentId, name_, shortname_)
values
  ('2', 'US Dollar', 'usd');

insert into
  currencies (currentId, name_, shortname_)
values
  ('3', 'Euro', 'eur');

-- currency courses
insert into
  courses (
    currentIdfrom,
    currentIdto,
    dayfrom,
    dayto,
    value_
  )
values
  ('1', '1', '01.01.2010', '05.11.2028', '1');

insert into
  courses (
    currentIdfrom,
    currentIdto,
    dayfrom,
    dayto,
    value_
  )
values
  ('2', '1', '01.01.2010', '09.03.2020', '72');

insert into
  courses (
    currentIdfrom,
    currentIdto,
    dayfrom,
    dayto,
    value_
  )
values
  ('3', '1', '01.01.2010', '09.01.2019', '80');

-- groups_
insert into
  groups_ (groupId, name_, comments)
values
  ('1', 'Phones', '');

insert into
  groups_ (groupId, name_, comments)
values
  ('2', 'Food', '');

insert into
  groups_ (groupId, name_, comments)
values
  ('3', 'Cars', '');

insert into
  groups_ (groupId, name_, comments)
values
  ('4', 'Laptops', '');

-- products
insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('1', '1', 'Iphone 6s', '', '33');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('2', '1', 'Xiaomi Mi Max', '', '33');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('3', '1', 'Samsung S6', '', '31');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('4', '1', 'Huawei Mate', '', '32');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('5', '1', 'HTC Prog 8', '', '09');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('6', '2', 'Apples', '', '04');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('7', '2', 'Banans', '', '19');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('8', '2', 'Milk', '', '04');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('9', '2', 'Cheese', '', '10');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('10', '2', 'Bread', '', '20');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('11', '3', 'Niva', '', '10');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('12', '3', 'Nissan', '', '12');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('13', '3', 'Mitshubishi', '', '11');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('14', '3', 'Mersedes', '', '18');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('15', '3', 'BMW', '', '08');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('16', '4', 'Xiaomi Notebook', '', '18');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  (
    '17',
    '4',
    'Xiaomi Notebook Pro',
    '',
    '18'
  );

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('18', '4', 'Redmi Notebook', '', '16');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('19', '4', 'Apple MacBook', '', '15');

insert into
  products (
    productId,
    groupId,
    name_,
    description,
    expireTime
  )
values
  ('20', '4', 'Microsoft Surface', '', '30');

-- prices
insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('1', '01.06.2019', '1', '03.06.2019', '23');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('1', '04.06.2019', '1', '03.06.2020', '14');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('2', '04.06.2020', '1', '03.02.2021', '3');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('2', '04.02.2021', '1', '03.06.2022', '38');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('3', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('4', '01.02.2019', '2', '03.06.2022', '20');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('4', '01.02.2019', '2', '03.06.2022', '30');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('5', '01.02.2019', '3', '03.06.2022', '40');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('6', '01.02.2019', '3', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('7', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('8', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('9', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('10', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('11', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('12', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('13', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('14', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('15', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('16', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('17', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('18', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('19', '01.02.2019', '2', '03.06.2022', '10');

insert into
  prices (
    productId,
    dayFrom,
    currentId,
    dateto,
    value_
  )
values
  ('20', '01.02.2018', '3', '03.06.2022', '111');

-- taxes
insert into
  taxes (taxId, name_, value_, comments)
values
  ('1', 'Tax 13%', '0.13', '');

insert into
  taxes (taxId, name_, value_, comments)
values
  ('2', 'Tax 25%', '0.25', '');

-- banks
insert into
  banks (bankId, name_, address)
values
  ('1', 'Alpha Bank', 'Russia Moscow');

insert into
  banks (bankId, name_, address)
values
  ('2', 'Center Russia', 'USA Alabama');

insert into
  banks (bankId, name_, address)
values
  ('3', 'Sberbannk', 'USA Chicago');

-- dealers
insert into
  dealers (dealerId, name_, percent, comments)
values
  ('1', 'Daniil', '0.13', '');

insert into
  dealers (dealerId, name_, percent, comments)
values
  ('2', 'Max', '0.02', '');

insert into
  dealers (dealerId, name_, percent, comments)
values
  ('3', 'Anton', '0.01', '');

insert into
  dealers (dealerId, name_, percent, comments)
values
  ('4', 'Ivan', '0.13', '');

-- contragents
insert into
  contragents (contrId, name_, address, phone, comments)
values
  ('1', 'Andrey', 'Dubna', '5(601)006-13-61', '');

insert into
  contragents (contrId, name_, address, phone, comments)
values
  ('2', 'Max', 'Moscow', '5(978)006-80-24', '');

insert into
  contragents (contrId, name_, address, phone, comments)
values
  (
    '3',
    'Valera',
    'Smolensk',
    '4(35)253-96-65',
    ''
  );

insert into
  contragents (contrId, name_, address, phone, comments)
values
  ('4', 'Bob', 'Moscow', '4(35)253-96-65', '');

insert into
  contragents (contrId, name_, address, phone, comments)
values
  (
    '5',
    'Tony',
    'Saint Petersburg',
    '6(50)721-11-78',
    ''
  );

-- accounts
insert into
  accounts (
    accountId,
    bankId,
    contrId,
    accountnumber,
    dayfrom,
    dayto
  )
values
  ('1', '1', '1', '4', '08.01.2020', '12.03.2025');

insert into
  accounts (
    accountId,
    bankId,
    contrId,
    accountnumber,
    dayfrom,
    dayto
  )
values
  ('2', '2', '2', '4', '06.02.2020', '12.03.2025');

insert into
  accounts (
    accountId,
    bankId,
    contrId,
    accountnumber,
    dayfrom,
    dayto
  )
values
  ('3', '3', '3', '5', '01.04.2020', '12.03.2025');

insert into
  accounts (
    accountId,
    bankId,
    contrId,
    accountnumber,
    dayfrom,
    dayto
  )
values
  ('4', '1', '4', '7', '08.01.2020', '11.04.2025');

insert into
  accounts (
    accountId,
    bankId,
    contrId,
    accountnumber,
    dayfrom,
    dayto
  )
values
  ('5', '2', '1', '3', '08.04.2020', '11.04.2025');

insert into
  accounts (
    accountId,
    bankId,
    contrId,
    accountnumber,
    dayfrom,
    dayto
  )
values
  ('6', '3', '5', '2', '06.05.2018', '05.03.2025');

-- managers
insert into
  managers (
    managerId,
    dealerId,
    name_,
    percent,
    hireDay,
    comments,
    parentId
  )
values
  ('1', '1', 'Max', '0.3', '09.09.2020', '', '');

insert into
  managers (
    managerId,
    dealerId,
    name_,
    percent,
    hireDay,
    comments,
    parentId
  )
values
  ('2', '2', 'Tobby', '0.08', '12.03.2019', '', '1');

insert into
  managers (
    managerId,
    dealerId,
    name_,
    percent,
    hireDay,
    comments,
    parentId
  )
values
  ('3', '3', 'Dean', '0.01', '11.03.2020', '', '1');

insert into
  managers (
    managerId,
    dealerId,
    name_,
    percent,
    hireDay,
    comments,
    parentId
  )
values
  ('4', '4', 'Berry', '0.09', '12.03.2020', '', '2');

insert into
  managers (
    managerId,
    dealerId,
    name_,
    percent,
    hireDay,
    comments,
    parentId
  )
values
  ('5', '', 'Black', '0.1', '11.11.2018', '', '');

-- contracts
insert into
  contracts (contrId, managerId, dayfrom, dayto)
values
  ('1', '4', '07.10.2019', '08.12.2020');

insert into
  contracts (contrId, managerId, dayfrom, dayto)
values
  ('2', '2', '07.02.2020', '07.01.2021');

insert into
  contracts (contrId, managerId, dayfrom, dayto)
values
  ('3', '1', '12.09.2019', '09.08.2021');

insert into
  contracts (contrId, managerId, dayfrom, dayto)
values
  ('4', '5', '09.11.2019', '08.22.2020');

-- outgoings
insert into
  incoming (
    incomingId,
    productId,
    taxId,
    contrId,
    managerId,
    incomingDate,
    quantity,
    cost
  )
values
  (
    '1',
    '18',
    '2',
    '5',
    '5',
    '01.01.2019',
    '100',
    '10000'
  );