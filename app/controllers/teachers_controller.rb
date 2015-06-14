class TeachersController < ApplicationController
  def index
    @teacher = Teacher.where.not(face_filename: false)
  end
  def show
    @teacher = Teacher.find_by id: params[:id]
  end
end
