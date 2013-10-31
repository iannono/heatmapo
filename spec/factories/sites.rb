# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site do
    name "baidu"
    url "http://www.baidu.com"
    width "720"
    height "455"
  end
end
