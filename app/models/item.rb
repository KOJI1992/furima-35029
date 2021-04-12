class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one :order
  has_one_attached :image

  validates :name, :detail, :image, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/.freeze, message: 'Half-width number' },
                    numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'Out of setting range' }
  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :quality_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
