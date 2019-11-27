# frozen_string_literal: true

class Bullet
  attr_reader :x, :y, :radius

  def initialize(window, x, y)
    @x = x
    @y = y
    @window = window

    load_sprite

    Sfx.shoot
  end

  def update
    @y -= 3
  end

  def draw
    @image.draw(@x - radius, @y - radius, 1)
  end

  def out_of_bounds?
    (y + @radius).negative?
  end

  private

  def load_sprite
    @image = Gosu::Image.new('assets/images/bullet.png')
    @radius = (@image.width / 2)
  end
end
