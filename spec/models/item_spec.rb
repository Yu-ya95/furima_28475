require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    describe '商品出品機能' do
      context '出品がうまくいくとき' do
        it 'name、item_text、category_id、status_id、postage_id、prefecture_id、shipping_id、priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end

        it 'category_idの値が2~11であれば登録できる' do
          @item.category_id = 10
          expect(@item).to be_valid
        end

        it 'status_idの値が2~7であれば登録できる' do
          @item.status_id = 6
          expect(@item).to be_valid
        end

        it 'postage_idの値が2~3であれば登録できる' do
          @item.postage_id = 2
          expect(@item).to be_valid
        end

        it 'prefecture_idの値が2~48であれば登録できる' do
          @item.prefecture_id = 47
          expect(@item).to be_valid
        end

        it 'shipping_idの値が2~4であれば登録できる' do
          @item.shipping_id = 3
          expect(@item).to be_valid
        end

        it 'priceが300~9999999の間であれば登録できる' do
          @item.price = 300
          expect(@item).to be_valid
        end
      end

      context '出品がうまくいかないとき' do
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'item_textが空では登録できない' do
          @item.item_text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item text can't be blank")
        end

        it 'category_idが1では登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category id Select')
        end

        it 'status_idが1では登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status id Select')
        end

        it 'postage_idが1では登録できない' do
          @item.postage_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Postage id Select')
        end

        it 'prefecture_idが1では登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture id Select')
        end

        it 'shipping_idが1では登録できない' do
          @item.shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping id Select')
        end

        it 'priceが空では登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range, Half-width number')
        end

        it 'priceが全角数字では登録できない' do
          @item.price = '１０００００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range, Half-width number')
        end

        it 'preceが300未満では登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range, Half-width number')
        end

        it 'priceが10000000以上では登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range, Half-width number')
        end
      end
    end
  end
end
