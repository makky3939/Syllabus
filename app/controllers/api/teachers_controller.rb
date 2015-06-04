class Api::TeachersController < ApplicationController
  def index
    @teacher = Teacher.select('id, name, face_filename').where('face_filename != ?', 'null').sample(3)
    render json: @teacher
  end
end
