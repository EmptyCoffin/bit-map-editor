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

  it 'should change the value of a specific pixel when \'L\' command is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(5).times
    STDOUT.should_receive(:puts).with('O O O H O').exactly(1).times

    BitmapEditor.new.run"l-command.txt"
  end

  it 'should change the values of a numerous pixels when \'V\' command is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(3).times
    STDOUT.should_receive(:puts).with('O H O O O').exactly(3).times

    BitmapEditor.new.run"v-command.txt"
  end

  it 'should change the values of a numerous pixels when \'H\' command is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(5).times
    STDOUT.should_receive(:puts).with('O H H H O').exactly(1).times

    BitmapEditor.new.run"h-command.txt"
  end

  it 'should change the values back to starting values when \'C\' is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(11).times
    STDOUT.should_receive(:puts).with('O H H H O').exactly(1).times

    BitmapEditor.new.run"c-command.txt"
  end

end