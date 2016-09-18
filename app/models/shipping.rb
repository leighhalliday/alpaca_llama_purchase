module Shipping
  def self.shipping_url
    ENV.fetch('SHIPPING_URL', 'http://localhost:3000')
  end

  def self.shipping_token
    ENV.fetch('SHIPPING_TOKEN', 'LOCAL123')
  end

  # Pending
  def self.rates(postal_code:, weight_kg:)
    [
      RateCalculator.priority(weight_kg),
      RateCalculator.express(weight_kg),
      RateCalculator.normal(weight_kg)
    ]
  end

  def self.schedule(order_id:, address:, weight_kg:, service_level:)
    response = ScheduleRequest.new(
      order_id: order_id,
      address: address,
      weight_kg: weight_kg,
      service_level: service_level
    ).response
    if response.success?
      [true, response.shipment_id]
    else
      [false, response.errors]
    end
  end

  # Pending
  def self.details(shipment_id)
    Shipment.find(shipment_id).slice(:tracking_code)
  end
end
