module HeatHandler

  class << self 
    def generate_heatpoint_img site_url 
      size = handle_site_and_return_size site_url

    end
    # Used to generate the whole site's img by phantomJS
    # return the size(array) of the generate img
    #   #=> ["700", "450"]
    def handle_site_and_return_size site_url
      generate_site_img site_url
      size = img_size(get_name site_url)
    end

    def img_size img_name
      img_properites = get_properites(img_name) 
      fetch_size(img_properites)
    end 

    def get_name site_url 
      site_url =~ /(\w{3}\.\S+\.\w+)/
      $1 + ".png"
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

    def generate_site_img site_url
      generate_site_img_js site_url
      system("phantomjs "  + js_path("site_img.js")) 
    end

    def generate_heats_img site_url
      generate_heats_img_js site_url
      system("phantomjs "  + js_path("heats_img.js")) 
    end

    
    def generate_site_img_js site_url
      File.open(js_path("site_img.js"), "w") do |file|
        file.write(<<-EOF
          var page = require('webpage').create();
          page.open("#{site_url}", function(){
            page.render("public/heatimg/" + "#{get_name(site_url)}");
            phantom.exit();
          }); 
        EOF
        )
      end
    end 

    def generate_heats_img_js site_url
      File.open(js_path("heats_img.js"), "w") do |file|
        file.write(<<-EOF
          var page = require('webpage').create();
          page.open("lib/site_heat_generator.html", function(){
            page.render("public/heatimg/" + "#{get_name(site_url)}");
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
