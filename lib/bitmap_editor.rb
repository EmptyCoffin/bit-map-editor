require '../lib/bitmap.dto'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).readlines.each do |line|
      command_info = line.split(' ')
      current_image = nil
      case command_info[0]
      when 'I'
          current_image = BitMap.new(command_info[1], command_info[2])
      when 'S'
          puts "There is no image"
      else
          puts 'unrecognised command :('
      end
    end
  end
end
