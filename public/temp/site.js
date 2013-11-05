          var page = require('webpage').create();
          page.open("http://www.whst.gov.cn", function(){
            page.render("public/heatimg/" + "www.whst.gov.cn.png");
            phantom.exit();
          }); 
