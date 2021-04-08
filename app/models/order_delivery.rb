class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture, numericality: {other_than: 0, message: "Select"}
    validates :city
    validates :address
    validates :telephone_number, format: {with: /\A[0-9]+\z/, message: "Input only number"}
    validates :user_id
    validates :item_id
  end
end