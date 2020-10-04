FactoryBot.define do
  factory :item do
    product_name                    { Faker::Name.initials(number: 2) }
    category_id                     { 2 }
    price                           { 1000 }
    expanation                      { Faker::Name.initials(number: 10) }
    product_status_id               { 2 }
    shipping_fee_burden_id          { 2 }
    shipping_source_area_id         { 2 }
    shipping_day_id                 { 2 }
    image                           { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    association :user
  end
end