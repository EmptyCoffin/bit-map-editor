require 'rspec'
require '../lib/bitmap_editor.rb'

describe 'loads file' do
  it 'should put error message on nil file' do
    STDOUT.should_receive(:puts).with('please provide correct file')
    BitmapEditor.new.run nil
  end

  it 'should put error message on non existent file' do
    STDOUT.should_receive(:puts).with('please provide correct file')
    BitmapEditor.new.run 'non-existent.txt'
  end

  it 'should put error message on file with unrecognisable command' do
    STDOUT.should_receive(:puts).with('unrecognised command :(')
    BitmapEditor.new.run"unrecognised-command.txt"
  end

  it 'should put correct number of \'O\' when command \'S\' is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(6).times
    BitmapEditor.new.run"s-command.txt"
  end
end