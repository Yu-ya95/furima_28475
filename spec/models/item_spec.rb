require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    describe '商品出品機能' do
      context '出品がうまくいくとき' do
        it 'name、item_text、category_code、status_code、postage_code、prefecture_code、delivery_days_code、priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end

        it 'category_codeの値が2~11であれば登録できる' do
          @item.category_code = 10
          expect(@item).to be_valid
        end

        it 'status_codeの値が2~7であれば登録できる' do
          @item.status_code = 6
          expect(@item).to be_valid
        end

        it 'postage_codeの値が2~3であれば登録できる' do
          @item.postage_code = 2
          expect(@item).to be_valid
        end

        it 'prefecture_codeの値が2~48であれば登録できる' do
          @item.prefecture_code = 47
          expect(@item).to be_valid
        end

        it 'delivery_days_codeの値が2~4であれば登録できる' do
          @item.delivery_days_code = 3
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

        it 'category_codeが1では登録できない' do
          @item.category_code = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category code Select')
        end

        it 'status_codeが1では登録できない' do
          @item.status_code = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status code Select')
        end

        it 'postage_codeが1では登録できない' do
          @item.postage_code = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Postage code Select')
        end

        it 'prefecture_codeが1では登録できない' do
          @item.prefecture_code = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture code Select')
        end

        it 'delivery_days_codeが1では登録できない' do
          @item.delivery_days_code = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery days code Select')
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
