class BitMap
  attr_accessor :current_image

  def initialize(width, height)
    check_values_are_numeric([width, height], 'initialize')
    @current_image = Array.new(height.to_i){ Array.new(width.to_i, 'O') }
  end

  def clear
    raise 'Bitmap clear cannot clear an empty image' unless @current_image.length > 0
    # create brand new image as initial value is the same
    initialize @current_image[0].length, @current_image.length
  end

  def colour_specific(column, row, colour)
    check_values_are_numeric([column, row], 'colour_specific')
    raise 'Bitmap colour_specific given out of range values' if row.to_i > @current_image.length || column.to_i > @current_image[0].length
    @current_image[row.to_i - 1][column.to_i - 1] = colour
  end

  def colour_vertical_segement(column, start_row, end_row, colour)
    check_values_are_numeric([column, start_row, end_row], 'colour_vertical_segement')
    raise 'Bitmap colour_vertical_segement given out of range values' if !start_row.to_i.between?(0, @current_image.length) || !end_row.to_i.between?(0, @current_image.length) || column.to_i > @current_image[0].length
    (start_row.to_i..end_row.to_i).step(1) do |n|
      @current_image[n - 1][column.to_i - 1] = colour
    end
  end

  def colour_horizontal_segement(start_column, end_column, row, colour)
    check_values_are_numeric([start_column, end_column, row], 'colour_horizontal_segement')
    raise 'Bitmap colour_horizontal_segement given out of range values' if !start_column.to_i.between?(0, @current_image[0].length) || !end_column.to_i.between?(0, @current_image[0].length) || row.to_i > @current_image.length
    (start_column.to_i..end_column.to_i).step(1) do |n|
      @current_image[row.to_i - 1][n - 1] = colour
    end
  end

  def show_image
    @current_image.each{ |a| puts a.join(" ") }
  end

  private
  def is_numeric(value)
    Integer(value) != nil rescue false
  end

  def check_values_are_numeric(values, method)
    # raise exception if incorrect parameter types to not get unreadable messages
    values.each {|i| raise "Bitmap #{method} given incorrect parameters" if !is_numeric(i)}
  end
end