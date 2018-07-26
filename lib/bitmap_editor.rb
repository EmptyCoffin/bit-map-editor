require '../lib/bitmap.dto'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    current_image = nil

    begin
    File.open(file).readlines.each do |line|
      # separate command info to make it clearer when passing through methods
      command_info = line.split(' ')

        case command_info[0]
          when 'C'
            current_image.clear
          when 'H'
            current_image.colour_horizontal_segement(command_info[1], command_info[2], command_info[3], command_info[4])
          when 'I'
            current_image = BitMap.new(command_info[1], command_info[2])
          when 'L'
            current_image.colour_specific(command_info[1], command_info[2], command_info[3])
          when 'S'
            current_image.show_image
            # extra puts for space in the console
            puts
          when 'V'
            current_image.colour_vertical_segement(command_info[1], command_info[2], command_info[3], command_info[4])
          else
            puts 'unrecognised command :('
            # extra puts for space in the console
            puts
        end

      end

    rescue StandardError => e
      # catches errors and gives more readable message
      puts e.message
    end
  end
end
