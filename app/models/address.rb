class Address < ApplicationRecord
  belongs_to :customer
  def destination
    self.postal_code + " " + self.address + " " + self.name
  end
end
