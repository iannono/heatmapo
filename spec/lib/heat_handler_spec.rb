require "lib/heat_handler"
require 'spec_helper'

describe HeatHandler do
  let(:properites) { "public/heatimg/www.baidu.com.png: PNG image data, 720 x 455, 8-bit/color RGBA, non-interlaced" }
  let(:url) { "http://www.baidu.com" }

  it "can get name from site url" do
    expect(HeatHandler.get_name url).to eq "www.baidu.com.png"
    expect(HeatHandler.get_name "http://www.whst.gov.cn").to eq "www.whst.gov.cn.png"
    expect(HeatHandler.get_name "www.whst.gov.cn").to eq "www.whst.gov.cn.png"
  end

  it "can get properites from img file" do
    expect(HeatHandler.get_properites "www.baidu.com.png").to eq properites
  end

  it "can get size from img properites" do 
    expect(HeatHandler.fetch_size properites).to eq ["720", "455"]
  end

  it "can fetch size from site url" do
    expect(HeatHandler.handle_site_and_return_size url).to eq ["720", "455"]
  end
end
