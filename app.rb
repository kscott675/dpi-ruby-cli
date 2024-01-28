begin
  require "tty-prompt"
rescue LoadError
  puts "TTY::Prompt not installed."
  puts "It will be automatically installed using: gem install tty-prompt in 10 seconds"
  puts "Press CTRL + C to cancel"
  sleep 10
  puts "Now installing... Enjoy your game!"
  result = `gem install tty-prompt`
  puts result
  sleep 10
rescue InputInterrupt
  spread.game_outro
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
      begin
      puts spread.center_and_space_text("Madam.AI: Command Line Psychic")
      print spread.center_and_space_text("Hi! What's your name?")
      puts spread.center_and_space_text("Press CTRL + C to exit")

      name = gets.chomp

      if name.empty?
        name = "Buddy"
      else 
        name = name.to_s
      end

      @name = name.capitalize

      puts spread.center_and_space_text("Welcome to Madam.AI, #{@name}!")
      sleep 2
      puts spread.center_and_space_text("Press CTRL + C or 'Quit' to exit")
      
        loop do
        choice = spread.display_options_as_menu
          case choice
          when :start_reading
            spread.start_reading
          when :quit
            spread.game_outro
          end
        end
      rescue Interrupt
        spread.display_selected_cards
        spread.game_outro
      end
    end
  end

  reading = App.new
  reading.start
