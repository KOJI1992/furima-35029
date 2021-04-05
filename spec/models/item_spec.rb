require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録機能' do
    context '商品が登録できる時' do
      it 'name,detail,category_id,quality_id,delivery_fee_id,prefecture_id,delivery_day_id,price,imageが存在していれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が登録出来ない時' do
      it 'nameが空では登録出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailが空では登録出来ない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'catedory_idが0では登録出来ない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'quality_idが0では登録出来ない' do
        @item.quality_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Quality Select')
      end
      it 'delivery_fee_idが0では登録出来ない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end
      it 'prefecture_idが0では登録出来ない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'delivery_dayが0では登録出来ない' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day Select')
      end
      it 'priceが空では登録出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角英数混合では登録出来ない' do
        @item.price = '10000a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが半角英語だけでは登録出来ない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが全角文字では登録出来ない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが300未満では登録出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9999999より高ければ登録出来ない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'userが紐づいてなければ登録出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像が空だと登録出来ない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
