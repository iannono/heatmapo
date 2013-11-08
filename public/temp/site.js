          var page = require('webpage').create();
          page.open("http://www.hbzfhcxjst.gov.cn/SiteTempHTML/c1faf278-6f51-4ca7-80c2-e5ff4c0dcb1c_homepage_chinese.htm", function(){
            page.render("public/heatimg/" + "www.hbzfhcxjst.gov.cn/SiteTempHTML/c1faf278-6f51-4ca7-80c2-e5ff4c0dcb1c_homepage_chinese.htm.png");
            phantom.exit();
          }); 
