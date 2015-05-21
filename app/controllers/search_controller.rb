class SearchController < ApplicationController
  def index
    if params[:word] && !params[:word].empty?
      @subjects = Subject.includes(:teachers).where(Subject.arel_table[:title].matches("%#{escape_like(params[:word])}%"))
    else
      @subjects = nil
    end
  end

  private
  def escape_like(string)
    string.gsub(/[\\%_]/){|m| "\\#{m}"}
  end
end
