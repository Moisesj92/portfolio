class Post < ApplicationRecord

  # Associations
  has_one_attached :primary_image
  has_one_attached :secondary_image
  has_rich_text :content
  belongs_to :user

  # Enums
  enum status: { draft: 0, published: 1 }

end
