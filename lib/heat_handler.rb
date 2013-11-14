module HeatHandler

  class << self 
    # Used to generate the whole site's img by phantomJS
    # return the size(array) of the generate img
    #   #=> ["700", "450"]
    def handle_site_and_return_size site_url, img_name
      generate_site_img site_url, img_name
      size = img_size(img_name << ".png") 
    end

    def img_size img_name
      img_properites = get_properites(img_name) 
      fetch_size(img_properites)
    end 

    def fetch_site_name site_url
      site_url =~ /(\w{3}\.\S+\.(cn|com|net))/
      $1
    end 

    def get_properites img_name 
      img_properites = `file public/heatimg/#{img_name}` 
      img_properites.strip
    end

    def fetch_size img_properites 
      img_properites =~ /,\s(\d+\sx\s\d+),/
      size = $1.split " "
      [size[0], size[2]]
    end 

    def generate_site_img site_url, img_name 
      js_name = img_name + ".js"
      generate_site_img_js site_url, img_name
      system("phantomjs "  + js_path(js_name)) 
    end 
    
    def generate_site_img_js site_url, img_name
      File.open(js_path(img_name + ".js"), "w") do |file|
        file.write(<<-EOF
          var page = require('webpage').create();
          page.open("#{site_url}", function(){
            page.render("public/heatimg/" + "#{img_name + ".png"}");
            phantom.exit();
          }); 
        EOF
        )
      end
    end 

    def js_path name
      File.expand_path("../../public/temp/#{name}", __FILE__)
    end 
  end
end
