class User < ApplicationRecord
    has_many :reservations
    has_many :books, through: :reservations
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/assets/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    scope :borrowed_book, -> { joins(:books).where(books: { aasm_state: 'borrowed' }) }
end
    