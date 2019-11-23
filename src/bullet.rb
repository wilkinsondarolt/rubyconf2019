# frozen_string_literal: true

class Bullet
  attr_reader :x, :y, :radius

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
    @image.draw(@x - radius, @y - radius, 1)
  end

  private

  def load_sprite
    @image = Gosu::Image.new('assets/images/bullet.png')
    @radius = (@image.width / 2)
  end
end
