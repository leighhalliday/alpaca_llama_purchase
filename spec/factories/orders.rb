FactoryGirl.define do
  factory :order do
    subtotal_cents 10000
    tax_cents 1300
    shipping_cents 1500
    total_cents 12800
    tax_rate 0.13
    name 'Señor Perez'
    postal_code 'M8X1A3'
    status 'paid'
  end
end
