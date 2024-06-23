class Task < ApplicationRecord
  belongs_to :user

  enum status: { backlog: 'backlog', in_progress: 'in_progress', done: 'done' }


  validates :title, :description, :status, :deadline, presence: true
end