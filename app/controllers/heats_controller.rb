class HeatsController < ApplicationController

  def create
    @heat = Heat.create(heat_params)
    render json: @heat
  end

  def index
    @heats = Heat.all
    @skewing_x = 1002
    generate_siteimg "www.google.com"
  end

  private
  def heat_params
    params.require(:heat).permit(:xpoint, :ypoint)
  end

  def generate_siteimg site_url
    generate_phantomjs site_url
    IO.popen ("phantomjs "  + File.expand_path("../../../public/temp/site.js", __FILE__))
  end

  def generate_phantomjs site_url
    File.open(File.expand_path("../../../public/temp/site.js", __FILE__), "wb") do |file|
      file.write(<<-EOF
        var page = require('webpage').create();
        page.open("#{site_url}", function(){
          page.render('www_whst_gov_cn1.png');
          phantom.exit();
        }) 
      EOF
      )
    end
  end
end
