FactoryGirl.define do
  factory :shipment, class: Shipping::Shipment do
    status 'initial'
    order_id 1
    postal_code 'M8X1A3'
    weight_kg 100.0
    shipper 'purolator'
    service_level 'priority'
    tracking_code 'ABC123'
  end
end
