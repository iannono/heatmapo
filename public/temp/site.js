          var page = require('webpage').create();
          page.open("http://www.sample.com", function(){
            page.render("public/heatimg/" + "www.sample.com.png");
            phantom.exit();
          }); 
