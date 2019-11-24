# frozen_string_literal: true

class Sfx
  class << self
    def explosion
      @explosion_sound ||= Gosu::Sample.new('assets/sounds/explosion.ogg')
      @explosion_sound.play
    end

    def shoot
      @shoot_sound ||= Gosu::Sample.new('assets/sounds/shoot.ogg')
      @shoot_sound.play
    end
  end
end
