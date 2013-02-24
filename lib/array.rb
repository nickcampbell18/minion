class Array

  # See http://stackoverflow.com/questions/12374645/splitting-an-array-into-equal-parts-in-ruby
  def in_groups(num_groups)
    return [] if (num_groups == 0 || size == 0)
    slice_size = (self.size / Float(num_groups)).ceil
    self.each_slice(slice_size).to_a
  end

end