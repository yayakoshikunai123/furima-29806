require 'rails_helper'
RSpec.describe Item, type: :model do
  before do 
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'image,product_name,expanation,category,product_status,shipping_fee_burden,shipping_source_area,shipping_day,priceがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.expanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Expanation can't be blank")
      end
      it 'カテゴリーの値が１だと出品できない' do
        @item.category_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の値が1だと出品できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status must be other than 1")
      end
      it '配送料の負担が1だと出品できない' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
      end
      it '発送元の地域が1だと出品できない' do
        @item.shipping_source_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping source area must be other than 1")
      end
      it '発送までの日数が1だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it '販売価格が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が1000000円以上だと登録できない' do
        @item.price =10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it '販売価格が299円以下だと登録できない' do
        @item.price =299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
    end
  end
end