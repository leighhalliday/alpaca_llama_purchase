module Shipping
  class Shipment < ApplicationRecord
    DEFAULT_SHIPPER = 'purolator'.freeze

    validates :order_id, :postal_code, :weight_kg, :service_level, :shipper, :status,
      presence: true

    def self.schedule(order_id:, address:, weight_kg:, service_level:)
      shipment = new(
        order_id: order_id,
        postal_code: address[:postal_code],
        weight_kg: weight_kg,
        service_level: service_level,
        shipper: DEFAULT_SHIPPER,
        tracking_code: 'ABC123' # Faked
      )

      if shipment.save
        [true, shipment.id]
      else
        [false, shipment.errors.to_h]
      end
    end
  end
end
