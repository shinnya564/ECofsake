# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :end_user
  belongs_to :product
end
