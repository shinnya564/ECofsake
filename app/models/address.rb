# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :end_user

  validates :address, presence: true
  validates :postal_code, presence: true, numericality: true
  validates :name, presence: true

  def full_address
    postal_code + '　' + address + '　' + name
  end
end
