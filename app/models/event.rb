class Event < ApplicationRecord
  belongs_to :issue

  validates :issue_id, :action, presence: true
end
