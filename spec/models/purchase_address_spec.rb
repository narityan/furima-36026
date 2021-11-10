require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号が空だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Post code can't be blank"
      end
      it '郵便番号にーがないと購入できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Post code is invalid"
      end
      it '都道府県が1だと購入できない' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '都道府県が空だと購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture is not a number"
      end
      it '市区町村がないと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end
      it '電話番号がないと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号にーがあると購入できない' do
        @purchase_address.phone_number = '090-0000-0000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '番地が空では購入できない' do
        @purchase_address.house_name = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "House name can't be blank"
      end
      it '電話番号が9桁以下では購入できない' do
        @purchase_address.phone_number = '090000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が12桁以上では購入できない' do
        @purchase_address.phone_number = '090000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @purchase_address.phone_number = '0900000000０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'userが紐付いていなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていなければ購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
