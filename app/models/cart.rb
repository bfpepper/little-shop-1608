class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_trip(trip_id)
    contents[trip_id.to_s] ||= 0
    contents[trip_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def count_of(trip_id)
    contents[trip_id.to_s]
  end

  def total_cost
    @contents.reduce(0) do |price, (trip_id, count)|
      price += ( Trip.find(trip_id.to_s).price * count )
      price
    end
  end

  def trips_count
    contents.reduce({}) do |result, (trip_id, count)|
      result[Trip.find(trip_id.to_i)] = count
      result
    end
  end

  def remove(trip_id)
    @contents.delete(trip_id)
  end

  def update(trip_id, quantity)
    @contents[trip_id] = quantity.to_i
  end

end
