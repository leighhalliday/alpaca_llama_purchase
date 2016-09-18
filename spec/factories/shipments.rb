FactoryGirl.define do
  factory :shipment do
    status "MyString"
    order_id 1
    postal_code "MyString"
    weight_kg "MyString"
    shipper "MyString"
    service_level "MyString"
    tracking_code "MyString"
  end
end
