class Book < ApplicationRecord
    has_one :reservation
    has_one :user, through: :reservation

    validates :title, presence: true, uniqueness: true
    validates :author, presence: true

    has_attached_file :book_cover, styles: { book_index: "250x300>", book_show: "325x475>" }, default_url: "/assets/:style/bookcover.jpg"
    validates_attachment_content_type :book_cover, content_type: /\Aimage\/.*\z/

    include AASM
    aasm do
        state :available, initial: true
        state :borrowed

        event :borrow do
            transitions from: :available, to: :borrowed
        end

        event :return do
            transitions from: :borrowed, to: :available
        end
    end
end