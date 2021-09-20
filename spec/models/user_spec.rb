require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "全ての項目が入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do 
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "同じemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに@がないと登録できない" do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空だと登録できない" do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが５文字以下だと登録できない" do
        @user.password = 'aaaaa'  
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが数字がないと登録できない" do
        @user.password = 'aaaaaaa'  
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it "passwordが英語がないと登録できない" do
        @user.password = '1234567'  
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it "passwordの数字が半角でないと登録できない" do
        @user.password = 'hankaku１２３４'  
        @user.password_confirmation = 'hankaku１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it "passwordの英語が半角でないと登録できない" do
        @user.password = 'ｚｅｎｎｋａｋｕ1234'  
        @user.password_confirmation = 'ｚｅｎｎｋａｋｕ1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it "passwordとpassword_confirmationが一致しない場合は登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it "first_nameが全角でないと登録できない" do
        @user.first_name = 'hankaku'  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end
      it "family_nameが全角でないと登録できない" do
        @user.family_name = 'hankaku'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid. Input full-width characters."
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it "first_name_kanaが全角（カタカナ）でないと登録できない" do
        @user.first_name_kana = 'やまだ'  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "family_name_kanaが全角（カタカナ）でないと登録できない" do
        @user.family_name_kana = 'たろう'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end
      it "birth_dateが空だと登録できない" do
        @user.birth_date = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
