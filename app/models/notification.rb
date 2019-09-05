class Notification < ApplicationRecord
  belongs_to :user

  validates :category, presence: true
  validates :content, presence: true

  def broadcast_notif
    ActionCable.server.broadcast("user_notif_#{self.user.id}", {
      notif_partial: ApplicationController.renderer.render(
        partial: "notifications/show",
        locals: { notif: self }
      ),
      user_id: user.id
    })
  end
end
