# frozen_string_literal: true

class Explosion
  def initialize(window, x, y)
    load_sprite_sheet
    @x = x
    @y = y
    @window = window

    Sfx.explosion
  end

  def draw
    unless finished?
      current_sprite.draw(@x - @radius, @y - @radius, 2)
      @image_index += 1
    end
  end

  def finished?
    @image_index == @image_count
  end

  private

  def load_sprite_sheet
    @images = Gosu::Image.load_tiles('assets/images/explosions.png', 60, 60)
    @radius = (@images[0].width / 2)
    @image_index = 0
    @image_count = @images.count
    @finished = false
  end

  def current_sprite
    @images[@image_index]
  end
end
