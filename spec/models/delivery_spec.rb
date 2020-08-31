require 'rails_helper'

RSpec.describe Delivery, type: :model do
  describe '#create' do
    before do
      @delivery = FactoryBot.build(:delivery)
    end

    describe '商品購入機能' do
      context '配送先情報登録が上手くいく時' do
        it 'postcode、prefecture_id、city、block、building、phone_numberが存在すれば登録できる' do
          expect(@delivery).to be_valid
        end

        it 'buildはなくても登録できる' do
          @delivery.building = ''
          expect(@delivery).to be_valid
        end

        it 'postcodeはハイフン含む3桁-4桁の7桁の半角数字であれば登録できる' do
          @delivery.postcode = '111-2222'
          expect(@delivery).to be_valid
        end

        it 'prefecture_idは1でなければ登録できる' do
          @delivery.prefecture_id = 3
          expect(@delivery).to be_valid
        end

        it 'phone_numberはハイフンなしの10または11桁の半角数字であれば登録できる' do
          @delivery.phone_number = '1234567890'
          expect(@delivery).to be_valid
        end
      end

      context '配送先情報登録が上手くいかない時' do
        it 'postcodeが空の時' do
          @delivery.postcode = nil
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include "Postcode can't be blank"
        end

        it 'prefecture_idが1の時' do
          @delivery.prefecture_id = 1
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include 'Prefecture Select'
        end

        it 'cityが空の時' do
          @delivery.city = nil
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include "City can't be blank"
        end

        it 'blockが空の時' do
          @delivery.block = nil
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include "Block can't be blank"
        end

        it 'phone_numberが空の時' do
          @delivery.phone_number = nil
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include "Phone number can't be blank"
        end

        it 'postcodeにハイフンが含まれない時' do
          @delivery.postcode = '1234567'
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include 'Postcode is invalid'
        end

        it 'postcodeが3桁-4桁でない時' do
          @delivery.postcode = '12-34567'
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include 'Postcode is invalid'
        end

        it 'postcodeが全角数字の時' do
          @delivery.postcode = '１２３-４５６７'
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include 'Postcode is invalid'
        end

        it 'phone_numberにハイフンが含まれる時' do
          @delivery.phone_number = '090-1234567'
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include 'Phone number is invalid'
        end

        it 'phone_numberが10桁未満の時' do
          @delivery.phone_number = '123456789'
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include 'Phone number is invalid'
        end

        it 'phone_numberが全角数字の時' do
          @delivery.phone_number = '０９０１２３４５６７８'
          @delivery.valid?
          expect(@delivery.errors.full_messages).to include 'Phone number is invalid'
        end
      end
    end
  end
end
