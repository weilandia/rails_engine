class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice

  default_scope { order(id: :asc) }
  scope :success, -> { where("result = ?", "success") }

end
