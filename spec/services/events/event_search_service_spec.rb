require 'rails_helper'

RSpec.describe Events::EventSearchService do

  let!(:event1) { create(:event) }
  let!(:event2) { create(:event) }
  let!(:event3) { create(:event) }
  let!(:event4) { create(:event) }
  let!(:event5) { create(:event) }
  let!(:event6) { create(:event) }
  let!(:event7) { create(:event) }

  let!(:event8) { create(:event, number: "999") }
  let!(:event9) { create(:event, number: "999") }
  let!(:event10) { create(:event, number: "998") }
  let!(:event11) { create(:event, number: "998") }

  let(:service) do
    described_class.call({ type: "issue", number: "1000" })
  end

  describe "Call" do
    context "success" do
      it "has a success? value as true" do
        expect(service.success?).to be_truthy
      end

      it "has 7 events" do
        events = service.value
        expect(events.count).to eq(7)
      end
    end
  end

end
