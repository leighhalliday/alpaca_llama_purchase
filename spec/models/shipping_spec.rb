require 'rails_helper'

RSpec.describe Shipping, type: :model, vcr: { record: :none } do
  describe '.rates' do
    let(:expected_rates) do
      [
        { service_level: 'priority', price_cents: 2500, arrival_date: 2.days.from_now.to_date.to_s },
        { service_level: 'express', price_cents: 2000, arrival_date: 5.days.from_now.to_date.to_s },
        { service_level: 'normal', price_cents: 1500, arrival_date: 10.days.from_now.to_date.to_s }
      ]
    end

    it 'calculates rates based on weight' do
      skip('Not yet implemented')
      expect(Shipping.rates(postal_code: 'M8X1A3', weight_kg: 100.0)).to eq(expected_rates)
    end
  end

  describe '.schedule' do
    context 'success' do
      it 'returns true and shipment id' do
        success, response = Shipping.schedule(
          order_id: 1,
          address: {
            postal_code: 'M8X1A3'
          },
          weight_kg: 100.0,
          service_level: 'priority'
        )

        expect(success).to eq(true)
        expect(response).to be_present
      end
    end

    context 'failure' do
      it 'returns false and errors' do
        success, response = Shipping.schedule(
          order_id: 1,
          address: {
            postal_code: nil
          },
          weight_kg: 100.0,
          service_level: nil
        )

        expect(success).to eq(false)
        expect(response).to eq({
          'postal_code' => "can't be blank",
          'service_level' => "can't be blank"
        })
      end
    end
  end
end
