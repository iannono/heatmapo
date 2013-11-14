# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  width      :integer          default(0)
#  height     :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Site do

  it "is valid with name, url, width and height" do
    expect(build :site).to be_valid
  end

  it "is invalid without name" do
    site = build(:site, name: nil)
    expect(site).to have(1).errors_on(:name)
  end

  it "is invalid without url" do
    site = build(:site, url: nil)
    expect(site).to have(1).errors_on(:url) 
  end

  it "is invalid without width" do
    site = build(:site, width: nil)
    expect(site).to have(1).errors_on(:width) 
  end

  it "is invalid without height" do
    site = build(:site, height: nil)
    expect(site).to have(1).errors_on(:height) 
  end 

  it "is invalid with a duplicate url" do
    create(:site, url: "http://www.baidu.com")
    site = build(:site, url: "http://www.baidu.com")
    expect(site).to have(1).errors_on(:url) 
  end

  it "get img_name with png" do
    site = build(:site, url: "http://www.baidu.com/index.html")
    expect(site.img_name).to eq ("www.baidu.com.png")
  end

  it "get correct site_name" do
    site = build(:site, url: "http://www.baidu.com/index.html")
    expect(site.site_name).to eq ("www.baidu.com")
  end

  it "does change the site's width and height" do
    site = create :site, width: 0, height: 0

    expect(HeatHandler).to receive(:handle_site_and_return_size)
                            .exactly(2).times
                            .and_return(["700", "455"])

    site.reload
    expect(site.generate_img site.url).to eq true
    expect(site.width).to eq 700
    expect(site.height).to eq 455
  end

end
