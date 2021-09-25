class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :preparation

  with_options presence: true do
    validates :item_name
    validates :introduction
    validates :price,         numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "範囲外です"}, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality:{ other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :payer_id
    validates :prefecture_id
    validates :preparation_id
  end
end
