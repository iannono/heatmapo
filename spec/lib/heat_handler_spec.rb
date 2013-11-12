require 'spec_helper'

describe HeatHandler do
  let(:properites) { "public/heatimg/www.baidu.com.png: PNG image data, 720 x 455, 8-bit/color RGBA, non-interlaced" }
  let(:url) { "http://www.baidu.com" }

  it "gets name from site url" do
    expect(HeatHandler.img_name url, ".png").to eq "www.baidu.com.png"
    expect(HeatHandler.img_name "http://www.whst.gov.cn", ".png").to eq "www.whst.gov.cn.png"
    expect(HeatHandler.img_name "www.whst.gov.cn", ".png").to eq "www.whst.gov.cn.png"
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
    site = create(:site, url: url)
    HeatHandler.generate_heats_img site.url
    expect(File.file? "public/heatimg/www.baidu.com.heats.png").to eq true
    File.delete "public/heatimg/www.baidu.com.heats.png"
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

end
