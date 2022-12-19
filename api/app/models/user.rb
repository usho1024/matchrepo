# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :avatar, AvatarUploader

  has_many :rooms
  has_many :rooms_users
  has_many :messages

  validates :name, presence: true,
                   length: {
                     maximum: 30,
                     allow_blank: true
                   }
  validates :introduction, length: { maximum: 300 }
end
