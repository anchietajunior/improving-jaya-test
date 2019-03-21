require 'rails_helper'

RSpec.describe Event, type: :model do
  context "relationship" do
    it { is_expected.to belong_to :issue }
  end

  context "validations" do
    it { is_expected.to validate_presence_of :issue_id }
    it { is_expected.to validate_presence_of :action }
  end
end
