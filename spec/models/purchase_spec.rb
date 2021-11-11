require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '購入機能' do
    context '購入できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@purchase).to be_valid
      end
    end

    context '購入ができない時' do
      it '郵便番号が必須であること' do
        @purchase.post_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include { "Post code can't be blank" }
      end
    end
  end
end
