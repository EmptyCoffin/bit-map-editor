class BitMap
  attr_accessor :current_image

  def initialize(width, height)
    raise 'Bitmap initialised with incorrect parameters' if !is_numeric(width) || !is_numeric(height)
    @current_image = Array.new(height.to_i){ Array.new(width.to_i, 'O') }
  end

  def colour_specific(column, row, colour)
    raise 'Bitmap colour_specific given incorrect parameters' if !is_numeric(column) || !is_numeric(row)
    raise 'Bitmap colour_specific given out of range values' if row.to_i > @current_image.length || column.to_i > @current_image[0].length
    @current_image[row.to_i - 1][column.to_i - 1] = colour
  end

  def show_image
    @current_image.each{ |a| puts a.join(" ") }
  end

  private
  def is_numeric(value)
    Integer(value) != nil rescue false
  end
end