# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :authenticate_student, except: :index
  before_action :find_student, except: %i[index new]

  def index
    @students = Student.by_keyword(params[:q]).page(params[:page])
  end

  def new
    @student = Student.new
  end

  def show
    if policy.deny_view_student?(current_admin)
      flash[:error] = t('flash.no_access_student')

      redirect_back(fallback_location: students_path)
    end
  end

  def edit; end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def update
    @student.assign_attributes(student_params)
    if @student.save
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def policy
    @policy ||= UserPolicy.new(current_student, @student)
  end

  def find_student
    @student ||= Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :student_id, :avatar)
  end
end
