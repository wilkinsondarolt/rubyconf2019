# frozen_string_literal: true

class Player
  def initialize(window)
    @window = window
    load_sprite
    initial_position
  end

  def draw
    @image.draw(@x - (@image.width / 2), @y - (@image.height / 2), 1)
  end

  def update
    move_left if @window.button_down?(Gosu::KbLeft)
    move_right if @window.button_down?(Gosu::KbRight)
  end

  private

  def load_sprite
    @image = Gosu::Image.new('assets/images/ship.png')
  end

  def initial_position
    @x = (@window.width / 2)
    @y = @window.height - (@image.height / 2)
  end

  def move_left
    @x -= 3
  end

  def move_right
    @x += 3
  end
end
