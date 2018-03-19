class User < ApplicationRecord
    has_many :books

    attr_accessor :first_name, :email, :last_name

    validates :first_name, last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
