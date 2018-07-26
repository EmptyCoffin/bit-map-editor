require '../lib/bitmap.dto'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    current_image = nil

    File.open(file).readlines.each do |line|
      command_info = line.split(' ')

      case command_info[0]
        when 'C'
          current_image.clear
        when 'I'
          current_image = BitMap.new(command_info[1], command_info[2])
        when 'L'
          current_image.colour_specific(command_info[1], command_info[2], command_info[3])
        when 'V'
          current_image.colour_vertical_segement(command_info[1], command_info[2], command_info[3], command_info[4])
        when 'H'
          current_image.colour_horizontal_segement(command_info[1], command_info[2], command_info[3], command_info[4])
        when 'S'
          current_image.show_image
        else
          puts 'unrecognised command :('
      end
    end
  end
end
