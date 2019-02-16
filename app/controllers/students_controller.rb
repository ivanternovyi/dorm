class StudentsController < ApplicationController
  before_action :authenticate_user
  before_action :find_student, except: %i[index new]

  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    @student.destroy
    redirect_to :back, fallback_location: root_path
  end

  private

  def find_student
    @student ||= Student.find(params[:id])
  end
end
