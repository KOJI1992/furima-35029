class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one_attached :image

  validates :name, :detail, :price, presence: true
  with_options numericality: {other_than: 0} do
    validates :category_id
    validates :quality_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end

end
