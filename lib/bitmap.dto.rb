class BitMap
  attr_accessor :current_image

  def initialize(width, height)
    raise 'Bitmap initialised with incorrect parameters' if !is_numeric(width) || !is_numeric(height)
    @current_image = Array.new(height.to_i){ Array.new(width.to_i, 'O') }
  end

  private
  def is_numeric(value)
    Integer(value) != nil rescue false
  end
end