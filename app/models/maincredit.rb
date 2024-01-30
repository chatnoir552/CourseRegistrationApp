class Maincredit < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :subcredits, dependent: :destroy
  accepts_nested_attributes_for :subcredits, allow_destroy: true
  
end
