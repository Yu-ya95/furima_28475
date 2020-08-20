require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上の半角英数混合であれば登録できる' do
          @user.password = '123abc'
          @user.password_confirmation = '123abc'
          expect(@user).to be_valid
        end

        it 'last_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる' do
          @user.last_name = '漢字ひらがなカタカナ'
          expect(@user).to be_valid
        end

        it 'first_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる' do
          @user.first_name = '漢字ひらがなカタカナ'
          expect(@user).to be_valid
        end

        it 'last_name_kanaが全角(カタカナ)であれば登録できる' do
          @user.last_name_kana = 'カタカナ'
          expect(@user).to be_valid
        end

        it 'first_name_kanaが全角(カタカナ)であれば登録できる' do
          @user.first_name_kana = 'カタカナ'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'last_nameが空では登録できない' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'first_nameが空では登録できない' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'birthdayが空では登録できない' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '123ab'
          @user.password_confirmation = '123ab'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが半角数字のみでは登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'passwordが半角英字のみでは登録できない' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'passwordが全角英数混合では登録できない' do
          @user.password = '１1ａa０0'
          @user.password_confirmation = '１1ａa０0'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailに@が含まれていなければ登録できない' do
          @user.email = 'abcde.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'last_nameが全角(漢字・ひらがな・カタカナ)以外であれば登録できない' do
          @user.last_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name Full-width characters')
        end

        it 'first_nameが全角(漢字・ひらがな・カタカナ)以外であれば登録できない' do
          @user.first_name = '123'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name Full-width characters')
        end

        it 'last_name_kanaが全角(カタカナ)以外であれば登録できない' do
          @user.last_name_kana = '漢字'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
        end

        it 'last_name_kanaが半角であれば登録できない' do
          @user.last_name_kana = 'ｶﾀｶﾅ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
        end

        it 'first_name_kanaが全角(カタカナ)以外であれば登録できない' do
          @user.first_name_kana = 'ひらがな'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
        end

        it 'first_name_kanaが半角であれば登録できない' do
          @user.first_name_kana = 'ｶﾀｶﾅ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
        end
      end
    end
  end
end
