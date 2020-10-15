class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

	has_many :addresses
	has_many :cards
	has_many :carts
	has_many :orders

	devise :database_authenticatable, :registerable,
    	   :recoverable, :rememberable, :validatable

	validates :family_name, presence: true, presence: { message: "姓が空白です"}
	validates :first_name, presence: true, presence: { message: "名前が空白です"}
	validates :kana_family_name, presence: true, presence: { message: "セイが空白です"}
	validates :kana_first_name, presence: true, presence: { message: "ナマエが空白です"}
	validates :postal_code, presence: true, presence: { message: "郵便番号が空白です"}
	validates :address, presence: true, presence: { message: "住所が空白です"}
	validates :tel, presence: true, presence: { message: "電話番号が空白です"}
end
