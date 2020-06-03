function random(min: number, max: number) {
  return min + Math.floor((max + 1 - min) * Math.random());
}

function randomDate(start: Date, end: Date) {
  return new Date(
    start.getTime() + Math.random() * (end.getTime() - start.getTime())
  );
}

function formatDate(date: Date) {
  var year = date.getFullYear();

  var month = (1 + date.getMonth()).toString();
  month = month.length > 1 ? month : "0" + month;

  var day = date.getDate().toString();
  day = day.length > 1 ? day : "0" + day;

  return month + "." + day + "." + year;
}

const argumentsTemplate: Array<() => string> = [
  () => random(1, 18).toString(),
  () => random(1, 2).toString(),
  () => (random(0, 5) || "").toString(),
  () => (random(0, 5) || "").toString(),
  () => formatDate(randomDate(new Date(2019, 0, 0), new Date())),
  () => random(1, 100).toString(),
  () => random(1, 1000).toString(),
];

function shell(count: number) {
  return (new Array(count) as any).fill(null) as Array<any>;
}

const insertsCount = 100;
const argumentsArr = shell(insertsCount).map((_, i) =>
  [i.toString()].concat(argumentsTemplate.map((val) => val()))
);

// insert into incoming (incomingId,productId,taxId,contrId,managerId,incomingDate,quantity,cost) values ('1','18','2','5','5','01.01.2019','100','10000');
// insert into prices (productId,dayFrom,currentId,dateTo,value_) values ('1','30.03.2020','1','29.04.2020','276');

const resultPrices = shell(insertsCount)
  .map((_, i) => {
    const dateStart = randomDate(new Date(2019, 0, 0), new Date());
    const dateEnd = randomDate(dateStart, new Date());
    return [
      random(1, 20),
      formatDate(dateStart),
      random(1, 3),
      formatDate(dateEnd),
      random(1, 300),
    ];
  })
  .map((row) => row.map((val) => `'${val}'`).join(","))
  .map(
    (argsStr) =>
      `insert into prices (productId,dayFrom,currentId,dateTo,value_) values (${argsStr});`
  );

const argumentsStr = argumentsArr.map((row) =>
  row.map((val) => `'${val}'`).join(",")
);

const resultOut = argumentsStr.map(
  (argsStr) =>
    `insert into outgoing (outgoingId,productId,taxId,contrId,managerId,outgoingDate,quantity,cost) values (${argsStr});`
);

const resultIn = argumentsStr.map(
  (argsStr) =>
    `insert into incoming (incomingId,productId,taxId,contrId,managerId,incomingDate,quantity,cost) values (${argsStr});`
);

resultIn.forEach((res) => console.log(res));
console.log();
console.log();
resultOut.forEach((res) => console.log(res));
console.log();
console.log();
resultPrices.forEach((res) => console.log(res));
