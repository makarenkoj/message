class NotificationsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_notification, only: %i[show]
  before_action :set_current_user_notification, only: %i[show]

  def index
    @notifications = Notification.all
  end

  def show
  end

  def new
    @notification = current_user.notifications.build
  end

  def edit
  end

  def create
    @notification = Notification.create(notification_params.merge(user: current_user))

    if @notification.save
      redirect_to @notification.user, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to @notification, notice: 'Notification was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @notification.destroy
    redirect_to notifications_url, notice: 'Notification was successfully destroyed.'
  end

  private
  def set_current_user_notification
    @notification = current_user.notifications.find(params[:id])
  end

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:body)
  end
end
