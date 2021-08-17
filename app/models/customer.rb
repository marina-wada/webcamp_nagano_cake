class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :orders
  has_many :addresses

  enum is_deleted: {有効: false, 退会: true}

  def active_for_authentication?
    super && (self.is_deleted === "false")
  end

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  def residence
    self.postal_code + " " + self.address
  end

  def destination
    self.postal_code + " " + self.address + " " + self.last_name + " " + self.first_name
  end

end
