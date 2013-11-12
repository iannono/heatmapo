require 'spec_helper'

describe HeatHandler do
  let(:properites) { "public/heatimg/www.baidu.com.png: PNG image data, 720 x 455, 8-bit/color RGBA, non-interlaced" }
  let(:url) { "http://www.baidu.com" }

  it "gets name from site url" do
    expect(HeatHandler.get_name url).to eq "www.baidu.com.png"
    expect(HeatHandler.get_name "http://www.whst.gov.cn").to eq "www.whst.gov.cn.png"
    expect(HeatHandler.get_name "www.whst.gov.cn").to eq "www.whst.gov.cn.png"
  end

  it "generate site img js" do
    HeatHandler.generate_site_img_js url
    expect(File.file? "public/temp/site_img.js").to eq true
  end 

  it "generate heats img js" do
    HeatHandler.generate_heats_img_js url
    expect(File.file? "public/temp/heats_img.js").to eq true
  end

  it "generate site img" do
    HeatHandler.generate_site_img url
    expect(File.file? "public/heatimg/www.baidu.com.png").to eq true
    File.delete "public/heatimg/www.baidu.com.png"
  end

  it "generate heats img" do
    #HeatHandler.generate_heats_img url
    #expect(File.file? "public/heatimg/www.baidu.com.heats.png").to eq true
    #File.delete "public/heatimg/www.baidu.com.png"
  end

  it "gets properites from img file" do
    HeatHandler.generate_site_img url
    expect(HeatHandler.get_properites "www.baidu.com.png").to eq properites
    File.delete "public/heatimg/www.baidu.com.png"
  end

  it "gets size from img properites" do 
    expect(HeatHandler.fetch_size properites).to eq ["720", "455"]
  end

  it "fetches size from site url" do
    expect(HeatHandler.handle_site_and_return_size url).to eq ["720", "455"]
  end

  it "generate site img by site_url"
  it "generate site img with heatpoint" do
    site = create(:site, url: url)
    HeatHandler.generate_heatpoint_img site.url
    expect(File.file? "public/heatimg/www.baidu.com.heats.png")
  end
  it "add heatpoint to site img and return the new img"

end
