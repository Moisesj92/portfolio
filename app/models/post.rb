class Post < ApplicationRecord

  # Associations
  has_one_attached :image
  has_rich_text :content
  belongs_to :user
  has_many :comments, dependent: :destroy

  # Enums
  enum status: { draft: 0, published: 1 }
  enum post_type: { note: 0, project: 1 }

  # Validations
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :short_description, presence: true, length: { minimum: 10, maximum: 150 }
  validates :image, presence: true

end
