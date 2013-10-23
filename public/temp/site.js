        var page = require('webpage').create();
        page.open("www.google.com", function(){
          page.render('www_whst_gov_cn1.png');
          phantom.exit();
        }) 
