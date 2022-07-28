class Project < ApplicationRecord

  # Associations
  has_many_attached :images
  has_rich_text :content
  belongs_to :user

  # Enums
  enum status: { draft: 0, published: 1 }

end
