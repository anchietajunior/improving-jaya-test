FactoryBot.define do
  factory :event do
    action { "opened" }
    event_type { "issue" }
    number { "1000" }
  end
end
