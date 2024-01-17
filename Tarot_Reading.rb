class Tarot_Reading
  attr_reader :num_of_cards
  attr_reader :arcana_number
  


  def initialize(num_of_cards, arcana_number)
    
    self.num_of_cards = num_of_cards
    self.arcana_number = arcana_number

  end

  def num_of_cards(value)
    unless value.is_a?(Integer)
      raise TypeError, 'Card number must be an Integer'
    end
  @arcana_number = value.to_i
  end

  def arcana_number=(value)
    value = 0
    unless value.is_a?(Integer)
      raise TypeError, 'Card number must be an Integer'
    end
  @arcana_number = value.to_i
  end

  def self.read(arcana_number)
    puts "\nShuffling the cards....\n\n"
    sleep (1)
    options = {
      "1" => "You have pulled 'The Fool'.\nIt takes a 'fool' to chase their dreams in a world where practicality is praised.\nIf you can manage to put your feet on the ground while your head is in the clouds, you will be successful.",
      "2" => "You have pulled 'The Magician'.\nDo not 'go with the flow' if it will take you somewhere you do not want to go.",
      "3" => "You have pulled 'The High Priestess'.\nThe answer you seek is within. Do not ignore your gut instinct. Has it ever steered you wrong?",
      "4" => "You have pulled 'The Empress'.\nYou will benefit from taking a break.",
      "5" => "You have pulled 'The Sun'.\nAccept a positive opportunity that will be presented to you. \nIt will play a great deal in your happiness down the line.",
      "6" => "You have pulled 'The Lovers'.\nRemember that your feelings are valid and important too.",
      "default" => "Invalid option"
    }

    puts options.fetch(arcana_number.to_s.strip, "default")
  end
end
