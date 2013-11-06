class Site < ActiveRecord::Base
  validates_presence_of :width, :height, :name, :url
  validates_uniqueness_of :url

  has_many :heats

  def generate_img 
    width, height = ::HeatHandler.handle_site_and_return_size url
    #width, height = ["700", "455"]
    self.width = width.to_i
    self.height = height.to_i

    if self.save
      true
    end 
  end

  def img_name
    ::HeatHandler.get_name url
  end
end
