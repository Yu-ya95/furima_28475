require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  describe '#create' do
    before do
      @purchase_information = FactoryBot.build(:purchase_information)
    end

    describe '商品購入機能' do
      context '配送先情報登録が上手くいく時' do
        it 'postcode、prefecture_id、city、block、building、phone_numberが存在すれば登録できる' do
          expect(@purchase_information).to be_valid
        end

        it 'buildはなくても登録できる' do
          @purchase_information.building = ''
          expect(@purchase_information).to be_valid
        end

        it 'postcodeはハイフン含む3桁-4桁の7桁の半角数字であれば登録できる' do
          @purchase_information.postcode = '111-2222'
          expect(@purchase_information).to be_valid
        end

        it 'prefecture_idは1でなければ登録できる' do
          @purchase_information.prefecture_id = 3
          expect(@purchase_information).to be_valid
        end

        it 'phone_numberはハイフンなしの10または11桁の半角数字であれば登録できる' do
          @purchase_information.phone_number = '1234567890'
          expect(@purchase_information).to be_valid
        end
      end

      context '配送先情報登録が上手くいかない時' do
        it 'postcodeが空の時' do
          @purchase_information.postcode = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include "Postcode can't be blank"
        end

        it 'prefecture_idが1の時' do
          @purchase_information.prefecture_id = 1
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include 'Prefecture Select'
        end

        it 'cityが空の時' do
          @purchase_information.city = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include "City can't be blank"
        end

        it 'blockが空の時' do
          @purchase_information.block = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include "Block can't be blank"
        end

        it 'phone_numberが空の時' do
          @purchase_information.phone_number = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include "Phone number can't be blank"
        end

        it 'postcodeにハイフンが含まれない時' do
          @purchase_information.postcode = '1234567'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include 'Postcode is invalid'
        end

        it 'postcodeが3桁-4桁でない時' do
          @purchase_information.postcode = '12-34567'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include 'Postcode is invalid'
        end

        it 'postcodeが全角数字の時' do
          @purchase_information.postcode = '１２３-４５６７'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include 'Postcode is invalid'
        end

        it 'phone_numberにハイフンが含まれる時' do
          @purchase_information.phone_number = '090-1234567'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include 'Phone number is invalid'
        end

        it 'phone_numberが10桁未満の時' do
          @purchase_information.phone_number = '123456789'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include 'Phone number is invalid'
        end

        it 'phone_numberが全角数字の時' do
          @purchase_information.phone_number = '０９０１２３４５６７８'
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include 'Phone number is invalid'
        end

        it 'トークンが空の時' do
          @purchase_information.token = nil
          @purchase_information.valid?
          expect(@purchase_information.errors.full_messages).to include "Token can't be blank"
        end
      end
    end
  end
end
