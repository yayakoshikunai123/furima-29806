require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "空がなければ登録できること" do
        expect(@order_address).to be_valid
      end 

      it "建物以外に空がなければ登録できること" do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空では登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空では登録できない" do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end

      it "郵便番号が『⚪︎⚪︎⚪︎-⚪︎⚪︎⚪︎⚪︎』の数字でないと登録できない" do
        @order_address.zip_code = "1234-567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code 正しく入力してください")
      end

      it "郵便番号に『ー（ハイフン）』が含まれていないと登録できない" do
        @order_address.zip_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code 正しく入力してください")
      end

      it "都道府県が『ーー』だと登録できない" do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end

      it "都道府県が『１』を選択している状態だと登録できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end

      it "市町村が空では登録できない"  do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空では登録できない" do
        @order_address.street_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end

      it "電話番号が空では登録できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号は半角数字でないと登録できない" do
        @order_address.phone_number = "abcdefghijk"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number 半角数字で入力してください")
      end

      it "電話番号は11桁以内でないと登録できない" do
        @order_address.phone_number = "000000000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number 半角数字で入力してください")
      end    
    end
  end
end
