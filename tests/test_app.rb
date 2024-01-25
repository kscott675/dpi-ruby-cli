# tarot_reading_test.rb
require 'minitest/autorun'
require_relative '/workspaces/fortune-teller-cli/tarot_reading.rb'

class Tarot_Reading_Test < Minitest::Test
  def test_display_no_cards
    tarot_reading = Tarot_Reading.new
    @selected_cards = {}
    result = assert_silent do
      tarot_reading.display_selected_cards
    end
    assert_equal true, result, "No output"
  end

  def test_card_memory
    tarot_reading = Tarot_Reading.new
    result = 0
    expected_output = 4
  
    4.times do
      card_options = [
        { number: "1", name: "The Fool", message: "It takes a 'fool' to chase their dreams, but an even bigger one not to." },
        { number: "2", name: "The Magician", message: "Do not 'go with the flow' if it will take you somewhere you do not want to go." },
        { number: "3", name: "The High Priestess", message: "The answer you seek is within. Do not ignore your gut instinct..." },
        { number: "4", name: "The Empress", message: "You will benefit from taking a break." },
        { number: "5", name: "The Sun", message: "Accept a positive opportunity that will be presented to you. It will play a great deal in your happiness down the line." },
        { number: "6", name: "The Lovers", message: "Remember that your feelings are valid and important too." }
      ]
  
      card = card_options.sample
      tarot_reading.display_card(card)
      result += 1
    end
  
    assert_equal expected_output, result, "Oops"
  end  
end
