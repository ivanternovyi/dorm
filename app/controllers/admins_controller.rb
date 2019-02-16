class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @students = Student.all
  end

  def upload_csv
    current_admin.update(students_csv: csv_params[:students_csv])
    redirect_back(fallback_location: root_path)
  end

  private

  def csv_params
    params.permit(:students_csv)
  end
end
