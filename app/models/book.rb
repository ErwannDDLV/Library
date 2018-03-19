class Book < ApplicationRecord
    belongs_to :user

    attr_accessor :title, :author, :resume, :state

    validates :title, presence: true, uniqueness: true
    validates :author, presence: true
end
