FactoryGirl.define do
  factory :invoice_item do
    item nil
    invoice nil
    quantity 10
    unit_price 1000
  end
end
