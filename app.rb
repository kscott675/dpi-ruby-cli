begin
  require 'tty-prompt'
rescue LoadError
  puts "TTY::Prompt not installed. Please install it using: gem install tty-prompt"
  exit
end

require_relative "tarot_reading"

  class App
    attr_reader :spread
    attr_accessor :name

    def initialize(spread = Tarot_Reading.new, name = "")
      @spread = spread
      @name = name
    end

    def start
      print spread.center_and_space_text("Hi! What's your name?")
      puts spread.center_and_space_text("")
      puts spread.center_and_space_text("Press CTRL + Z to exit")
      puts spread.center_and_space_text("")

      name = gets.chomp

      if name.empty?
        name = "Buddy"
      else 
        name = name.to_s
      end

      @name = name.capitalize

      puts spread.center_and_space_text("Welcome to Madam.AI, #{@name}!")

        loop do
        choice = spread.display_options_as_menu
          case choice
          when :start_reading
            spread.start_reading
          when :quit
            spread.game_outro
          end
        end
    end
  end

  reading = App.new
  reading.start
