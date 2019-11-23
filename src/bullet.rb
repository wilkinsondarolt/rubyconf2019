# frozen_string_literal: true

class Bullet
  DIRECTIONS = {
    up: -1,
    down: 1
  }.freeze

  def initialize(window, x, y, direction)
    @x = x
    @y = y
    @speed = DIRECTIONS[direction]
    @window = window

    load_sprite
  end

  def update
    @y += @speed
  end

  def draw
    @image.draw(@x - (@image.width / 2), @y - (@image.width / 2), 1)
  end

  private

  def load_sprite
    @image = Gosu::Image.new('assets/images/bullet.png')
  end
end
