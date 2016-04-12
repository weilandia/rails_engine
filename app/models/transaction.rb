class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice

  validates :credit_card_number, presence: true
  validates :result, presence: true
end
