class Issue < ApplicationRecord
  has_many :events

  validates :url, presence: true
end
