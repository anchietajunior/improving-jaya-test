require 'rails_helper'

RSpec.describe Events::EventCreatorService do

  let(:webhook_params) { WebhookParams.new }

  let(:service) do
    described_class.call(webhook_params.params)
  end

  let(:service2) do
    described_class.call("{\"something\":\"anything\"}")
  end

  describe "Call" do
    context "success" do
      it "has a success? true value" do
        expect(service.success?).to be_truthy
      end

      it "has a Event as result value" do
        expect(service.value.class.name).to eq("Event")
      end

      it "has a Event as result value" do
        event = service.value
        expect(event.action.present?).to be_truthy
        expect(event.event_type.present?).to be_truthy
        expect(event.number.present?).to be_truthy
      end
    end

    context "failure" do
      it "has a success? false as value" do
        expect(service2.success?).to be_falsy
      end
    end
  end
end
