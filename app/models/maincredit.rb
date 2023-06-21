class Maincredit < ApplicationRecord
  belongs_to :user
  has_many :subcredits
end
