class Site < ActiveRecord::Base
  validates_presence_of :width, :height, :name, :url
  validates_uniqueness_of :url
end
