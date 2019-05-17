class NotificationsController < ApplicationController
  before_action :authenticate_manager

  def index
  end

  def notify
    NotificationsMailer.notify(
      notification_params[:email],
      notification_params[:subject],
      notification_params[:body]
    ).deliver_now!

    flash[:success] = "Letter was successfully sent to #{notification_params[:email]}"
    redirect_to action: :index
  end

  private

  def notification_params
    params.require(:notification).permit(:subject, :email, :body)
  end
end
