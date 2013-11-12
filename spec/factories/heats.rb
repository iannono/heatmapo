
require 'faker'

FactoryGirl.define do
  factory :heat do
    xpoint 100
    ypoint 200
    screen_ratio "1002*700" 
    site_id 1 
  end
end
