require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname,email,password,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it '重複したemailが存在すれば登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが英字だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordが６文字以下では登録出来ない' do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameに半角が含まれていると登録出来ない' do
      @user.last_name = 'お試ｼ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameに半角が含まれていると登録出来ない' do
      @user.first_name = 'お試し?'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaに平仮名が含まれていると登録出来ない' do
      @user.last_name_kana = 'テスと'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
    it 'last_name_kanaに漢字が含まれていると登録出来ない' do
      @user.last_name_kana = 'テスト試'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
    it 'last_name_kanaに半角が含まれていると登録出来ない' do
      @user.last_name_kana = 'テスﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
    it 'first_name_kanaが空では登録出来ない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaに平仮名が含まれていると登録出来ない' do
      @user.first_name_kana = 'テスと'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'first_name_kanaに漢字が含まれていると登録出来ない' do
      @user.first_name_kana = 'テスト試'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'first_name_kanaに半角が含まれていると登録出来ない' do
      @user.first_name_kana = 'テスﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'birthdayが空では登録出来ない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
