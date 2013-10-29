class HeatsController < ApplicationController

  def create
    @heat = Heat.create(heat_params)
    render json: @heat
  end

  def index
    @heats = Heat.all
    @skewing_x = 1002
    generate_siteimg "http://www.baidu.com"
  end

  private
  def heat_params
    params.require(:heat).permit(:xpoint, :ypoint)
  end

  def generate_siteimg site_url
    generate_phantomjs site_url
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
