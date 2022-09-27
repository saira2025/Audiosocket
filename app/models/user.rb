# frozen_string_literal: true

# user
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :auditions
  has_one_attached :image
  has_many :albums

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :simple_users, -> { where(type: nil) }
  # Constants
  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
  /x.freeze

  # Validations
  validates :email, presence: true
  validates :password, presence: true, format: { with: PASSWORD_FORMAT }, on: :create
end
