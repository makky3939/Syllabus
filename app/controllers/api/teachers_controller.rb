class Api::TeachersController < ApplicationController
  def index
    @teacher = Teacher.select('id, name, face_filename, voice_filename, kana').where('face_filename != ?', 'null').where('voice_filename != ?', 'null').sample(3)
    render json: @teacher
  end
end
