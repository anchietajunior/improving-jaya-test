require 'rails_helper'

RSpec.describe Authentication::AuthenticationService do

  let(:webhook_params) { WebhookParams.new }
  let(:git_key) { webhook_params.git_key }
  let(:params) { webhook_params.params }

  let(:service) do
    described_class.call(git_key, params)
  end

  let(:service2) do
    described_class.call("ahgjshjahsj", params)
  end

  describe "Call" do
    context "success" do
      it "has a success? true value passing correct params" do
        expect(service.success?).to be_truthy
      end
    end

    context "failure" do
      it "has a success? false value passing wrong params" do
        expect(service2.success?).to be_falsy
      end
    end
  end
end
