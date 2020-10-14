FactoryBot.define do
  factory :order_address do
    token                 {"tok_abcdefghijk00000000000000000"}
    zip_code              {"012-1234"}
    prefecture_id         {2}
    city                  {"tokyo"}
    street_address        {"1-2"}
    building_name         {"yanagi"}
    phone_number          {"01234567890"}
  end
end
