# frozen_string_literal: true

class Player
  attr_reader :x, :y, :radius

  def initialize(window)
    @window = window
    load_sprite
    initial_position
  end

  def draw
    @image.draw(@x - @radius, @y - @radius, 1)
  end

  def update
    move_left if @window.button_down?(Gosu::KbLeft)
    move_right if @window.button_down?(Gosu::KbRight)
  end

  def shoot
    Bullet.new(@window, @x, @y, :up)
  end

  private

  def load_sprite
    @image = Gosu::Image.new('assets/images/ship.png')
    @radius = (@image.width / 2)
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
