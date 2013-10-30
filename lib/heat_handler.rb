module HeatHandler
  def handle_site site_url
    generate_phantomjs site_url 
    generate_site_img
    img_size = img_size site_url
  end

  # width*height
  def img_size site_url
    img_name = get_name(site_url)
    img_properites = get_properites(img_name) 
    fetch_size(img_properites)
  end


  def get_name site_url
    match = Regexp.new('(\w{3}\.\S+\.\w+)').match(site_url)
    if match
      match[1].split('.').join(_)
    end
  end

  def get_properites img_name
    r, w = IO.pipe
    system("file public/heatimg/#{img_name}")
    w.close
    img_properites = r.read 
    r.close 

    img_properites
  end

  def fetch_size img_properites
    
  end

  def generate_site_img
    system("phantomjs "  + js_path)
  end

  def generate_phantomjs site_url
    File.open(js_path, "wb") do |file|
      file.write(<<-EOF
        var page = require('webpage').create();
        page.open("#{site_url}", function(){
          page.render("public/heatimg/" + "www_baidu_com.png");
          phantom.exit();
        }); 
      EOF
      )
    end
  end

  def js_path
    File.expand_path("../../../public/temp/site.js", __FILE__)
  end 
end
