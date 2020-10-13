class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, 
                :zip_code, :prefecture_id, :city, :street_address, :building_name, :phone_number
  
  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '正しく入力してください' }
    validates :city
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :street_address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: '半角数字で入力してください' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(
      zip_code: zip_code, prefecture_id: prefecture_id, city:city, street_address: street_address,
      building_name: building_name, phone_number: phone_number , order_id: order.id
     )
  end
end
