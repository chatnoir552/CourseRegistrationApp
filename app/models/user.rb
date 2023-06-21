class User < ApplicationRecord
    has_secure_password
    has_many :maincredits
    has_many :bookmarks
    has_many :getcredits

    validates :name, presence: true, uniqueness: true
    validates :grade, presence: true
    validates :semester, presence: true
end
