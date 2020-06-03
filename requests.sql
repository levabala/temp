/* 10.1 */
select
  managerId,
  dealerId,
  name__,
  percent,
  hireDay,
  comments,
  parentId,
  (
    select
      SUM(m.percent * o.cost * o.quantity / 100)
    from
      managers c1,
      Outgoing o
    where
      (c1.managerId = m.managerId)
      and (o.managerId = m.managerId)
      and (
        (
          select
            to_char(o.outgoingDate, 'YYYY')
          from
            Outgoing o1
          where
            o.outgoingId = o1.outgoingId
        ) = '2020'
      )
  )
from
  managers m
where
  (parentId is null);

/* 10.2 */
select
  managerId,
  dealerId,
  name_,
  percent,
  hireDay,
  comments,
  parentId,
  (
    select
      COUNT(o.outgoingId)
    from
      outgoing o
    where
      (o.managerId = m.managerId)
      and (o.outgoingDate > add_months(sysdate, -24))
  )
from
  managers m
where
  (parentId is null);

/* 10.3 */
select
  distinct p.productId,
  p.name_,
  g.name_
from
  products p,
  groups__ g,
  outgoing o
where
  p.groupId = g.groupId
  and (o.outgoingDate < add_months(sysdate, -3))
  and o.productId = p.productId;

/* 10.4 */
SELECT
  p.*
from
  (
    select
      pp.name_,
      count(o.outgoingId) as outgoingsCount
    from
      outgoing o,
      products pp
    where
      pp.productId = o.productId
      and o.outgoingDate between ADD_MONTHS(sysdate, -4)
      and sysdate
    group by
      pp.name_
  ) pv,
  products p
where
  not p.name_ in pv.name_;

/* 11.1 */
SELECT
  m.*,
  (
    SELECT
      SUM(m.percent * o.cost * o.quantity / 100)
    from
      managers c1,
      Outgoing o
    where
      (c1.managerId = m.managerId)
      and (o.managerId = m.managerId)
      and (
        TO_CHAR(o.outgoingDate, 'mm') - 1 = TO_CHAR(sysdate, 'mm')
      )
  ) AS LASTMONTH,
  (
    SELECT
      SUM(m.percent * o.cost * o.quantity / 100)
    from
      managers c1,
      Outgoing o
    where
      (c1.managerId = m.managerId)
      and (o.managerId = m.managerId)
      and (
        TO_CHAR(o.outgoingDate, 'mm') = TO_CHAR(sysdate, 'mm')
      )
  ) AS CURRENTMONTH
FROM
  managers m;

/* 11.2 */
SELECT
  cc.*,
  (
    SELECT
      COUNT(c.contrId)
    from
      contracts c
    where
      (cc.contrId = c.contrId)
  ) AS CONTRCOUNT,
  (
    SELECT
      COUNT(c.contrId)
    from
      contracts c
    where
      (cc.contrId = c.contrId)
      and trunc(c.dayTo) >= trunc(sysdate)
  ) AS CURRENTCONTR
FROM
  contragents cc;

/* 11.3 */
SELECT
  g.name_,
  (
    SELECT
      max(price.value_)
    from
      prices price,
      products prod,
      groups_ g1
    where
      (prod.productId = price.productId)
      and (g1.groupId = g.groupId)
      and (prod.groupId = g.groupId)
  ) AS MAXPRICE,
  (
    SELECT
      AVG(price.value_)
    from
      prices price,
      products prod,
      groups_ g1
    where
      (prod.productId = price.productId)
      and (g1.groupId = g.groupId)
      and (prod.groupId = g.groupId)
  ) AS AVGPRICE,
  (
    SELECT
      min(price.value_)
    from
      prices price,
      products prod,
      groups_ g1
    where
      (prod.productId = price.productId)
      and (g1.groupId = g.groupId)
      and (prod.groupId = g.groupId)
  ) AS MINPRICE
FROM
  groups_ g;

/* 11.4 */
SELECT
  distinct p.*
from
  products p,
  outgoing o
where
  p.productId = o.productId
  and o.cost = (
    select
      max(o1.cost)
    from
      Outgoing o1
    where
      (o1.outgoingId = o.outgoingId)
  )
  and o.outgoingDate between ADD_MONTHS(sysdate, -4)
  AND sysdate;

