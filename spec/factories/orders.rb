FactoryGirl.define do
  factory :order do
    subtotal_cents 1
    tax_cents 1
    shipping_cents 1
    total_cents 1
    tax_rate 1.5
    postal_code "MyString"
    shipment_id 1
    status "MyString"
  end
end
