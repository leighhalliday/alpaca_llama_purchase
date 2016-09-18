class Order < ApplicationRecord
  has_many :llamas

  class ShippingError < RuntimeError; end

  def weight_kg
    llamas.
      map(&:weight_kg).
      reduce(0.0, &:+)
  end

  def ship!
    success, response = Shipping.schedule(
      order_id: id,
      address: {
        postal_code: postal_code
      },
      weight_kg: weight_kg,
      service_level: 'priority' # Would need to come from user selection
    )

    if success
      update!(status: 'shipped', shipment_id: response)
    else
      # This would need to be handled for real
      fail ShippingError, response
    end
  end

  def tracking_code
    Shipping.details(shipment_id).fetch(:tracking_code)
  end
end
