class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @students = Student.all
  end
end
