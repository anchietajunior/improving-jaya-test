require 'rails_helper'

RSpec.describe Authentication::BasicAuthService do

  let(:login) { ENV['LOGIN'] }
  let(:password) { ENV['PASSWORD'] }

  let(:service) do
    described_class.call({'login': 'xxx', 'password': 'xxx'})
  end

  let(:service2) do
    described_class.call({'login': '123', 'password': '123'})
  end

  let(:service3) do
    described_class.call({})
  end

  describe "Call" do
    context "success" do
      it "has a success? true as value" do
        expect(service.success?).to be_truthy
      end
    end

    context "failure" do
      it "has a success? false as value" do
        expect(service2.success?).to be_falsy
      end

      it "has a success? false as value when login headers are empty" do
        expect(service3.success?).to be_falsy
      end
    end
  end

end
