class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :name, :item_text, :image, :category, :status, :postage, :prefecture, :shipping, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'Out of setting range, Half-width number' }

  validates :category_id, :status_id, :postage_id, :prefecture_id, :shipping_id, numericality: { other_than: 1, message: 'Select' }
end
