class User < ApplicationRecord
    has_secure_password
    has_many :maincredits, dependent: :destroy
    accepts_nested_attributes_for :maincredits, allow_destroy: true

    has_many :bookmarks
    has_many :getcredits
    has_many :follows

    validates :name, presence: true, uniqueness: true
    validates :grade, presence: true
    validates :semester, presence: true

    def self.search(search)
        if search != ""
            User.where('name LIKE(?)', "%#{search}%").where(private: false)
        end
    end
end
