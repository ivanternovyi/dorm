class ManagersController < ApplicationController
  before_action :authenticate_manager!
  before_action :find_manager

  def show
  end

  def edit
  end

  def update
    @manager.assign_attributes(manager_params)
    if @manager.save
      redirect_to @manager
    else
      render :edit
    end
  end

  def destroy
    @manager.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_manager
    @manager ||= Manager.find(params[:id])
  end

  def manager_params
    params.require(:manager).permit(:email, :student_id)
  end
end
