class UserNotifChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "user_notif_#{params[:user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
