class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_source_area
  belongs_to_active_hash :product_status

  validates :image, :expanation, :price, :product_name, :category, :product_status, :shipping_day, :shipping_fee_burden, :shipping_source_area, presence: true 
           
  has_one_attached :image

  belongs_to :user

  with_options numericality:   { other_than: 1 } do
    validates :category_id, :product_status_id, :shipping_day_id, :shipping_fee_burden_id, :shipping_source_area_id, :product_status_id
  end
end
