class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @students = Student.page(params[:page])
  end

  def upload_csv
    current_admin.update(students_csv: students_csv)
    StudentsCsvService.new(current_admin).call
    redirect_back(fallback_location: root_path)
  end

  private

  def students_csv
    csv_params[:students_csv]
  end

  def csv_params
    params.permit(:students_csv)
  end
end
