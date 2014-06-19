/**
 * Created by Administrator on 2014/5/30.
 */

var http = require('http');
var router = require('node-simple-router').newSimpleRouter();
var modules = require('ixming-modules-util');
var simpleResponse = modules.SimpleJsonResponse;
var responseCodes = simpleResponse.CODES;
var fs = require('fs');
var fsutil = require('ixming-base').FileUtil;

var serverConfig = {
	port : 8089
};

fs.readdir('./modules', function(err, files) {
    for (index in files) {
        var fileName = files[index];
        if (fsutil.isDir('./modules/' + fileName)) {
            // load modules
            var module = require('./modules/' + fileName);
            if (module.hasOwnProperty('registerRoute')) {
                module.registerRoute(router);
            } else {
                console.log('模块 [ ' + fileName +' ] 没有注册route');
            }
        }
    }

    // 注册route后，开启服务
    startServer(router);
});

router.unKnownRoute(function(req, res, extras) {
    console.log('unKnownRoute extras = ' + extras);
    error404(req, res);
});

router.unKnownMethod(function(req, res, extras) {
    console.log('unKnownMethod extras = ', extras);
    unKnownMethod(req, res, extras);
});


// start server and make sure that it'll always restart
function startServer(callback) {
    http.createServer(callback).listen(serverConfig.port)
		.on('error', function(e){
			console.log('error: ' + e);
		})
        .on('close', function() {
            console.log('close');
            startServer(callback);
        });
}

// common error - unknown method
function unKnownMethod(req, res, extras) {
    res.writeHead(500, {'content-type': 'application/json'});
    var responseContent = simpleResponse.asSimpleJson(500, '无法识别的请求方法：' + (extras || '-'));
    console.log(responseContent);
    res.write(responseContent);
    res.end();
};

// common error 404
function error404(req, res, extras) {
    res.writeHead(404, {'content-type': 'application/json'});
    var responseContent = simpleResponse.asSimpleJson(404, '没有此接口');
    res.write(responseContent);
    res.end();
};