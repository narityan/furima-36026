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
    validates :category_id,   numericality: { other_than: 1 , message: "can't be blank"}
    validates :condition_id,  numericality: { other_than: 1 , message: "can't be blank"}
    validates :payer_id,      numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :preparation_id
    validates :price,         numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "範囲外です"}
  end
end
