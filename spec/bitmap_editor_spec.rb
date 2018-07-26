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
    STDOUT.should_receive(:puts).with('unrecognised command :(').exactly(1).times
    STDOUT.should_receive(:puts).exactly(1).times
    BitmapEditor.new.run"unrecognised-command.txt"
  end

  it 'should put correct number of \'O\' when command \'S\' is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(6).times
    STDOUT.should_receive(:puts).exactly(1).times
    BitmapEditor.new.run"s-command.txt"
  end

  it 'should change the value of a specific pixel when \'L\' command is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(5).times
    STDOUT.should_receive(:puts).with('O O O H O').exactly(1).times
    STDOUT.should_receive(:puts).exactly(1).times

    BitmapEditor.new.run"l-command.txt"
  end

  it 'should change the values of a numerous pixels when \'V\' command is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(3).times
    STDOUT.should_receive(:puts).with('O H O O O').exactly(3).times
    STDOUT.should_receive(:puts).exactly(1).times

    BitmapEditor.new.run"v-command.txt"
  end

  it 'should change the values of a numerous pixels when \'H\' command is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(5).times
    STDOUT.should_receive(:puts).with('O H H H O').exactly(1).times
    STDOUT.should_receive(:puts).exactly(1).times

    BitmapEditor.new.run"h-command.txt"
  end

  it 'should change the values back to starting values when \'C\' is present' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(11).times
    STDOUT.should_receive(:puts).with('O H H H O').exactly(1).times
    STDOUT.should_receive(:puts).exactly(2).times

    BitmapEditor.new.run"c-command.txt"
  end

  it 'should call the puts method with correct sequences on example file' do
    STDOUT.should_receive(:puts).with('O O O O O').exactly(1).times
    STDOUT.should_receive(:puts).with('O O Z Z Z').exactly(1).times
    STDOUT.should_receive(:puts).with('A W O O O').exactly(1).times
    STDOUT.should_receive(:puts).with('O W O O O').exactly(3).times
    STDOUT.should_receive(:puts).exactly(1).times

    BitmapEditor.new.run"test_input.txt"
  end

  it 'should give clear raise message on errors' do
    STDOUT.should_receive(:puts).with('Bitmap colour_horizontal_segement given incorrect parameters').exactly(1).times
    BitmapEditor.new.run"errors-command.txt"
  end
end