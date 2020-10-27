# frozen_string_literal: true

class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :addresses
  has_many :cards
  has_many :carts
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true # , presence: { message: "姓が空白です"}
  validates :first_name, presence: true # , presence: { message: "名前が空白です"}
  validates :kana_family_name, presence: true # , presence: { message: "セイが空白です"}
  validates :kana_first_name, presence: true # , presence: { message: "ナマエが空白です"}
  validates :postal_code, presence: true # , presence: { message: "郵便番号が空白です"}
  validates :address, presence: true # , presence: { message: "住所が空白です"}
  validates :tel, presence: true # , presence: { message: "電話番号が空白です"}

  def self.guest
    find_or_create_by!(email: 'guest@example.com',
                       family_name: 'ゲスト',
                       first_name: 'ユーザー',
                       kana_family_name: 'ゲスト',
                       kana_first_name: 'ユーザー',
                       postal_code: '1111111',
                       address: '東京都テスト',
                       tel: '00000000000',
                       delete_status: false) do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
