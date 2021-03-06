/**
 * Created by Administrator on 2014/5/30.
 */
var formidable = require('formidable'),
    modules = require('ixming-modules-util'),
	simpleResponse = modules.SimpleJsonResponse;
    dao = modules.SimpleDao,
    comfunction = require('comfunction.js')
    util = require('util')
	;

exports.registerRoute = function(router) {

	router.get('/privacy/user', function(req, res, extras){
		console.log('get privacy_user url = ' + req.url);
        simpleResponse.printHeaders(req.headers, 'get privacy_user');
		
		checkExits('SELECT * FROM privacy_user;', {}, function (err, rows) {
			
			if (err || !rows || rows.length <= 0) {
				res.writeHead(500, {'content-type': 'application/json'});
				res.end();
				return ;
			}
			
			res.writeHead(200, {'content-type': 'application/json'});
			var responseContent = simpleResponse.asSimpleSuccessJson(rows);
			res.write(responseContent);
			res.end();
		});
	});

	router.get('/privacy/login', function(req, res, extras){
		console.log('get privacy_login url = ' + req.url);
        simpleResponse.printHeaders(req.headers, 'get privacy_login');
		
		if (!extras || !extras.query) {
			res.writeHead(500, {'content-type': 'application/json'});
			res.end();
			return ;
		}
		var extrasQuery = extras.query;
		checkExits('SELECT * FROM privacy_monitor_user WHERE username = ?;', [extrasQuery.username], function (err, rows_byUsername) {
			
			if (err || !rows_byUsername || rows_byUsername.length <= 0) {
				res.writeHead(500, {'content-type': 'application/json'});
				res.end();
				return ;
			}
			
			checkExits('SELECT * FROM privacy_monitor_user WHERE username = ? AND password = ?;', [extrasQuery.username, extrasQuery.password ],
				function (err, rows_byUser) {
					if (err || !rows_byUser || rows_byUser.length <= 0) {
						res.writeHead(500, {'content-type': 'application/json'});
						res.end();
						return ;
					}
					
					res.writeHead(200, {'content-type': 'application/json'});
					var responseContent = simpleResponse.asSimpleSuccessJson('1');
					res.write(responseContent);
					res.end();
				});
		});
	});

	function checkExits(sql, whereArgs, callback){
		console.log('checkExits whereArgs', whereArgs);
		dao.getConnection(function(err, connection){
			if (err) {
				callback(err);
				return ;
			}
			
			var query = connection.query(sql, whereArgs,
				function(err, rows) {
					connection.release();
					if (err) {
						callback(err);
						return ;
					}
					
					callback(null, rows);
				});
			console.log('checkExits sql', query.sql);
		});
	}
	
};
