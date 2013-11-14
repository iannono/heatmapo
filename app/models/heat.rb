# == Schema Information
#
# Table name: heats
#
#  id           :integer          not null, primary key
#  xpoint       :float
#  ypoint       :float
#  screen_ratio :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  site_id      :integer
#

class Heat < ActiveRecord::Base
  belongs_to :site 
end
