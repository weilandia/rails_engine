class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :unit_price, presence: true, numericality: { only_integer: true }
end
