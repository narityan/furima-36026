class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :payer_id
    validates :prefecture_id
    validates :preparation_id
    validates :price
  end
end
