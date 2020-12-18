class Task < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :favorites, dependent: :destroy 

  validates :task_name, presence: true
  validates :status,    presence: true
  validates :limit,     presence: true
  

end
