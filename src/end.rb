class End
  def initialize(window, score)
    @window = window
    @score = score
    @font = Gosu::Font.new(18)
  end

  def draw
    @font.draw_text(
      'Oh no! The front end techs were too much for you :(',
      0,
      0,
      3,
      1,
      1,
      Gosu::Color::RED
    )

    @font.draw_text(
      "Your final score was #{@score}",
      0,
      200,
      3,
      1,
      1,
      Gosu::Color::FUCHSIA
    )

    @font.draw_text(
      'Press any key to restart.',
      0,
      380,
      3,
      1,
      1,
      Gosu::Color::AQUA
    )
  end

  def button_down(id)
    @window.transition_to(:game)
  end
end
