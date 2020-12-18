class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :tasks
  has_many :favorites, dependent: :destroy     

  validates :nickname, presence: true, uniqueness: true,length: { maximum: 15 } 

  validates :password,length: { minimum: 6 } 
end
