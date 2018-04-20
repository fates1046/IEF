var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
//var dbRouter = require('./routes/db');
//var syscallRouter = require('./routes/syscall');

var sql = require("mssql");
var bodyParser = require('body-parser');
const {spawn} = require("child_process");

const _active_mgr_cnt = 10;

var app = express();

// active manager list. 10 manager
var g_active_manager=[];
var g_today_date_idx = 0; // day count 

var db_config = {
    user: 'SA',
    password: 'F1rstPa55',
    server: '127.0.0.1',
    database: 'IEF',
    stream: true,
    options: {encrypt: true}
}

function get_today_dateno()
{
    sql.connect(db_config, function(err){
        var request = new sql.Request();
        request.stream = true;
        request.query('SELECT MAX(TDate) as MAX FROM IEF.dbo.ManagerFundHist');
        var result = {};

        request.on('row', function(row){
            g_today_date_idx = row.MAX;
        });
        request.on('done', function(returnValue){
            console.log("gmax:"+g_today_date_idx);
            sql.close();

        });
    });

}

function get_active_manager()
{
    g_active_manager = [];
    sql.close();    
    sql.connect(db_config, function(err){
        var request = new sql.Request();
        request.stream = true;
        request.query('SELECT MemIndex FROM IEF.dbo.ManagerFundHist WHERE TDate =' + g_today_date_idx);
        var result = {};

        request.on('row', function(row){
            g_active_manager.push( row.MemIndex );
        });
        request.on('done', function(returnValue){
            console.log(g_active_manager);
            sql.close();

        });
    });

}


// get Score of active managerperformance graph.
app.get("/db/getScore", function(req, res){

  if(g_today_date_idx==0) get_today_dateno();
  if(g_active_manager.length < _active_mgr_cnt) get_active_manager();

  sql.close();
  sql.connect(db_config, function(err){
      
      for(i=0; i< active_manager.length; i++)
     {
          var request = new sql.Request();
          request.stream = true;
          request.query('SELECT * FROM IEF.dbo.ManagerFundHist where Memindex=' + active_manager[i] + 'order by TDate');
          var result = {};

          request.on('row', function(row){
              console.log(row);   
              //result[row.id] = {name: row.name, quantity: row.quantity};

          });
          request.on('done', function(returnValue){
              //console.log(result);
              sql.close();
              //res.json(result);

          });
  
     } 
  });
  next();

});



app.get("/api/db", function(req, res){

  sql.connect(db_config, function(err){
      var request = new sql.Request();
      request.stream = true;
      request.query('SELECT * FROM Inventory');
      var result = {};

      request.on('row', function(row){
          result[row.id] = {name: row.name, quantity: row.quantity};

      });
      request.on('done', function(returnValue){
          console.log(result);
          sql.close();
          res.json(result);

      });
  });
  next();

});


app.use(require('connect-history-api-fallback')());

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
//app.use('/db/',dbRouter);
//app.use('/syscall/',syscallRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
