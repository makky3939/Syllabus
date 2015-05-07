class ConsoleController < ApplicationController
  def index
    p params[:word]
    if params[:word]
      @subjects = Subject.where(Subject.arel_table[:title].matches("%#{params[:word]}%"))
    else
      @subjects = nil
    end
  end

  def show

  end
end
