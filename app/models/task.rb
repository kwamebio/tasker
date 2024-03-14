class Task < ApplicationRecord
  belongs_to :admin
  belongs_to :user
  belongs_to :project
  has_many :notifications, dependent: :destroy



  after_create :create_notification

  private

  # def create_notification
  #   Notification.create(
  #     user_id: user_id,
  #     task_id: id,
  #     content: "New task '#{title}' created.",
  #     read: false
  #   )
  # end

  enum status: { pending: 0, completed: 1, canceled: 2}
end
