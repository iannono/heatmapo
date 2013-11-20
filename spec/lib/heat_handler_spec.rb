require 'spec_helper'

describe HeatHandler do
  let(:properites) { "public/heatimg/www.whst.gov.cn.png: PNG image data, 1002 x 1490, 8-bit/color RGBA, non-interlaced" }
  let(:url) { "http://www.whst.gov.cn" }

  it "gets name from site url" do
    expect(HeatHandler.fetch_site_name url).to eq "www.whst.gov.cn"
    expect(HeatHandler.fetch_site_name "http://www.whst.gov.cn").to eq "www.whst.gov.cn"
    expect(HeatHandler.fetch_site_name "www.whst.gov.cn").to eq "www.whst.gov.cn"
    expect(HeatHandler.fetch_site_name "http://www.baidu.com/another/index.html").to eq "www.baidu.com"
  end 

  it "generate site img js" do
    HeatHandler.generate_site_img_js url, "www.baidu.com"
    expect(File.file? "public/temp/www.baidu.com.js").to eq true
    File.delete "public/temp/www.baidu.com.js"
  end 

  it "generate site img" do
    HeatHandler.generate_site_img url, "www.whst.gov.cn"
    expect(File.file? "public/heatimg/www.whst.gov.cn.png").to eq true
    File.delete "public/heatimg/www.whst.gov.cn.png"
  end 

  it "gets properites from img file" do
    HeatHandler.generate_site_img url, "www.whst.gov.cn"
    expect(HeatHandler.get_properites "www.whst.gov.cn.png").to match(/www.whst.gov.cn.png/)
    File.delete "public/heatimg/www.whst.gov.cn.png"
  end

  it "gets size from img properites" do 
    expect(HeatHandler.fetch_size properites).to eq ["1002", "1490"]
  end

  it "fetches size from site url" do
    expect(HeatHandler.handle_site_and_return_size url, "www.whst.gov.cn").to eq ["1002", "1490"]
  end

  it "generate site img with heat point" do
    HeatHandler.handle_site_and_return_size "http://localhost:80/sites/3/bare_view", "bare_view"
    
    expect(File.file? "public/heatimg/bare_view.png").to eq true
  end

end
