class Getcredit < ApplicationRecord
  belongs_to :user
  belongs_to :maincredit
  belongs_to :subcredit
end
