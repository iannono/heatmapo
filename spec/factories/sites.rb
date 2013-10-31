# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :site do
    name "baidu"
    url "http://www.baidu.com"
    width "720"
    height "455"

    factory :invalid_site do
      url nil
    end
  end
end
