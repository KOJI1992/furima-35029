class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze

  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: NAME_REGEX, message: 'Full-width characters' }
  validates :first_name, presence: true, format: { with: NAME_REGEX, message: 'Full-width characters' }
  validates :last_name_kana, presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
  validates :birthday, presence: true
end
