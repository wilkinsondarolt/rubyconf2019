# frozen_string_literal: true

class Game < Gosu::Window
  HEIGHT = 400
  WIDTH = 400
  ENEMY_SPAWN_RATIO = 3

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Back to end'
    @player = Player.new(self)
    @font = Gosu::Font.new(30)
    @background = Gosu::Image.new('assets/images/background.png')
    @score = 0
    @enemies = []
    @bullets = []
    @explosions = []
  end

  def draw
    @background.draw(0, 0, 0)

    @player.draw
    @enemies.each(&:draw)
    @bullets.each(&:draw)
    @explosions.each(&:draw)

    draw_score
  end

  def update
    spawn_enemy if spawn_new_enemy?
    check_collision

    @player.update
    @enemies.each(&:update)
    @bullets.each(&:update)

    clear_unused_enemies
    clear_unused_bullets
    clear_unused_explosions
  end

  def button_down(id)
    player_shoot if id == Gosu::KbSpace
  end

  private

  def spawn_enemy
    @enemies << Enemy.new(self)
  end

  def player_shoot
    @bullets << @player.shoot
  end

  def spawn_new_enemy?
    rand(1..100) < ENEMY_SPAWN_RATIO
  end

  def check_collision
    @enemies.each do |enemy|
      @bullets.each do |bullet|
        if colliding?(enemy, bullet)
          @score += 100
          explode_enemy(enemy)

          @bullets.delete(bullet)
          @enemies.delete(enemy)
        end
      end
    end
  end

  def explode_enemy(enemy)
    @explosions << enemy.explode
  end

  def colliding?(enemy, bullet)
    distance = Gosu.distance(
      enemy.x,
      enemy.y,
      bullet.x,
      bullet.y
    )

    distance < (enemy.radius + bullet.radius)
  end

  def clear_unused_enemies
    enemy_count = @enemies.count
    @enemies.reject!(&:out_of_bounds?)

    @score -= (enemy_count - @enemies.count) * 50
  end

  def clear_unused_bullets
    bullet_count = @bullets.count
    @bullets.reject!(&:out_of_bounds?)

    @score -= (bullet_count - @bullets.count) * 10
  end

  def clear_unused_explosions
    @explosions.reject!(&:finished?)
  end

  def draw_score
    @font.draw_text(
      "Score: #{@score}",
      0,
      0,
      3,
      1,
      1,
      Gosu::Color::BLACK
    )
  end
end
