class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find_by id: params[:id]
  end
end
