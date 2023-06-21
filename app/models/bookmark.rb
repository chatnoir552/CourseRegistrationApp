class Bookmark < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :maincredit, optional: true
  belongs_to :subcredit, optional: true

  validates :name, presence: true
  validates :day_of_week, presence: true
  validates :period, presence: true
  validates :credit, presence: true
  validates :necessary, inclusion: [true, false]
end
