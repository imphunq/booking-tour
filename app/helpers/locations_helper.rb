module LocationsHelper
  def tour
    Tour.pluck :name, :id
  end
end
