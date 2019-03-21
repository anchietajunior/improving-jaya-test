require 'rails_helper'

RSpec.describe Authentication::AuthenticationService do

  let(:git_key) { "sha1=d5b0f38c514275267fa3f5b2fe7162a44af693f4" }
  let(:webhook_params) { WebhookParams.new.params }
  let(:service) do
    described_class.call(git_key, webhook_params)
  end
  let(:service2) do
    described_class.call("ahgjshjahsj", webhook_params)
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
