
class Tarot_Reading
  attr_accessor :selected_cards

  def initialize(selected_cards = @selected_cards)
    @selected_cards = {}
  end

  def center_and_space_text(text)
    terminal_width = `tput cols`.to_i
    padding_size = [((terminal_width) - text.length) / 2, 0].max
    padding = "\n" + ' ' * (padding_size - 0.5)
    "#{padding}#{text}#{padding}" + "\n"
  end
    
  def display_options_as_menu
    prompt = TTY::Prompt.new

    choices = [
      { name: 'Pull a Card', value: :start_reading },
      { name: 'Quit', value: :quit }
    ]

    choice = prompt.select(center_and_space_text('Choose an option:'), choices)
  end

  def start_reading
    loop do
      card_options = [
        { number: "1", name: "The Fool", message: "It takes a 'fool' to chase their dreams, but an even bigger one not to." },
        { number: "2", name: "The Magician", message: "Do not 'go with the flow' if it will take you somewhere you do not want to go." },
        { number: "3", name: "The High Priestess", message: "The answer you seek is within. Do not ignore your gut instinct..." },
        { number: "4", name: "The Empress", message: "You will benefit from taking a break." },
        { number: "5", name: "The Sun", message: "Accept a positive opportunity that will be presented to you. It will play a great deal in your happiness down the line." },
        { number: "6", name: "The Lovers", message: "Remember that your feelings are valid and important too." }
      ]

        card = card_options.sample
        display_card(card)

        sleep 5

        choice = display_options_as_menu
        display_selected_cards && game_outro if choice == :quit

    end
  end

  def game_outro
    puts center_and_space_text("Thank you for using Madam.AI!")
    puts center_and_space_text("Developed by: Kiowa Scott")
    puts center_and_space_text("Namaste! ✨")
    exit
  end
  
  def display_card(card)
    puts center_and_space_text("You have pulled '#{card[:name]}'.")
    puts center_and_space_text("#{card[:message]}")
    selected_cards[card[:number]] = [card[:name]]
  end

  def display_selected_cards
    unless selected_cards.empty?
      puts center_and_space_text("Cards you picked:")
      selected_cards.each do |number, card|
        puts center_and_space_text("#{card}")
    end
    sleep 3
  end
end
end
