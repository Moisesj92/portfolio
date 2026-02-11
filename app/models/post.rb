class Post < ApplicationRecord
  belongs_to :category

  enum :status, { draft: 0, published: 1 }

  validates :title, :body, :status, presence: true
  validates :published_at, presence: true, if: :published?

  scope :published_live, -> { where(status: statuses[:published]).where("published_at <= ?", Time.current) }
end
