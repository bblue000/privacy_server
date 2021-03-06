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

	router.get('/privacy/apks/', function(req, res, extras){
        console.log('get privacy_apks url = ' + req.url);
        simpleResponse.printHeaders(req.headers, 'get privacy_apks');
		
		res.setHeader('Content-disposition', 'attachment; filename=' + 'TZST.apk');
		res.setHeader('Content-Disposition', 'attachment; filename=' + 'TZST.apk');
		res.setHeader('content-disposition', 'attachment; filename=' + 'TZST.apk');
		comfunction.sendFile('/mnt/apks/TZST.apk', res);
    });
	
    router.get('/privacy/apks/TZST.apk', function(req, res, extras){
        console.log('get privacy_apks url = ' + req.url);
        simpleResponse.printHeaders(req.headers, 'get privacy_apks');
		
		res.setHeader('Content-disposition', 'attachment; filename=' + 'TZST.apk');
		comfunction.sendFile('/mnt/apks/TZST.apk', res);
    });
	
    router.get('/privacy/apks/LRZZ.apk', function(req, res, extras){
        console.log('get privacy_apks url = ' + req.url);
        simpleResponse.printHeaders(req.headers, 'get privacy_apks');
		
		res.setHeader('Content-disposition', 'attachment; filename=' + 'LRZZ.apk');
		comfunction.sendFile('/mnt/apks/LRZZ.apk', res);
    });

};
