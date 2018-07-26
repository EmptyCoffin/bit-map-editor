require 'rspec'
require '../lib/bitmap.dto.rb'

describe 'Bit Map' do

  describe 'Create' do
    it 'should throw exception with non number width' do
      expect { BitMap.new 'abd', 5 }.to raise_error('Bitmap initialize given incorrect parameters')
    end

    it 'should throw exception with non number height' do
      expect { BitMap.new 5, 'abc' }.to raise_error('Bitmap initialize given incorrect parameters')
    end

    it 'should throw exception with non number height and width' do
      expect { BitMap.new 'def', 'abc' }.to raise_error('Bitmap initialize given incorrect parameters')
    end

    it 'should initialise with correct length and width' do
      image = BitMap.new 4, 5
      expect(image.current_image.length).to eq(5)
      image.current_image.each {|i| expect(i.length).to eq(4)}
    end

    it 'should initialise with correct length and width as strings' do
      image = BitMap.new '4', '5'
      expect(image.current_image.length).to eq(5)
      image.current_image.each {|i| expect(i.length).to eq(4)}
    end

    it 'should initialise all items with default value \'O\'' do
      image = BitMap.new '4', '5'
      image.current_image.each { |i| i.each {|j| expect(j).to eq('O')}}
    end
  end

  describe 'Colour Specific' do
    before(:each) do
      @image = BitMap.new '6', 5
    end

    it 'should throw exception with non number on row' do
      expect { @image.colour_specific 'abc', 6, 'B' }.to raise_error('Bitmap colour_specific given incorrect parameters')
    end

    it 'should throw exception with non number on column' do
      expect { @image.colour_specific 4, 'abc', 'B' }.to raise_error('Bitmap colour_specific given incorrect parameters')
    end

    it 'should throw exception with non number on row and column' do
      expect { @image.colour_specific 'abc', 'abc', 'B' }.to raise_error('Bitmap colour_specific given incorrect parameters')
    end

    it 'should maintain original values if colour specific range out of range' do
      @image = BitMap.new '1', 1
      expect { @image.colour_specific '6', '5', 'B' }.to raise_error('Bitmap colour_specific given out of range values')
    end

    it 'should alter the value of specific pixel' do
      STDOUT.should_receive(:puts).with('O O O O O O').exactly(5).times
      @image.show_image

      @image.colour_specific 2, 3, 'B'

      STDOUT.should_receive(:puts).with('O O O O O O').exactly(4).times
      STDOUT.should_receive(:puts).with('O B O O O O').exactly(1).times
      @image.show_image
    end
  end

  describe 'Vertical segement colour' do
    before(:each) do
      @image = BitMap.new '6', 5
    end

    it 'should throw exception when non number on row' do
      expect { @image.colour_vertical_segement 'abc', 6, '7', 'B' }.to raise_error('Bitmap colour_vertical_segement given incorrect parameters')
    end

    it 'should throw exception when non number on column' do
      expect { @image.colour_vertical_segement '4', 'abc', 6, 'B' }.to raise_error('Bitmap colour_vertical_segement given incorrect parameters')
    end

    it 'should throw exception when non number on row and column' do
      expect { @image.colour_vertical_segement 4, '5', 'B', 'B' }.to raise_error('Bitmap colour_vertical_segement given incorrect parameters')
    end

    it 'should throw exception when start row out of range' do
      @image = BitMap.new '1', 2
      expect { @image.colour_vertical_segement '4', 1, '1', 'B' }.to raise_error('Bitmap colour_vertical_segement given out of range values')
    end

    it 'should throw exception when end row out of range' do
      @image = BitMap.new '1', 2
      expect { @image.colour_vertical_segement '1', '4', 1, 'B' }.to raise_error('Bitmap colour_vertical_segement given out of range values')
    end

    it 'should throw exception when column out of range' do
      @image = BitMap.new '1', 2
      expect { @image.colour_vertical_segement 1, 1, 7, 'B'}.to raise_error('Bitmap colour_vertical_segement given out of range values')
    end

    it 'should alter the value of specific pixels' do
      STDOUT.should_receive(:puts).with('O O O O O O').exactly(5).times
      @image.show_image

      @image.colour_vertical_segement 4, 1, 3, 'B'

      STDOUT.should_receive(:puts).with('O O O B O O').exactly(3).times
      STDOUT.should_receive(:puts).with('O O O O O O').exactly(2).times
      @image.show_image
    end
  end

  describe 'Horizontal segement colour' do
    before(:each) do
      @image = BitMap.new '6', 5
    end

    it 'should throw exception when non number on row' do
      expect { @image.colour_horizontal_segement 'abc', 6, '7', 'B' }.to raise_error('Bitmap colour_horizontal_segement given incorrect parameters')
    end

    it 'should throw exception when non number on column' do
      expect { @image.colour_horizontal_segement '4', 'abc', 6, 'B' }.to raise_error('Bitmap colour_horizontal_segement given incorrect parameters')
    end

    it 'should throw exception when non number on row and column' do
      expect { @image.colour_horizontal_segement 4, '5', 'B', 'B' }.to raise_error('Bitmap colour_horizontal_segement given incorrect parameters')
    end

    it 'should throw exception when start column out of range' do
      @image = BitMap.new '2', 1
      expect { @image.colour_horizontal_segement '4', 1, '1', 'B' }.to raise_error('Bitmap colour_horizontal_segement given out of range values')
    end

    it 'should throw exception when end column out of range' do
      @image = BitMap.new '2', 1
      expect { @image.colour_horizontal_segement '1', '4', 1, 'B' }.to raise_error('Bitmap colour_horizontal_segement given out of range values')
    end

    it 'should throw exception when row out of range' do
      @image = BitMap.new '2', 1
      expect { @image.colour_horizontal_segement 1, 1, 7, 'B'}.to raise_error('Bitmap colour_horizontal_segement given out of range values')
    end

    it 'should alter the value of specific pixels' do
      STDOUT.should_receive(:puts).with('O O O O O O').exactly(5).times
      @image.show_image

      @image.colour_horizontal_segement 2, 5, 3, 'B'

      STDOUT.should_receive(:puts).with('O B B B B O').exactly(1).times
      STDOUT.should_receive(:puts).with('O O O O O O').exactly(4).times
      @image.show_image
    end
  end

  describe 'Clear' do
    it 'should raise an exception if current image has no length' do
      @image = BitMap.new '0', 0
      STDOUT.should_not_receive(:puts)
      @image.show_image

      expect { @image.clear }.to raise_error('Bitmap clear cannot clear an empty image')
    end

    it 'should reset all pixels to \'O\'' do
      @image = BitMap.new '6', 5
      STDOUT.should_receive(:puts).with('O O O O O O').exactly(5).times
      @image.show_image

      @image.colour_horizontal_segement 2, 5, 3, 'B'

      STDOUT.should_receive(:puts).with('O B B B B O').exactly(1).times
      STDOUT.should_receive(:puts).with('O O O O O O').exactly(4).times
      @image.show_image

      @image.clear
      STDOUT.should_receive(:puts).with('O B B B B O').exactly(0).times
      STDOUT.should_receive(:puts).with('O O O O O O').exactly(5).times
      @image.show_image
    end
  end

  describe 'Show' do
    it 'should put current image to console' do
      image = BitMap.new '4', '5'
      STDOUT.should_receive(:puts).with('O O O O').exactly(5).times
      image.show_image
    end
  end

end