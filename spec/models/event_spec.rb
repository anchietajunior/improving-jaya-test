require 'rails_helper'

RSpec.describe Event, type: :model do

  context "validations" do
    it { is_expected.to validate_presence_of :action }
    it { is_expected.to validate_presence_of :event_type }
    it { is_expected.to validate_presence_of :number }
  end
end
