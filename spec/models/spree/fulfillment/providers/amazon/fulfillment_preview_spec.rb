require 'spec_helper'

describe Spree::Fulfillment::Providers::Amazon::FulfillmentPreview do
  let(:preview){ build(:fulfillment_preview) } 

  before :each do
    klass = Spree::Fulfillment::Providers::Amazon::FulfillmentPreview
    klass.send(:public, *klass.private_instance_methods)
  end

  context "#fulfillable?" do
    it 'should return a correct value based on the response' do
      expect(preview.fulfillable?(:standard)).to eq(true)
      expect(preview.fulfillable?(:priority)).to eq(false)
    end
  end

  context "#total_cost" do
    it 'should return the cost for the given service' do
      expect(preview.total_cost(:standard)).to eq(1675)
      expect(preview.total_cost(:expedited)).to eq(1360)
    end
    context 'with a service that is not fulfillable' do
      it 'should return nil if the given service is not fulfillable' do
        expect(preview.total_cost(:priority)).to be_nil
      end
    end
  end

  context "#delivery_date_estimate" do
    it 'should return valid delivery window estimates for the given service' do
      expect(preview.delivery_window_estimate(:expedited)[0]).to eq(DateTime.new(2014,1,5,7,0,0))
      expect(preview.delivery_window_estimate(:expedited)[1]).to eq(DateTime.new(2014,1,6,6,59,59))
    end
  end

end