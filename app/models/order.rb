# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :end_user

  has_many :order_items

  enum status_flg: { "未発送": 0, "入金待ち": 1, "入金済": 2 }
  enum payment_flg: { "クレジットカード": 0, "代引支払": 1 }
end
