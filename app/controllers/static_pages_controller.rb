class StaticPagesController < ApplicationController
  def home
    @location = Location.order_created_at_desc.page(params[:page]).per Settings.paginate_homepage
    @location_newest = Location.get_location_newest
    @location_rand = Location.get_location_random
  end
end
