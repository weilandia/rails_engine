class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :unit_price, presence: true

  after_find :format_unit_price

  def format_unit_price
    require "pry"; binding.pry
    self.unit_price = (unit_price.to_f / 100).to_s
  end
end
