# frozen_string_literal: true

class Player
  def initialize(window)
    @window = window
    load_sprite
    initial_player_position
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move_left
    @x -= 3
  end

  def move_right
    @x += 3
  end

  private

  def load_sprite
    @image = Gosu::Image.new('assets/images/ship.png')
  end

  def initial_player_position
    @x = window_center_point
    @y = window_bottom_point
  end

  def window_center_point
    (@window.width / 2) - (@image.width / 2)
  end

  def window_bottom_point
    @window.height - @image.width
  end
end
