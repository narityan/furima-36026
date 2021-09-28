FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
    item_name         { '名前' }
    introduction      { '説明' }
    category_id       { 2 }
    condition_id      { 2 }
    payer_id          { 2 }
    prefecture_id     { 2 }
    preparation_id    { 2 }
    price             { 500 }
    association :user
  end
end
