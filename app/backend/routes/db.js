var express = require("express");
var sql = require("mssql");
var bodyParser = require('body-parser');
const {spawn} = require("child_process");

const _active_mgr_cnt = 10;

// active manager list. 10 manager
var g_active_manager=[];
var g_today_date_idx = 0; // day count 

var db_config = {
    user: 'sa',
    password: 'F1rstPa55',
    server: '127.0.0.1',
    database: 'IEF',
    stream: true,
    options: {encrypt: true}
}

function update_user()
{
    console.log("update user");
    // if no manager updated
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

            

}


function get_today_dateno()
{

    console.log("get_today");
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

var router = express.Router();



// get 5year data for performance graph.
router.get("/getPerfGraph5y", function(req, res){

    if(g_today_date_idx==0) get_today_dateno();
    if(active_manager.length < _active_mgr_cnt) get_active_manager();

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


});



// get Score of active managerperformance graph.
router.get("/getScore", function(req, res){
    rest.send("/db/getScore");
//    if(g_today_date_idx==0) get_today_dateno();
 //   if(active_manager.length < _active_mgr_cnt) get_active_manager();
/*
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
*/

});



router.get("/api", function(req, res){

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


});

module.exports = router;
