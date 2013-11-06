          var page = require('webpage').create();
          page.open("http://www.douban.com", function(){
            page.render("public/heatimg/" + "www.douban.com.png");
            phantom.exit();
          }); 
