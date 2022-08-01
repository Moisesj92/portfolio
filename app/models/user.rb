class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable , :registerable , :validatable

  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  #Enums
  enum role: { admin: 0, user: 1 }

  # Validations


end
