class Book < ApplicationRecord
    belongs_to :user, optional: true

    validates :title, presence: true, uniqueness: true
    validates :author, presence: true

    has_attached_file :book_cover, styles: { book_index: "100x200>", book_show: "325x475>" }, default_url: "/assets/:style/bookcover.jpg"
    validates_attachment_content_type :book_cover, content_type: /\Aimage\/.*\z/

    scope :state, -> { where(state: true) }
end