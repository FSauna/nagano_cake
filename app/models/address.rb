class Address < ApplicationRecord
  belongs_to :customer
  
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  validates :postal_code, presence: true, format: {
                               with: /\A\d{7}\z/,
                               message: "郵便番号はハイフンなしの７桁で入力してください"
                             }
  validates :address, presence: true
  validates :name, presence: true
  
end
