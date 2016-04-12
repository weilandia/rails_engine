class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true, numericality: { only_integer: true }

  after_find :format_unit_price

  def format_unit_price
    self.unit_price = (unit_price.to_f / 100).to_s
  end
end
