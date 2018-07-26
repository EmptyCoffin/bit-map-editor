require 'rspec'
require '../lib/bitmap.dto.rb'

describe 'Bit Map' do

  describe 'Create' do
    it 'should throw exception with non number width' do
      expect { BitMap.new 'abd', 5 }.to raise_error('Bitmap initialised with incorrect parameters')
    end

    it 'should throw exception with non number height' do
      expect { BitMap.new 5, 'abc' }.to raise_error('Bitmap initialised with incorrect parameters')
    end

    it 'should throw exception with non number height and width' do
      expect { BitMap.new 'def', 'abc' }.to raise_error('Bitmap initialised with incorrect parameters')
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

  describe 'Show' do
    it 'should put current image to console' do
      image = BitMap.new '4', '5'
      STDOUT.should_receive(:puts).with('O O O O').exactly(5).times
      image.show_image
    end
  end

end