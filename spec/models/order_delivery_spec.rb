require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品を購入することができる' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_delivery.building = ""
        expect(@order_delivery).to be_valid
      end
    end
    context '商品を購入することができない' do
      it 'postal_codeが空では購入出来ない' do
        @order_delivery.postal_code = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがなければでは購入出来ない' do
        @order_delivery.postal_code = "1234567"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_idが０では購入できない' do
        @order_delivery.prefecture_id = 0
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空では購入出来ない' do
        @order_delivery.city = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入出来ない' do
        @order_delivery.address = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では購入出来ない' do
        @order_delivery.telephone_number = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが数字でなければ購入出来ない' do
        @order_delivery.telephone_number = "abc"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone number Input only number")
      end
      it 'telephone_numberが11字以上では購入出来ない' do
        @order_delivery.telephone_number = "111111111111"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Telephone number Input only number")
      end
      it 'userが紐づいてなければ登録出来ない' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいてなければ登録出来ない' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end