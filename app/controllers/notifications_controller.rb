class NotificationsController < ApplicationController
  before_action :set_invoice, only: [:show]

  def index
    notifications = Notification.where(user: current_user).order(created_at: :desc)
  end


  def new
    @notification = Notification.new
  end

  def show
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.save
      render :index
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
  def notification_params
    params.require(:notification).permit(:name, :content, :user)
  end
end
