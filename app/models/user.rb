class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze

  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: NAME_REGEX, message: 'Full-width characters' }
    validates :first_name, format: { with: NAME_REGEX, message: 'Full-width characters' }
    validates :last_name_kana, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
    validates :birthday
  end

  has_many :items
  has_many :orders
end
