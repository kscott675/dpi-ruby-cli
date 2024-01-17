require_relative "Tarot_Reading"

class App
  attr_accessor :arcana_number
  attr_reader :name

  def initialize(arcana_number, name)
    @arcana_number = arcana_number
    self.name = name
  end

  def name=(value)
    unless value.is_a?(String)
      raise TypeError, 'First name must be a string'
    end

    @name = value.capitalize
  end


  def run_tarot_reading
  tries = 0
  loops = 0
  choice_to_retry = 2

    begin
      puts "Welcome to Madam.AI!"
      sleep 1
      puts "May I have your name?"
      self.name = gets.chomp
      puts "\n"
      puts "."
      puts "."
      puts "\0Hello #{@name}! \n"
      loop do
        #changing the number so the card isnt predictable, keeps it spicy
      if loops > 0
        @arcana_number = rand(1..6)
      else
        loops += 1
      end
      puts "\nPlease enter a number from 1 to 6 to get your fortune & advice!"
      puts "\nPress 0 to cancel."
      @arcana_number = gets.chomp.to_i

      if @arcana_number == 0 
        puts "\nThank you for playing Madam.AI"
        puts "Developed by: Kiowa Scott"
        puts "Namaste! ✨"
        exit
      elsif !@arcana_number.between?(1, 6) && tries < 3
          raise ArgumentError
      else
        Tarot_Reading.read(@arcana_number)
        sleep 3
        puts "\nWould you like to pull another card?"
        puts "\n1 for 'YES', and any other key for 'NO'"
        choice_to_retry = gets.chomp.to_i

      end

      break if tries >= 3 || choice_to_retry != 1

    rescue ArgumentError
      tries += 1
      puts "You have entered an incorrect number. Please try again. \nYou have #{3-tries} tries left"
      sleep 2
    end

    end while choice_to_retry == 1
    puts "\nThank you for playing Madam.AI"
    puts "Developed by: Kiowa Scott"
    puts "Namaste! ✨"
    
  end
end

app = App.new(nil, "")
app.run_tarot_reading
