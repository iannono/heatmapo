          var page = require('webpage').create();
          page.open("http://www.yichang.gov.cn/index.html", function(){
            page.render("public/heatimg/" + "www.yichang.gov.cn/index.html.png");
            phantom.exit();
          }); 
