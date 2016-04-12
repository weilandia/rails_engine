FactoryGirl.define do
  factory :invoice do
    customer nil
    merchant nil
    status "Shipped"
  end
end
