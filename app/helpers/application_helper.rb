module ApplicationHelper
  def tour_names
    Tour.get_list_tour
  end
end
