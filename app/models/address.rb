class Address < ApplicationRecord

  belongs_to :client_user

  def full_address
    self.postal_code+ "　" + self.address+ "　" + self.name
  end

end
