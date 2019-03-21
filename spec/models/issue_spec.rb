require 'rails_helper'

RSpec.describe Issue, type: :model do
  context "relationship" do
    it { is_expected.to have_many :events }
  end

  context "validations" do
    it { is_expected.to validate_presence_of :url }

    it "is not a valid object to create in the database" do
      expect(Issue.new.valid?).to be_falsy
    end
  end
end
