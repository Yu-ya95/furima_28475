class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :purchase

  validates :postcode, :prefecture_id, :city, :block, :phone_number, presence: true
  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
end
