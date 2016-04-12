FactoryGirl.define do
  factory :invoice_item do
    item nil
    invoice nil
    quantity 10
    unit_price 10.0
  end
end
