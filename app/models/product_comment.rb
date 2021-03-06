# frozen_string_literal: true

class ProductComment < ApplicationRecord
  belongs_to :product

  validates :comment, presence: true
end
