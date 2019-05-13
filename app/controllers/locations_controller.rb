class LocationsController < ApplicationController
  def index
    @tour = Tour.find_by id: params[:tour_id]
    if @tour
      @locations = Location.filter_by_tour @tour
    elsif params[:search]
      @locations = Location.filter_by_name params[:search]
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find_by id: params[:id]
    @locations = Location.filter_by_tour @location.tour_id
    comment = Comment.new
    @comments = Comment.get_comment.filter_by_location @location
  end
end
