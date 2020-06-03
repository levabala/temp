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
      Managers m1,
      Outgoing o
    where
      (m1.managerId = m.managerId)
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
  Managers m
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
      AND (o.outgoingDate > add_months(sysdate, -24))
  )
from
  Managers m
where
  (parentId is null);

/* 10.3 */
select
  distinct p.productId,
  p.name_,
  g.name_
from
  products p,
  groups_ g,
  outgoing o
where
  p.groupId = g.groupId
  and (o.outgoingDate < add_months(sysdate, -3))
  and o.productId = p.productId;

/* 10.4 */
select
  distinct prod.productId,
  prod.name_,
  g.name_,
  price.value_,
  c .name_
from
  products prod,
  groups_ g,
  outgoing o,
  currencies c,
  prices price,
  incoming i
where
  prod.groupId = g.groupId
  and prod.productId = o.productId
  and price.productId = prod.productId
  and price.currentId = c .currentId
  and prod.productId = i.productId
  and i.incomingDate > add_months(sysdate, -1)
  and o.outgoingDate > add_months(sysdate, -1);