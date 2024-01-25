require 'pastel'
require 'tty-prompt'

class TarotApp
  def initialize
    @pastel = Pastel.new
    @prompt = TTY::Prompt.new
    @tarot_cards = {
      "1" => "You have pulled 'The Fool'. It takes a 'fool' to chase their dreams in a world where practicality is praised. If you can manage to put your feet on the ground while your head is in the clouds, you will be successful.",
      "2" => "You have pulled 'The Magician'. Do not 'go with the flow' if it will take you somewhere you do not want to go.",
      "3" => "You have pulled 'The High Priestess'. The answer you seek is within. Do not ignore your gut instinct. Has it ever steered you wrong?",
      "4" => "You have pulled 'The Empress'. You will benefit from taking a break.",
      "5" => "You have pulled 'The Sun'. Accept a positive opportunity that will be presented to you. It will play a great deal in your happiness down the line.",
      "6" => "You have pulled 'The Lovers'. Remember that your feelings are valid and important too.",
    }
  end

  def run
    display_welcome_message

    loop do
      menu_choice = @prompt.select("Choose an option:", %w(Read Quit), per_page: 2)

      case menu_choice
      when 'Read'
        perform_tarot_reading
      when 'Quit'
        break
      end
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts @pastel.bold.underline.lilac("Welcome to the Tarot App!")
    puts @pastel.brown("Let the magic guide you...\n")
  end

  def perform_tarot_reading
    card_number = @prompt.select("Choose a tarot card:", @tarot_cards.keys)
    card_name = "The #{tarot_card_name(card_number)}"
    card_description = @tarot_cards[card_number]

    display_ascii_art(card_name)
    puts @pastel.bold.underline("Card Reading:")
    puts @pastel.gold("#{card_name}: #{card_description}\n")
  end

  def tarot_card_name(number)
    case number
    when '1' then 'Fool'
    when '2' then 'Magician'
    when '3' then 'High Priestess'
    when '4' then 'Empress'
    when '5' then 'Sun'
    when '6' then 'Lovers'
    else 'Unknown'
    end
  end

  def display_ascii_art(card_name)
    # ASCII art for demonstration, replace with actual art
    art = case card_name
          when 'The Fool'
            <<~ART
              .------.
              |The   |
              | Fool |
              '------'
            ART
          else
            "Art not available"
          end

    puts @pastel.gold(art)
  end

  def display_goodbye_message
    puts @pastel.bold.underline.red("\nThank you for using the Tarot App!")
  end
end

# Run the TarotApp
TarotApp.new.run
