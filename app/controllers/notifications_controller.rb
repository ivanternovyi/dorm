# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_manager

  def index; end

  def notify
    notify_students_with_mail

    flash[:success] = t('flash.successfully_sent')
    redirect_to action: :index
  end

  private

  def notify_students_with_mail
    if notification_params[:send_to_all]
      NotifyAllStudentsJob.perform_later(
        notification_params[:subject],
        notification_params[:body]
      )
    else
      NotifyStudentJob.perform_later(
        notification_params[:email],
        notification_params[:subject],
        notification_params[:body]
      )
    end
  end

  def notification_params
    params.require(:notification).permit(:subject, :email, :body, :send_to_all)
  end
end
