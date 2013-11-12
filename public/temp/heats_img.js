          var page = require('webpage').create();
          page.open("lib/site_heat_generator.html", function(){
            page.render("public/heatimg/" + "www.baidu.com.png");
            phantom.exit();
          }); 
