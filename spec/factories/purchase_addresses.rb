FactoryBot.define do
  factory :purchase_address do
    post_code       { '123-4567' }
    prefecture_id   { 2 }
    city            { '札幌市緑区' }
    house_name      { '青山１−１−１' }
    building_name   { 'マンション' }
    phone_number    { '09000000000' }
    token           { "tok_abcdefghijk00000000000000000" }
  end
end
