module Shipping
  class RateCalculator
    def self.priority(weight_kg)
      { service_level: 'priority', price_cents: ((weight_kg * 0.25) * 100).to_i, arrival_date: 2.days.from_now.to_date.to_s }
    end

    def self.express(weight_kg)
      { service_level: 'express', price_cents: ((weight_kg * 0.20) * 100).to_i, arrival_date: 5.days.from_now.to_date.to_s }
    end

    def self.normal(weight_kg)
      { service_level: 'normal', price_cents: ((weight_kg * 0.15) * 100).to_i, arrival_date: 10.days.from_now.to_date.to_s }
    end
  end
end
