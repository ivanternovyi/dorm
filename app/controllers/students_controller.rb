class StudentsController < ApplicationController
  before_action :authenticate_user, except: :index
  before_action :find_student, except: %i[index new]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @student.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_student
    @student ||= Student.find(params[:id])
  end
end
