module Shipping
  class ScheduleResponse
    attr_reader :http_response

    def initialize(http_response)
      @http_response = http_response
    end

    def success?
      http_response.status == 200
    end

    def shipment_id
      json.fetch('shipment_id')
    end

    def errors
      json.fetch('errors')
    end

    private

    def json
      @json ||= http_response.parse(:json)
    end
  end
end
