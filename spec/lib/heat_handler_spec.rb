require 'spec_helper'

describe HeatHandler do
  let(:properites) { "public/heatimg/www.baidu.com.png: PNG image data, 720 x 455, 8-bit/color RGBA, non-interlaced" }
  let(:url) { "http://www.baidu.com" }

  it "gets name from site url" do
    expect(HeatHandler.fetch_site_name url).to eq "www.baidu.com"
    expect(HeatHandler.fetch_site_name "http://www.whst.gov.cn").to eq "www.whst.gov.cn"
    expect(HeatHandler.fetch_site_name "www.whst.gov.cn").to eq "www.whst.gov.cn"
  end

  it "generate site img js" do
    HeatHandler.generate_site_img_js url, "www.baidu.com"
    expect(File.file? "public/temp/www.baidu.com.js").to eq true
    File.delete "public/temp/www.baidu.com.js"
  end 

  it "generate site img" do
    HeatHandler.generate_site_img url, "www.google.com"
    expect(File.file? "public/heatimg/www.google.com.png").to eq true
    File.delete "public/heatimg/www.google.com.png"
  end 

  it "gets properites from img file" do
    HeatHandler.generate_site_img url, "www.baidu.com"
    expect(HeatHandler.get_properites "www.baidu.com.png").to eq properites
    File.delete "public/heatimg/www.baidu.com.png"
  end

  it "gets size from img properites" do 
    expect(HeatHandler.fetch_size properites).to eq ["720", "455"]
  end

  it "fetches size from site url" do
    expect(HeatHandler.handle_site_and_return_size url, "www.baidu.com").to eq ["720", "455"]
  end

  it "generate site img with heat point" do
    HeatHandler.handle_site_and_return_size "http://localhost:3000/sites/3/bare_view", "bare_view"
    
    expect(File.file? "public/heatimg/bare_view.png").to eq true
  end

end
