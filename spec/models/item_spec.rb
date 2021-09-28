require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include { "Image can't be blank" }
      end

      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it '商品の説明が必須であること' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Introduction can't be blank"
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'カテゴリーが１だと保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態についての情報が必須であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '商品の状態が１だと保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '配送料の負担についての情報が必須であること' do
        @item.payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Payer can't be blank"
      end

      it '配送料の負担が１だと保存できない' do
        @item.payer_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Payer can't be blank"
      end

      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送元の地域が１だと保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送までの日数についての情報が必須であること' do
        @item.preparation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparation can't be blank"
      end

      it '発送までの日数が１だと保存できない' do
        @item.preparation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparation can't be blank"
      end

      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '売価格は、¥300未満は保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price out of setting range'
      end

      it '売価格は、¥9,999,999より上はみ保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price out of setting range'
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price out of setting range'
      end

      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
