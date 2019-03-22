class Event < ApplicationRecord
  validates :action, :event_type, :number, presence: true
end
