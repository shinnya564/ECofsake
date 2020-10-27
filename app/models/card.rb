# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :end_user

  require 'payjp'

  def cards_last4
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(customer_id)
    default_card_information = customer.cards.retrieve(card_id)
    '**** **** **** ' + default_card_information.last4
    end
end
