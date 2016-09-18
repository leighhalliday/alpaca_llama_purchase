module Shipping
  class ScheduleRequest
    PATH = '/shipments'

    attr_reader :order_id, :address, :weight_kg, :service_level,
      :connection

    def initialize(order_id:, address:, weight_kg:, service_level:)
      @order_id = order_id
      @address = address
      @weight_kg = weight_kg
      @service_level = service_level

      @connection = HTTP
    end

    def response
      resp = connection.
        headers(
          'X-Auth-Token' => Shipping.shipping_token,
          :accept => "application/json"
        ).
        post(Shipping.shipping_url+PATH, json: params)
      ScheduleResponse.new(resp)
    end

    def params
      {
        shipment: {
          order_id: order_id,
          address: address,
          weight_kg: weight_kg,
          service_level: service_level
        }
      }
    end
  end
end
