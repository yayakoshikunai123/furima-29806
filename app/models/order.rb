class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  attr_accessor :token

  validates :token, presence: true

  belongs_to :user, optional: true
  belongs_to :item, optional: true
  has_one :address



end
