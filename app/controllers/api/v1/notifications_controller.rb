class Api::V1::NotificationsController < ApiController
  def index
    @notifications = current_user.notifications
    render json: @notifications
  end

  def mark_as_read
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    render json: @notification
  end

  def mark_all_as_read
    @notifications = current_user.notifications
    @notifications.update_all(read: true)
    render json: @notifications
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    render json: { message: "Notification is cleared" }
  end
end
