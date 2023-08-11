class SceneExperience < ApplicationRecord
  belongs_to :user

  validates :experience_scene, presence: true
  validates :xp, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_save :check_for_badge

  MAX_XP = 3 # 3回投稿でゲージマックス

  private

  def check_for_badge
    if user.scene_experiences.all? { |exp| exp.xp >= MAX_XP }
      user.update(has_clear_badge: true)
    end
  end
end