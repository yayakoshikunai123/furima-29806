FactoryBot.define do
  factory :order do
    token                 {"tok_abcdefghijk00000000000000000"}
    zip_code              {666-6666}
    prefecture_id         {2}
    city                  {"tokyo"}
    street_address        {"1-2"}
    phone_number          {"01234567890"}
  end
end
