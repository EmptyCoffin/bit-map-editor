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

  describe 'Show' do
    it 'should put current image to console' do
      image = BitMap.new '4', '5'
      STDOUT.should_receive(:puts).with('O O O O').exactly(5).times
      image.show_image
    end
  end

end