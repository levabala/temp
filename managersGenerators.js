function random(min, max) {
    return min + Math.floor((max + 1 - min) * Math.random());
}
function randomDate(start, end) {
    return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
}
function formatDate(date) {
    var year = date.getFullYear();
    var month = (1 + date.getMonth()).toString();
    month = month.length > 1 ? month : "0" + month;
    var day = date.getDate().toString();
    day = day.length > 1 ? day : "0" + day;
    return month + "." + day + "." + year;
}
var argumentsTemplate = [
    function () { return random(1, 18).toString(); },
    function () { return random(1, 2).toString(); },
    function () { return (random(0, 5) || "").toString(); },
    function () { return (random(0, 5) || "").toString(); },
    function () { return formatDate(randomDate(new Date(2019, 0, 0), new Date())); },
    function () { return random(1, 100).toString(); },
    function () { return random(1, 1000).toString(); },
];
function shell(count) {
    return new Array(count).fill(null);
}
var insertsCount = 100;
var argumentsArr = shell(insertsCount).map(function (_, i) {
    return [i.toString()].concat(argumentsTemplate.map(function (val) { return val(); }));
});
// insert into incoming (incomingId,productId,taxId,contrId,managerId,incomingDate,quantity,cost) values ('1','18','2','5','5','01.01.2019','100','10000');
// insert into prices (productId,dayFrom,currentId,dateTo,value_) values ('1','30.03.2020','1','29.04.2020','276');
var resultPrices = shell(insertsCount)
    .map(function (_, i) {
    var dateStart = randomDate(new Date(2019, 0, 0), new Date());
    var dateEnd = randomDate(dateStart, new Date());
    return [
        random(1, 20),
        formatDate(dateStart),
        random(1, 3),
        formatDate(dateEnd),
        random(1, 300),
    ];
})
    .map(function (row) { return row.map(function (val) { return "'" + val + "'"; }).join(","); })
    .map(function (argsStr) {
    return "insert into prices (productId,dayFrom,currentId,dateTo,value_) values (" + argsStr + ");";
});
var argumentsStr = argumentsArr.map(function (row) {
    return row.map(function (val) { return "'" + val + "'"; }).join(",");
});
var resultOut = argumentsStr.map(function (argsStr) {
    return "insert into outgoing (outgoingId,productId,taxId,contrId,managerId,outgoingDate,quantity,cost) values (" + argsStr + ");";
});
var resultIn = argumentsStr.map(function (argsStr) {
    return "insert into incoming (incomingId,productId,taxId,contrId,managerId,incomingDate,quantity,cost) values (" + argsStr + ");";
});
resultIn.forEach(function (res) { return console.log(res); });
console.log();
console.log();
resultOut.forEach(function (res) { return console.log(res); });
console.log();
console.log();
resultPrices.forEach(function (res) { return console.log(res); });
