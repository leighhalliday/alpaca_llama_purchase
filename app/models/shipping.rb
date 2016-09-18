module Shipping
  def self.rates(postal_code:, weight_kg:)
    [
      { service_level: 'priority', price_cents: ((weight_kg * 0.25) * 100).to_i, arrival_date: 2.days.from_now.to_date.to_s },
      { service_level: 'express', price_cents: ((weight_kg * 0.20) * 100).to_i, arrival_date: 5.days.from_now.to_date.to_s },
      { service_level: 'priority', price_cents: ((weight_kg * 0.15) * 100).to_i, arrival_date: 10.days.from_now.to_date.to_s }
    ]
  end

  def self.schedule(order_id:, address:, weight_kg:, service_level:)
    Shipment.schedule(
      order_id: order_id,
      address: address,
      weight_kg: weight_kg,
      service_level: service_level
    )
  end

  def self.details(shipment_id)
    Shipment.find(shipment_id).slice(:tracking_code)
  end
end
