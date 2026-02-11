class User < ApplicationRecord
  has_secure_password

  before_validation :normalize_email

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, if: -> { password.present? }

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
