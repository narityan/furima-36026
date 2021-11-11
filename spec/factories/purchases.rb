FactoryBot.define do
  factory :purchase do
    post_code       { '123-456' }
    prefecture_id   { 2 }
    city            { '札幌市緑区' }
    house_name      { '青山１−１−１' }
    building_name   { 'マンション' }
    phone_number    { '09000000000' }
    association :user
    association :item
  end
end
