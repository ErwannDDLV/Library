class Book < ApplicationRecord
    belongs_to :user, optional: true

    validates :title, presence: true, uniqueness: true
    validates :author, presence: true
end
