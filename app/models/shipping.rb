module Shipping
  def self.rates(postal_code:, weight_kg:)
    [
      RateCalculator.priority(weight_kg),
      RateCalculator.express(weight_kg),
      RateCalculator.normal(weight_kg)
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
