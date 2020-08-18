class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  belongs_to :user
  has_one_attached :image

  validates :name, :item_text, :price, :image, presence: true

  validates :category_code, :status_code, :postage_code, :prefecture_code, :delivery_days_code, numericality: { other_than: 1 }
end
