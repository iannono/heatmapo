class Site < ActiveRecord::Base
  validates_presence_of :width, :height, :name, :url
  validates_uniqueness_of :url

  def generate_img 
    width, height = ::HeatHandler.handle_site_and_return_size url
    self.width = width.to_i
    self.height = height.to_i

    if self.save
      true
    end 
  end
end
