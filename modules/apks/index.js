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

    // as find all
    router.get('/privacy/apks/', function(req, res, extras){
        console.log('get privacy_apks url = ' + req.url);
        simpleResponse.printHeaders(req.headers, 'get privacy_apks');
		
		res.setHeader('Content-disposition', 'attachment; filename=' + 'privacy_app.apk');
		comfunction.sendFile('/mnt/apks/privacy_app.apk', res);
    });

};
