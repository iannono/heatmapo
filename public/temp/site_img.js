          var page = require('webpage').create();
          page.open("http://www.baidu.com", function(){
            page.render("public/heatimg/" + "www.baidu.com.png");
            phantom.exit();
          }); 
