class Card < ApplicationRecord

	belongs_to :end_user

	require "payjp"

	def cards_last4
		Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
		customer = Payjp::Customer.retrieve(self.customer_id)
	    default_card_information = customer.cards.retrieve(self.card_id)
		"**** **** **** " + default_card_information.last4
  	end

end
