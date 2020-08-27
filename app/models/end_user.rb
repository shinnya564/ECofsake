class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

	has_many :addresses
	has_many :cards
	has_many :carts
	has_many :orders

	devise :database_authenticatable, :registerable,
    	   :recoverable, :rememberable, :validatable

end
