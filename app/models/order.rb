class Order < ApplicationRecord

	belongs_to :end_user

	has_many :order_items

  enum status_flg: { "入金待ち": 0, "入金確認": 1}
  enum payment_flg: { "銀行振込": 0, "クレジットカード": 1}

end