/* 12.1 */
CREATE
OR REPLACE VIEW viewSalary as
SELECT
  m.managerId,
  SUM(o.cost) as salary
from
  outgoing o,
  managers m
where
  o.managerId = m.managerId
group by
  m.managerid;

SELECT
  m.*,
  s.salary
from
  Managers m,
  viewSalary s
where
  s.salary != 0
ORDER BY
  s.salary DESC FETCH NEXT 3 ROWS ONLY;

/* 12.2 */
create
or replace view viewRubleCoursesCurrent as
select
  *
from
  courses
where
  currentIdTo = 1
  and sysdate between dayFrom
  and dayTo;

Select
  prod.*,
  price.value_ as priceLocal,
  (
    (
      select
        c.value_
      from
        viewRubleCoursesCurrent c
      where
        price.currentId = c.currentIdFrom
    ) * price.value_
  ) as priceRubles
from
  products prod,
  prices price
WHERE
  prod.productId = price.productId
  and price.dayFrom < sysdate
  and price.dateto > sysdate
ORDER BY
  price.value_ DESC FETCH NEXT (
    SELECT
      COUNT(productId) / 10
    from
      products
  ) ROWS ONLY;

/* 12.3 */
SELECT
  p.*
from
  products p,
  Outgoing o
where
  p.productId = o.productId
  and TO_CHAR(o.outgoingDate, 'YYYY') = TO_CHAR(sysdate, 'YYYY') -- and TO_CHAR(o.outgoingDate, 'MM') = TO_CHAR(sysdate, 'MM')
ORDER BY
  outgoingDate desc FETCH NEXT 5 ROWS ONLY;

/* 12.4 partial */
SELECT
  p.*,
  (
    SELECT
      SUM(i.quantity) - SUM(o.quantity)
    from
      Incoming i,
      Outgoing o
    where
      i.productId = p.productId
      and p.productId = o.productId
  ) AS COUNT_LEFT
from
  products p
ORDER BY
  COUNT_LEFT asc FETCH NEXT 5 ROWS ONLY;

/* 14.1 */
create
or replace view actualPricesRubles as
select
  product.productId,
  (
    (
      select
        c.value_
      from
        viewRubleCoursesCurrent c
      where
        price.currentId = c.currentIdFrom
    ) * price.value_
  ) as priceRubles
from
  products product,
  prices price
where
  price.productId = product.productId
  and sysdate between price.dayFrom
  and price.dateTo;

select
  *
from
  actualPricesRubles;

create
or replace view averageCostGroups as
select
  g.groupId,
  AVG(
    (
      select
        apr.priceRubles
      from
        actualPricesRubles apr
      where
        p.productId = apr.productId
    )
  ) as averageRubleCost
from
  products p,
  groups_ g
where
  g.groupId = p.groupId
group by
  g.groupId;

select
  *
from
  averageCostGroups;

select
  p.productId,
  p.name_,
  g.name_,
  c.averageRubleCost
from
  products p,
  groups_ g,
  averageCostGroups c
where
  p.groupId = g.groupId
  and p.groupId = c.groupId
  and (
    select
      priceRubles
    from
      actualPricesRubles acr
    where
      acr.productId = p.productId
  ) < c.averageRubleCost;

/* 14.2 */
create
or replace view overAverageProducts as
select
  p.*
from
  products p,
  averageCostGroups acg
where
  p.groupId = acg.groupId
  and (
    select
      priceRubles
    from
      actualPricesRubles acr
    where
      acr.productId = p.productId
  ) > acg.averageRubleCost;

select
  *
from
  overAverageProducts;

create
or replace view overAverageProductsOutgoings as
select
  o.*
from
  outgoing o,
  overAverageProducts ovp
where
  o.productId = ovp.productId;

create
or replace view managersSalaryLastYear as
select
  m.managerId,
  SUM(o.cost) as salary
from
  managers m,
  outgoing o
where
  o.managerId = m.managerId
  and TO_CHAR(o.outgoingDate, 'YYYY') = TO_CHAR(sysdate, 'YYYY')
group by
  m.managerId;

select
  *
from
  managersSalaryLastYear;

select
  distinct m.*,
  s.salary
from
  managers m,
  overAverageProductsOutgoings ovpo,
  managersSalaryLastYear s
where
  m.managerId = ovpo.managerId
  and m.managerId = s.managerId;