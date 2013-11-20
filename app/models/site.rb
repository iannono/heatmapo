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

class Site < ActiveRecord::Base
  validates_presence_of :width, :height, :name, :url
  validates_uniqueness_of :url

  has_many :heats 

  # used to generate site's img
  # when first call .handle_site_and_return_size, it generate the site's img
  # when sencond call, it add the heatpoint to the img with js in the browser
  # and then generate the img again
  def generate_img bare_view_url
    width, height = ::HeatHandler.handle_site_and_return_size url, self.site_name 
    self.width = width.to_i
    self.height = height.to_i
    self.save
    ::HeatHandler.handle_site_and_return_size bare_view_url, self.site_name 
    true
  end 

  def site_name
    ::HeatHandler.fetch_site_name url
  end

  def img_name
    (::HeatHandler.fetch_site_name url) + ".png"
  end
end
