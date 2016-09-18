require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '.weight_kg' do
    it 'returns total weight of all llamas in this order' do
      order = create(:order)
      llama = create(:llama, order: order)

      expect(order.weight_kg).to eq(100.0)
    end
  end

  describe '.ship!' do
    it 'updates order status to shipped' do
      order = create(:order)
      llama = create(:llama, order: order)

      expect(order.status).to eq('paid')
      expect(order.shipment_id).to eq(nil)

      order.ship!

      expect(order.status).to eq('shipped')
      expect(order.shipment_id).to be_present
    end
  end

  describe '.tracking_code' do
    it 'returns tracking code' do
      skip('Not yet implemented')

      order = create(:order)
      llama = create(:llama, order: order)
      order.ship!

      expect(order.tracking_code).to eq('ABC123')
    end
  end
end
