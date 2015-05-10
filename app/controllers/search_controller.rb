class SearchController < ApplicationController
  def index
    if params[:word]
      @subjects = Subject.where(Subject.arel_table[:title].matches("%#{params[:word]}%"))
    else
      @subjects = nil
    end
  end
end
