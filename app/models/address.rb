class Address < ApplicationRecord

  belongs_to :end_user

  validates :address, presence: true
  validates :postal_code, presence: true,numericality: true
  validates :name, presence: true

  def full_address
    self.postal_code+ "　" + self.address+ "　" + self.name
  end

end
