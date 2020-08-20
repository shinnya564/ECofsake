class OrderItem < ApplicationRecord

	belongs_to :order

	enum production_status: { "受注": 0, "発送済": 1, "着手不可": 3}
end
