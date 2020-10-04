class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category                
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_source_area
  belongs_to_active_hash :product_status

  with_options presence: true do
    validates :image              
    validates :product_name
    validates :expanation
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
  end

  has_one_attached :image

  belongs_to :user

  with_options numericality:   { other_than: 1 } do
    validates :category_id 
    validates :product_status_id
    validates :shipping_day_id
    validates :shipping_fee_burden_id
    validates :shipping_source_area_id
  end
end
