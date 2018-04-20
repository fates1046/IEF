var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.sendFile(path.join(__dirname, '../public', 'index.html'))
});

router.get('/test', function(req,res){
    res.send('test');
});

module.exports = router;
