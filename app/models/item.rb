class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  belongs_to :user
  has_one_attached :image

  validates :name, :item_text, :image, presence: true

  validates :price, :numericality => { :greater_than_or_equal_to => 300, :less_than => 10000000, message: 'Out of setting range, Half-width number'}

  validates :category_code, :status_code, :postage_code, :prefecture_code, :delivery_days_code, numericality: { other_than: 1 , message: 'Select'}
end
