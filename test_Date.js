
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '05237486784',
  database : 'privacy_app',
  multipleStatements : true
});

connection.connect();
connection.query('SELECT * from privacy_monitor_user;',
	function(err, rows){
		if (err) throw err;
		console.log('The solution is: ', rows);
	});
connection.end();

// This is a buffering parser, not quite as nice as the multipart one.
// If I find time I'll rewrite this to be fully streaming as well
var querystring = require('querystring');
function func(data) {
	if (data) {
		return data;
	}
}

console.log(func());
console.log(func(1));

var str = '1';
console.log(str instanceof String);


var obj = JSON.parse('{"id":"110224","title":"\u5386\u5c4a\u4e16\u754c\u676f\u5f00\u5e55\u5f0f\u7cbe\u5f69\u77ac\u95f4","ntype":null,"addtime":null,"thumb":"http:\/\/img3.cache.netease.com\/photo\/0001\/2014-06-14\/900x600_9UMU136B4T8F0001.jpg"}');

console.dir(obj);


var date = new Date();

console.log('' + Date);
console.dir(Date);
console.log(date);
console.log(date.getTime());