module SalesHelper
  def tour
    Tour.pluck :name, :id
  end
end
